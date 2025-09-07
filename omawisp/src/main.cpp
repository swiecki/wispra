#include "daemon/app.hpp"
#include <iostream>
#include <string>

int main(int argc, char** argv){
    try {
        omawisp::App app;
        return app.run(argc, argv);
    } catch (const std::exception& e) {
        std::cerr << "omawispd fatal: " << e.what() << std::endl;
        return 1;
    }
}
