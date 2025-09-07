#pragma once
#include <cstdint>
#include <vector>

namespace omawisp {
class Vad {
public:
    bool have_native() const;
    void init(int aggressiveness);
    // pcm: 16-bit mono 16kHz; len must be 10/20/30 ms multiples
    bool is_speech(const int16_t* pcm, int len_samples, int sample_rate);
private:
    void* handle_ = nullptr; // native VAD if available
    int aggressiveness_ = 2;
};
}
