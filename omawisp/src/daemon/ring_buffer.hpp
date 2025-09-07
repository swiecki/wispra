#pragma once
#include <vector>
#include <atomic>
#include <cstdint>
#include <cstring>

namespace omawisp {
// Lock-free single-producer single-consumer ring buffer for int16 audio
class RingBuffer {
public:
    explicit RingBuffer(size_t capacity_samples)
        : buf_(capacity_samples), mask_(capacity_samples-1) {
        // require power of two for mask indexing
        size_t cap = 1; while(cap < capacity_samples) cap <<= 1; 
        if(cap != capacity_samples){
            buf_.assign(cap, 0);
            mask_ = cap-1;
        }
    }
    size_t capacity() const { return buf_.size(); }

    // write n samples
    void write(const int16_t* data, size_t n){
        auto w = w_.load(std::memory_order_relaxed);
        for(size_t i=0;i<n;++i){ buf_[(w+i) & mask_] = data[i]; }
        w_.store(w+n, std::memory_order_release);
    }

    // read n samples into out; assumes consumer does not overtake producer
    void read(int16_t* out, size_t n){
        auto r = r_.load(std::memory_order_relaxed);
        for(size_t i=0;i<n;++i){ out[i] = buf_[(r+i) & mask_]; }
        r_.store(r+n, std::memory_order_release);
    }

    // peek without moving read index
    void peek(int16_t* out, size_t n, size_t back_offset) const {
        auto w = w_.load(std::memory_order_acquire);
        size_t start = (w - back_offset - n) & mask_;
        for(size_t i=0;i<n;++i){ out[i] = buf_[(start+i) & mask_]; }
    }

    // set read pointer to be back_offset behind current write
    void set_read_from_preroll(size_t back_offset){
        auto w = w_.load(std::memory_order_acquire);
        r_.store(w - back_offset, std::memory_order_release);
    }

    size_t available_to_read() const { return w_.load(std::memory_order_acquire) - r_.load(std::memory_order_acquire); }
private:
    std::vector<int16_t> buf_;
    size_t mask_;
    std::atomic<size_t> w_{0};
    std::atomic<size_t> r_{0};
};
}
