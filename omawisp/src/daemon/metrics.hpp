#pragma once
#include <chrono>
#include <atomic>

namespace omawisp {
struct Metrics {
    std::atomic<int64_t> ttff_ms{0};
    std::atomic<int64_t> finalize_ms{0};
    std::atomic<uint64_t> sessions{0};
};
}
