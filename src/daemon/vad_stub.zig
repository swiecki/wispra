const std = @import("std");

// Minimal stub VAD: always return true (voiced) if RMS above threshold
pub fn process(pcm: []const i16, sample_rate: u32) bool {
    _ = sample_rate; // not used in this simple implementation
    
    var acc: i64 = 0;
    for (pcm) |sample| {
        const s: i32 = sample;
        acc += @as(i64, s * s);
    }
    
    const rms = if (pcm.len > 0) std.math.sqrt(@as(f64, @floatFromInt(acc)) / @as(f64, @floatFromInt(pcm.len))) else 0.0;
    return rms > 500.0; // naive threshold
}
