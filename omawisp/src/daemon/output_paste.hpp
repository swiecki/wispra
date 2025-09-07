#pragma once
#include <string>
#include "config.hpp"

namespace omawisp {
class Output {
public:
    explicit Output(const AppConfig& cfg) : cfg_(cfg) {}
    void paste_final(const std::string& text) const; // according to cfg.output.mode
private:
    AppConfig cfg_;
};
}
