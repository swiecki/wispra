#pragma once
#include <cstdint>
#include <functional>
#include <string>

namespace omawisp {
class PipeWireCapture {
public:
    using FrameCallback = std::function<void(const int16_t* pcm, size_t n)>;
    PipeWireCapture();
    ~PipeWireCapture();
    bool start(int sample_rate, int frame_ms, const std::string& device, FrameCallback cb);
    void stop();
private:
    struct Impl; Impl* impl_ = nullptr;
};
}
