#pragma once
#include <cstdint>
#include <string>
#include <vector>
#include <functional>
#include "config.hpp"

namespace omawisp {
struct PartialHypo { std::string text; };

class Transcriber {
public:
    explicit Transcriber(const AppConfig& cfg);
    ~Transcriber();

    void reset_session();
    void add_audio(const int16_t* pcm16, size_t n_samples);
    // Returns latest partial hypothesis; empty if none
    PartialHypo partial();
    // Final decode. Returns final text. Must be called after key release.
    std::string finalize();

private:
    struct Impl; Impl* impl_;
};
}
