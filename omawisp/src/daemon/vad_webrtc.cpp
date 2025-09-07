#include "vad_webrtc.hpp"
#include <cmath>
#ifdef __has_include
#  if __has_include("webrtc/common_audio/vad/include/webrtc_vad.h")
#    include "webrtc/common_audio/vad/include/webrtc_vad.h"
#    define OMAWISP_HAVE_WEBRTCVAD 1
#  endif
#endif

namespace omawisp {
bool Vad::have_native() const {
#ifdef OMAWISP_HAVE_WEBRTCVAD
    return true;
#else
    return false;
#endif
}

void Vad::init(int aggressiveness){
    aggressiveness_ = aggressiveness;
#ifdef OMAWISP_HAVE_WEBRTCVAD
    if(!handle_) handle_ = WebRtcVad_Create();
    if(handle_) {
        WebRtcVad_Init(handle_);
        WebRtcVad_set_mode(handle_, aggressiveness_);
    }
#endif
}

bool Vad::is_speech(const int16_t* pcm, int len_samples, int sample_rate){
#ifdef OMAWISP_HAVE_WEBRTCVAD
    if(handle_) {
        int ret = WebRtcVad_Process(handle_, sample_rate, pcm, len_samples);
        return ret == 1;
    }
#endif
    // fallback stub: naive RMS threshold
    long long acc = 0;
    for(int i=0;i<len_samples;++i){ int32_t s = pcm[i]; acc += (long long)(s*s); }
    double rms = len_samples ? std::sqrt((double)acc / (double)len_samples) : 0.0;
    return rms > 500.0;
}
}
