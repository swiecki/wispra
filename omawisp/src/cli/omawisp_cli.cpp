#include <iostream>
#include <string>
#include <sys/socket.h>
#include <sys/un.h>
#include <unistd.h>
#include <filesystem>
#include "../daemon/config.hpp"

namespace fs = std::filesystem;

static std::string default_socket(){
    const char* home = getenv("HOME");
    std::string base = home ? std::string(home) + "/.local/run" : "/tmp";
    fs::create_directories(base);
    return base + "/omawisp.sock";
}

static int send_cmd(const std::string& msg, std::string& response){
    int fd = ::socket(AF_UNIX, SOCK_STREAM, 0);
    if(fd < 0){ perror("socket"); return 1; }
    sockaddr_un addr{}; addr.sun_family = AF_UNIX;
    std::string path = default_socket();
    std::strncpy(addr.sun_path, path.c_str(), sizeof(addr.sun_path)-1);
    if(::connect(fd, (sockaddr*)&addr, sizeof(addr)) < 0){
        std::cerr << "omawispd not running (" << path << ")" << std::endl;
        return 2;
    }
    ::write(fd, msg.c_str(), msg.size());
    char buf[4096]; ssize_t n = ::read(fd, buf, sizeof(buf)-1);
    if(n>0){ buf[n]=0; response.assign(buf, n);} else response.clear();
    ::close(fd);
    return 0;
}

int main(int argc, char** argv){
    if(argc < 2){
        std::cerr << "Usage: omawisp-ptt start|stop|status|config --print" << std::endl;
        return 1;
    }
    std::string cmd = argv[1];
    std::string resp;
    if(cmd=="start"){ return send_cmd("START", resp); }
    if(cmd=="stop"){ return send_cmd("STOP", resp); }
    if(cmd=="status"){ if(send_cmd("STATUS", resp)==0) std::cout << resp; return 0; }
    if(cmd=="config" && argc>2 && std::string(argv[2])=="--print"){ if(send_cmd("CONFIG_PRINT", resp)==0) std::cout << resp; return 0; }
    std::cerr << "Unknown command" << std::endl;
    return 1;
}
