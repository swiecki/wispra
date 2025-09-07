#pragma once
#include <string>
#include <thread>
#include <atomic>
#include <functional>
#include <sys/socket.h>
#include <sys/un.h>
#include "config.hpp"
#include "metrics.hpp"
#include "ring_buffer.hpp"
#include "vad_webrtc.hpp"
#include "transcriber_whisper.hpp"
#include "audio_pipewire.hpp"
#include "audio_alsa.hpp"
#include "output_paste.hpp"

namespace omawisp {
class App {
public:
    int run(int argc, char** argv);

private:
    void run_server();
    void handle_client(int cfd);
    void start_ptt();
    void stop_ptt();

    AppConfig cfg_ = ConfigLoader::load("");
    Metrics metrics_;
    std::atomic<bool> running_{true};

    // IPC
    std::string socket_path_;
    int srv_fd_ = -1;

    // Logging
    FILE* log_fp_ = nullptr;
    void log(const std::string& line);

    // Audio + ASR
    RingBuffer ring_{1<<15}; // ~64k samples (~4s) default
    Vad vad_;
    Transcriber trans_{cfg_};
    PipeWireCapture pw_;
    AlsaCapture alsa_;
    Output out_{cfg_};

    std::atomic<bool> is_active_{false};
    std::chrono::steady_clock::time_point session_start_{};
    std::chrono::steady_clock::time_point ttff_mark_{};
};
}
