#include "audio_alsa.hpp"
#include <thread>
#include <atomic>
#include <vector>
#include <iostream>

#ifdef __has_include
#  if __has_include(<alsa/asoundlib.h>)
#    include <alsa/asoundlib.h>
#    define OMAWISP_HAVE_ALSA 1
#  endif
#endif

namespace omawisp {
static std::atomic<bool> g_running_alsa{false};

bool AlsaCapture::start(int sample_rate, int frame_ms, const std::string& device, FrameCallback cb){
#ifdef OMAWISP_HAVE_ALSA
    if(g_running_alsa.exchange(true)) return true;
    std::thread([=]{
        snd_pcm_t* handle = nullptr;
        int err = snd_pcm_open(&handle, device.c_str(), SND_PCM_STREAM_CAPTURE, 0);
        if(err < 0){ std::cerr << "ALSA open failed: " << snd_strerror(err) << std::endl; g_running_alsa=false; return; }
        snd_pcm_set_params(handle, SND_PCM_FORMAT_S16_LE, SND_PCM_ACCESS_RW_INTERLEAVED, 1, sample_rate, 1, 100000); // 100 ms
        int frame_samples = sample_rate * frame_ms / 1000;
        std::vector<int16_t> buf(frame_samples);
        while(g_running_alsa.load()){
            int n = snd_pcm_readi(handle, buf.data(), frame_samples);
            if(n == -EPIPE){ snd_pcm_prepare(handle); continue; }
            if(n > 0){ cb(buf.data(), (size_t)n); }
        }
        snd_pcm_close(handle);
    }).detach();
    return true;
#else
    (void)sample_rate; (void)frame_ms; (void)device; (void)cb; return false;
#endif
}

void AlsaCapture::stop(){
#ifdef OMAWISP_HAVE_ALSA
    g_running_alsa = false;
#endif
}
}
