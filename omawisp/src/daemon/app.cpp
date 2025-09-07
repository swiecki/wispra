#include "app.hpp"
#include <iostream>
#include <filesystem>
#include <unistd.h>
#include <fcntl.h>
#include <cstring>
#include <csignal>
#include <cstdio>

namespace fs = std::filesystem;

namespace omawisp {
static std::string default_socket(){
    const char* home = getenv("HOME");
    std::string base = home ? std::string(home) + "/.local/run" : "/tmp";
    fs::create_directories(base);
    return base + "/omawisp.sock";
}

int App::run(int argc, char** argv){
    // basic flags
    for(int i=1;i<argc;++i){
        std::string a = argv[i];
        if(a=="--debug") cfg_.debug = true;
        else if(a=="--config" && i+1<argc) cfg_ = ConfigLoader::load(argv[++i]);
    }
    socket_path_ = default_socket();

    // logging
    {
        const char* home = getenv("HOME");
        std::string dir = (home?std::string(home):std::string("/tmp")) + "/.local/state/omawisp/logs";
        fs::create_directories(dir);
        std::string path = dir + "/omawisp.log";
        log_fp_ = fopen(path.c_str(), "a");
    }

    vad_.init(cfg_.vad.aggressiveness);

    run_server();
    if(log_fp_) { fclose(log_fp_); log_fp_ = nullptr; }
    return 0;
}

void App::run_server(){
    // create UNIX socket
    srv_fd_ = ::socket(AF_UNIX, SOCK_STREAM, 0);
    if(srv_fd_ < 0){ perror("socket"); return; }
    sockaddr_un addr{}; addr.sun_family = AF_UNIX;
    std::strncpy(addr.sun_path, socket_path_.c_str(), sizeof(addr.sun_path)-1);
    ::unlink(addr.sun_path);
    if(::bind(srv_fd_, (sockaddr*)&addr, sizeof(addr)) < 0){ perror("bind"); return; }
    ::listen(srv_fd_, 4);

    if(cfg_.debug) std::cerr << "omawispd listening on " << socket_path_ << std::endl;
    log(std::string("listening ")+socket_path_);

    while(running_.load()){
        int cfd = ::accept(srv_fd_, nullptr, nullptr);
        if(cfd < 0) continue;
        handle_client(cfd);
        ::close(cfd);
    }
}

void App::handle_client(int cfd){
    char buf[128]{}; ssize_t n = ::read(cfd, buf, sizeof(buf)-1);
    if(n <= 0) return;
    std::string cmd(buf, buf+n);
    if(cmd.find("START") == 0){ start_ptt(); ::write(cfd, "OK", 2); }
    else if(cmd.find("STOP") == 0){ stop_ptt(); ::write(cfd, "OK", 2); }
    else if(cmd.find("STATUS") == 0){
        std::string s = std::string("active=") + (is_active_?"1":"0") +
            ",ttff_ms=" + std::to_string(metrics_.ttff_ms.load()) +
            ",finalize_ms=" + std::to_string(metrics_.finalize_ms.load()) + "\n";
        ::write(cfd, s.c_str(), s.size());
    } else if(cmd.find("CONFIG_PRINT") == 0){
        // write effective config as text
        // For simplicity, blocking write into socket
        FILE* fp = fdopen(dup(cfd), "w");
        if(fp){ ConfigLoader::print(cfg_); fclose(fp);} else { ::write(cfd, "ERR", 3);}    }
}

void App::start_ptt(){
    if(is_active_.exchange(true)) return; // already started
    log("START");
    session_start_ = std::chrono::steady_clock::now();
    ttff_mark_ = {};

    ring_.set_read_from_preroll((size_t)cfg_.audio.preroll_ms * (size_t)cfg_.audio.sample_rate / 1000);

    auto on_frame = [this](const int16_t* pcm, size_t n){
        ring_.write(pcm, n);
        trans_.add_audio(pcm, n);
        if(cfg_.debug){
            auto p = trans_.partial();
            if(!p.text.empty() && ttff_mark_.time_since_epoch().count()==0){
                ttff_mark_ = std::chrono::steady_clock::now();
                metrics_.ttff_ms = std::chrono::duration_cast<std::chrono::milliseconds>(ttff_mark_ - session_start_).count();
                std::cerr << "partial: " << p.text << std::endl;
            } else if(!p.text.empty()) {
                std::cerr << "partial: " << p.text << std::endl;
            }
        }
    };

    bool ok = false;
    if(cfg_.audio.backend=="pipewire"){
        ok = pw_.start(cfg_.audio.sample_rate, cfg_.audio.frame_ms, cfg_.audio.device, on_frame);
    }
    if(!ok && cfg_.audio.backend=="alsa"){
        ok = alsa_.start(cfg_.audio.sample_rate, cfg_.audio.frame_ms, cfg_.audio.device, on_frame);
    }
    if(!ok){
        // try fallback to ALSA
        ok = alsa_.start(cfg_.audio.sample_rate, cfg_.audio.frame_ms, cfg_.audio.device, on_frame);
    }
    if(!ok){
        std::cerr << "Audio backend failed to start" << std::endl;
        is_active_ = false;
    }
}

void App::stop_ptt(){
    if(!is_active_.exchange(false)) return;
    log("STOP");
    alsa_.stop();
    pw_.stop();

    auto t0 = std::chrono::steady_clock::now();
    std::string final = trans_.finalize();

    // Optional external cleanup (OpenAI-compatible)
    if(cfg_.cleanup.enabled && !cfg_.cleanup.endpoint_url.empty()){
        std::string cmd = "curl -sS --max-time " + std::to_string(cfg_.cleanup.timeout_ms/1000) +
            " -H 'Content-Type: application/json'" +
            (cfg_.cleanup.api_key.empty()?"":(" -H 'Authorization: Bearer " + cfg_.cleanup.api_key + "'")) +
            " --data '" +
            std::string("{\"model\":\"omawisp-clean\",\"messages\":[{\"role\":\"system\",\"content\":\"Rewrite for clarity and punctuation.\"},{\"role\":\"user\",\"content\":\"") +
            final + "\"}]}' " + cfg_.cleanup.endpoint_url;
        FILE* fp = popen(cmd.c_str(), "r");
        if(fp){
            std::string json; char buf[1024]; size_t n;
            while((n=fread(buf,1,sizeof(buf),fp))>0) json.append(buf,n);
            pclose(fp);
            // naive parse for choices[0].message.content
            auto i = json.find("\"content\":");
            if(i!=std::string::npos){
                i = json.find('"', i+10);
                auto j = json.find('"', i+1);
                if(i!=std::string::npos && j!=std::string::npos && j>i) final = json.substr(i+1, j-i-1);
            }
        }
    }

    out_.paste_final(final);

    auto t1 = std::chrono::steady_clock::now();
    metrics_.finalize_ms = std::chrono::duration_cast<std::chrono::milliseconds>(t1 - t0).count();
}

void App::log(const std::string& line){
    if(!log_fp_) return;
    auto now = std::chrono::system_clock::to_time_t(std::chrono::system_clock::now());
    char ts[32]; std::strftime(ts, sizeof(ts), "%F %T", std::localtime(&now));
    fprintf(log_fp_, "%s %s\n", ts, line.c_str());
    fflush(log_fp_);
}
}