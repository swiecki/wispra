#include <stdint.h>
#include <stddef.h>

// Minimal stub VAD: always return 1 (voiced) if RMS above threshold
int vad_stub_process(const int16_t* pcm, size_t n, int sample_rate){
    long long acc = 0;
    for(size_t i=0;i<n;++i){ int32_t s = pcm[i]; acc += (long long)(s*s); }
    double rms = n ? sqrt((double)acc / (double)n) : 0.0;
    return rms > 500.0; // naive threshold
}
