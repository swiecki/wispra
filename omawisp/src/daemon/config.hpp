#pragma once
#include <string>
#include <cstdint>

namespace omawisp {
struct ModelConfig {
    std::string path = std::string(getenv("HOME") ? getenv("HOME") : "") + "/.cache/omawisp/models/ggml-tiny.en-q5_1.bin";
    int threads = 10;
    bool english_only = true;
    int beam_size = 2;
};

struct AudioConfig {
    std::string backend = "pipewire"; // or alsa
    std::string device = "default";
    int sample_rate = 16000;
    int frame_ms = 10;
    int preroll_ms = 300;
};

struct VadConfig {
    bool enabled = true;
    int aggressiveness = 2; // 0-3
    int min_speech_ms = 150;
    int max_silence_ms = 300;
};

struct OutputConfig {
    std::string mode = "type"; // type|clipboard|stdout
    bool use_hyprctl = true;
    bool use_wtype_fallback = true;
};

struct CleanupConfig {
    bool enabled = false;
    std::string endpoint_url;
    std::string api_key;
    int timeout_ms = 1500;
};

struct AppConfig {
    ModelConfig model;
    AudioConfig audio;
    VadConfig vad;
    OutputConfig output;
    CleanupConfig cleanup;
    std::string config_path; // actual loaded path
    bool debug = false;
};

class ConfigLoader {
public:
    static AppConfig load(const std::string& path="");
    static void print(const AppConfig& cfg);
};
}
