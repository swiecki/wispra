#include "audio_pipewire.hpp"
#include <vector>
#include <cstring>
#include <mutex>
#include <atomic>
#include <thread>
#include <condition_variable>
#include <iostream>

#ifdef __has_include
#  if __has_include(<pipewire/pipewire.h>)
#    include <pipewire/pipewire.h>
#    include <spa/param/audio/raw.h>
#    include <spa/utils/result.h>
#    define OMAWISP_HAVE_PIPEWIRE 1
#  endif
#endif

namespace omawisp {
struct PipeWireCapture::Impl {
#ifdef OMAWISP_HAVE_PIPEWIRE
    pw_main_loop* loop = nullptr;
    pw_context* context = nullptr;
    pw_stream* stream = nullptr;
    FrameCallback cb;
    int sample_rate = 16000;
    int frame_samples = 160; // 10 ms
#endif
};

PipeWireCapture::PipeWireCapture() { impl_ = new Impl(); }
PipeWireCapture::~PipeWireCapture(){ stop(); delete impl_; }

bool PipeWireCapture::start(int sample_rate, int frame_ms, const std::string& device, FrameCallback cb){
#ifdef OMAWISP_HAVE_PIPEWIRE
    if(impl_->stream) return true;
    impl_->cb = std::move(cb);
    impl_->sample_rate = sample_rate;
    impl_->frame_samples = sample_rate * frame_ms / 1000;

    pw_init(nullptr, nullptr);
    impl_->loop = pw_main_loop_new(nullptr);
    impl_->context = pw_context_new(pw_main_loop_get_loop(impl_->loop), nullptr, 0);
    impl_->stream = pw_stream_new_simple(
        pw_main_loop_get_loop(impl_->loop),
        "omawisp-capture",
        pw_properties_new(PW_KEY_MEDIA_TYPE, "Audio",
                          PW_KEY_MEDIA_CATEGORY, "Capture",
                          PW_KEY_MEDIA_ROLE, "Communication",
                          nullptr),
        [](void* data, pw_stream* s, const pw_buffer* b){
            auto* self = static_cast<PipeWireCapture::Impl*>(data);
            if(!b) return;
            auto* buf = b->buffer; if(!buf || !buf->datas[0].data) return;
            uint8_t* d = static_cast<uint8_t*>(buf->datas[0].data);
            uint32_t n_bytes = buf->datas[0].chunk->size;
            if(n_bytes==0) return;
            int16_t* pcm = reinterpret_cast<int16_t*>(d);
            size_t n_samples = n_bytes / sizeof(int16_t);
            // frame the data into exact chunks
            size_t ofs = 0;
            while(ofs + self->frame_samples <= n_samples){
                self->cb(pcm + ofs, self->frame_samples);
                ofs += self->frame_samples;
            }
        },
        impl_,
        0
    );

    spa_audio_info_raw info{};
    info.format = SPA_AUDIO_FORMAT_S16;
    info.rate = sample_rate;
    info.channels = 1;

    auto params = pw_stream_params_build(
        SPA_PARAM_EnumFormat, &info, sizeof(info),
        SPA_PARAM_BUFFERS_buffers, 8,
        SPA_PARAM_BUFFERS_size, (uint32_t)(impl_->frame_samples * sizeof(int16_t)),
        SPA_PARAM_BUFFERS_stride, (uint32_t)(sizeof(int16_t)),
        SPA_PARAM_IO_MaxBuffers, 8
    );

    int res = pw_stream_connect(
        impl_->stream,
        PW_DIRECTION_INPUT,
        PW_ID_ANY,
        (pw_stream_flags)(PW_STREAM_FLAG_AUTOCONNECT | PW_STREAM_FLAG_MAP_BUFFERS | PW_STREAM_FLAG_RT_PROCESS),
        params->params, params->n_params
    );
    if(res < 0){
        std::cerr << "PipeWire connect failed: " << spa_strerror(res) << std::endl;
        return false;
    }

    std::thread([this]{ pw_main_loop_run(impl_->loop); }).detach();
    return true;
#else
    (void)sample_rate; (void)frame_ms; (void)device; (void)cb; return false;
#endif
}

void PipeWireCapture::stop(){
#ifdef OMAWISP_HAVE_PIPEWIRE
    if(!impl_->stream) return;
    pw_main_loop_quit(impl_->loop);
    pw_stream_destroy(impl_->stream); impl_->stream = nullptr;
    pw_context_destroy(impl_->context); impl_->context = nullptr;
    pw_main_loop_destroy(impl_->loop); impl_->loop = nullptr;
    pw_deinit();
#endif
}
}
