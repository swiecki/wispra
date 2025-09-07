#include "output_paste.hpp"
#include <cstdlib>
#include <sstream>
#include <iostream>
#include <string>

static std::string shell_escape(const std::string& s){
    std::ostringstream o; o << '"';
    for(char c: s){
        if(c=='\\' || c=='"') o << '\\' << c;
        else if(c=='\n') o << "\\n";
        else o << c;
    }
    o << '"';
    return o.str();
}

namespace omawisp {
void Output::paste_final(const std::string& text) const{
    if(cfg_.output.mode=="stdout"){
        std::cout << text << std::endl;
        return;
    }

    if(cfg_.output.mode=="clipboard"){
        std::string cmd = "wl-copy --type text/plain --primary " + shell_escape(text);
        std::ignore = std::system(cmd.c_str());
        // Try auto paste with Ctrl+V via wtype if available
        if(cfg_.output.use_wtype_fallback){
            std::ignore = std::system("wtype -M ctrl v -m ctrl");
        }
        return;
    }

    // default: type
    if(cfg_.output.use_hyprctl){
        std::string cmd = "hyprctl dispatch type " + shell_escape(text);
        int rc = std::system(cmd.c_str());
        if(rc==0) return;
    }
    if(cfg_.output.use_wtype_fallback){
        std::string cmd = "wtype --delay 2 " + shell_escape(text);
        std::ignore = std::system(cmd.c_str());
    }
}
}
