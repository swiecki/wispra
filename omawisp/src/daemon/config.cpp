#include "config.hpp"
#include <filesystem>
#include <fstream>
#include <iostream>
#include <regex>

namespace fs = std::filesystem;

namespace omawisp {
static std::string expand_home(const std::string& p){
    if(p.rfind("~",0)==0){
        const char* home = getenv("HOME");
        if(home) return std::string(home) + p.substr(1);
    }
    return p;
}

static void parse_kv(const std::string& line, std::string& section, AppConfig& cfg){
    static const std::regex kv_re("\\s*([A-Za-z0-9_]+)\\s*=\\s*(.*)\\s*");
    std::smatch m;
    if(!std::regex_match(line, m, kv_re)) return;
    auto key = m[1].str();
    auto val = m[2].str();
    if(!val.empty() && val.front()=='"' && val.back()=='"') {
        val = val.substr(1, val.size()-2);
    }

    auto to_bool = [](const std::string& s){ return s=="true" || s=="1"; };
    auto to_int = [](const std::string& s){ return std::stoi(s); };

    if(section=="model"){
        if(key=="path") cfg.model.path = expand_home(val);
        else if(key=="threads") cfg.model.threads = to_int(val);
        else if(key=="english_only") cfg.model.english_only = to_bool(val);
        else if(key=="beam_size") cfg.model.beam_size = to_int(val);
    } else if(section=="audio"){
        if(key=="backend") cfg.audio.backend = val;
        else if(key=="device") cfg.audio.device = val;
        else if(key=="sample_rate") cfg.audio.sample_rate = to_int(val);
        else if(key=="frame_ms") cfg.audio.frame_ms = to_int(val);
        else if(key=="preroll_ms") cfg.audio.preroll_ms = to_int(val);
    } else if(section=="vad"){
        if(key=="enabled") cfg.vad.enabled = to_bool(val);
        else if(key=="aggressiveness") cfg.vad.aggressiveness = to_int(val);
        else if(key=="min_speech_ms") cfg.vad.min_speech_ms = to_int(val);
        else if(key=="max_silence_ms") cfg.vad.max_silence_ms = to_int(val);
    } else if(section=="output"){
        if(key=="mode") cfg.output.mode = val;
        else if(key=="use_hyprctl") cfg.output.use_hyprctl = to_bool(val);
        else if(key=="use_wtype_fallback") cfg.output.use_wtype_fallback = to_bool(val);
    } else if(section=="cleanup"){
        if(key=="enabled") cfg.cleanup.enabled = to_bool(val);
        else if(key=="endpoint_url") cfg.cleanup.endpoint_url = val;
        else if(key=="api_key") cfg.cleanup.api_key = val;
        else if(key=="timeout_ms") cfg.cleanup.timeout_ms = to_int(val);
    }
}

AppConfig ConfigLoader::load(const std::string& path){
    AppConfig cfg;
    std::string cfg_path = path;
    if(cfg_path.empty()){
        const char* home = getenv("HOME");
        if(home){
            cfg_path = std::string(home) + "/.config/omawisp/config.toml";
        } else cfg_path = ".omawisp.toml";
    }

    cfg.config_path = cfg_path;
    if(!fs::exists(cfg_path)) return cfg;

    std::ifstream in(cfg_path);
    std::string line; std::string section;
    while(std::getline(in,line)){
        std::string s = line;
        // strip comments
        auto hash = s.find('#');
        if(hash!=std::string::npos) s = s.substr(0, hash);
        // trim
        auto l = s.find_first_not_of(" \t");
        auto r = s.find_last_not_of(" \t");
        if(l==std::string::npos){ continue; }
        s = s.substr(l, r-l+1);
        if(s.size()>=3 && s.front()=='[' && s.back()==']'){
            section = s.substr(1, s.size()-2);
            continue;
        }
        parse_kv(s, section, cfg);
    }
    return cfg;
}

void ConfigLoader::print(const AppConfig& cfg){
    std::cout << "[model]\n"
              << "path = \"" << cfg.model.path << "\"\n"
              << "threads = " << cfg.model.threads << "\n"
              << "english_only = " << (cfg.model.english_only?"true":"false") << "\n"
              << "beam_size = " << cfg.model.beam_size << "\n\n";
    std::cout << "[audio]\n"
              << "backend = \"" << cfg.audio.backend << "\"\n"
              << "device = \"" << cfg.audio.device << "\"\n"
              << "sample_rate = " << cfg.audio.sample_rate << "\n"
              << "frame_ms = " << cfg.audio.frame_ms << "\n"
              << "preroll_ms = " << cfg.audio.preroll_ms << "\n\n";
    std::cout << "[vad]\n"
              << "enabled = " << (cfg.vad.enabled?"true":"false") << "\n"
              << "aggressiveness = " << cfg.vad.aggressiveness << "\n"
              << "min_speech_ms = " << cfg.vad.min_speech_ms << "\n"
              << "max_silence_ms = " << cfg.vad.max_silence_ms << "\n\n";
    std::cout << "[output]\n"
              << "mode = \"" << cfg.output.mode << "\"\n"
              << "use_hyprctl = " << (cfg.output.use_hyprctl?"true":"false") << "\n"
              << "use_wtype_fallback = " << (cfg.output.use_wtype_fallback?"true":"false") << "\n\n";
    std::cout << "[cleanup]\n"
              << "enabled = " << (cfg.cleanup.enabled?"true":"false") << "\n"
              << "endpoint_url = \"" << cfg.cleanup.endpoint_url << "\"\n"
              << "api_key = \"" << (cfg.cleanup.api_key.empty()?"":"***") << "\"\n"
              << "timeout_ms = " << cfg.cleanup.timeout_ms << "\n";
}
}
