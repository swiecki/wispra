#pragma once
#include <cstdint>
#include <functional>
#include <string>

namespace omawisp {
class AlsaCapture {
public:
    using FrameCallback = std::function<void(const int16_t* pcm, size_t n)>;
    bool start(int sample_rate, int frame_ms, const std::string& device, FrameCallback cb);
    void stop();
};
}
