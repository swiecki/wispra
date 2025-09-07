#include "transcriber_whisper.hpp"
#include <mutex>
#include <deque>
#include <chrono>
#include <cstring>
#ifdef OMAWISP_HAVE_WHISPER
#include "whisper.h"
#endif

namespace omawisp {
struct Transcriber::Impl {
#ifdef OMAWISP_HAVE_WHISPER
    whisper_context* ctx = nullptr;
    whisper_full_params params;
#endif
    const AppConfig cfg;
    std::mutex mu;
    std::vector<float> audiof; // accumulated mono 16k float
    std::string last_partial;

    Impl(const AppConfig& c) : cfg(c) {
#ifdef OMAWISP_HAVE_WHISPER
        ctx = whisper_init_from_file_with_params(cfg.model.path.c_str(), whisper_context_default_params());
        params = whisper_full_default_params(WHISPER_SAMPLING_GREEDY);
        params.translate = false;
        params.no_context = false;
        params.single_segment = false;
        params.max_tokens = 64;
        params.print_realtime = false;
        params.print_progress = false;
        params.print_timestamps = false;
        params.print_special = false;
        params.language = "en";
        params.n_threads = cfg.model.threads;
        params.no_timestamps = true;
        params.audio_ctx = 0;
        params.temperature = 0.0f;
        params.max_initial_ts = 0.0f;
        params.greedy.best_of = 1;
        params.beam_search.beam_size = cfg.model.beam_size;
#endif
    }

    ~Impl(){
#ifdef OMAWISP_HAVE_WHISPER
        if(ctx) whisper_free(ctx);
#endif
    }
};

Transcriber::Transcriber(const AppConfig& cfg) : impl_(new Impl(cfg)) {}
Transcriber::~Transcriber(){ delete impl_; }

void Transcriber::reset_session(){
    std::scoped_lock lk(impl_->mu);
    impl_->audiof.clear();
    impl_->last_partial.clear();
}

static inline void append_pcm16_as_f32(std::vector<float>& v, const int16_t* pcm, size_t n){
    size_t old = v.size(); v.resize(old+n);
    for(size_t i=0;i<n;++i) v[old+i] = (float)pcm[i] / 32768.0f;
}

void Transcriber::add_audio(const int16_t* pcm16, size_t n_samples){
    std::scoped_lock lk(impl_->mu);
    append_pcm16_as_f32(impl_->audiof, pcm16, n_samples);
}

PartialHypo Transcriber::partial(){
#ifdef OMAWISP_HAVE_WHISPER
    std::scoped_lock lk(impl_->mu);
    if(!impl_->ctx || impl_->audiof.size() < 1600) return {""}; // >=100ms min
    whisper_reset_timings(impl_->ctx);
    whisper_full(impl_->ctx, impl_->params, impl_->audiof.data(), impl_->audiof.size());
    std::string out;
    const int n = whisper_full_n_segments(impl_->ctx);
    for(int i=0;i<n;i++){
        out += whisper_full_get_segment_text(impl_->ctx, i);
    }
    impl_->last_partial = out;
    return {out};
#else
    return {""};
#endif
}

std::string Transcriber::finalize(){
#ifdef OMAWISP_HAVE_WHISPER
    std::scoped_lock lk(impl_->mu);
    if(!impl_->ctx) return impl_->last_partial;
    whisper_reset_timings(impl_->ctx);
    whisper_full(impl_->ctx, impl_->params, impl_->audiof.data(), impl_->audiof.size());
    std::string out;
    const int n = whisper_full_n_segments(impl_->ctx);
    for(int i=0;i<n;i++){
        out += whisper_full_get_segment_text(impl_->ctx, i);
    }
    impl_->last_partial = out;
    return out;
#else
    return "";
#endif
}
}
