const std = @import("std");

pub const Metrics = struct {
    ttff_ms: std.atomic.Value(i64),
    finalize_ms: std.atomic.Value(i64),
    sessions: std.atomic.Value(u64),

    pub fn init() Metrics {
        return Metrics{
            .ttff_ms = std.atomic.Value(i64).init(0),
            .finalize_ms = std.atomic.Value(i64).init(0),
            .sessions = std.atomic.Value(u64).init(0),
        };
    }

    pub fn updateTtff(self: *Metrics, ms: i64) void {
        self.ttff_ms.store(ms, .monotonic);
    }

    pub fn updateFinalize(self: *Metrics, ms: i64) void {
        self.finalize_ms.store(ms, .monotonic);
    }

    pub fn incrementSessions(self: *Metrics) void {
        _ = self.sessions.fetchAdd(1, .monotonic);
    }

    pub fn getTtff(self: *const Metrics) i64 {
        return self.ttff_ms.load(.monotonic);
    }

    pub fn getFinalize(self: *const Metrics) i64 {
        return self.finalize_ms.load(.monotonic);
    }

    pub fn getSessions(self: *const Metrics) u64 {
        return self.sessions.load(.monotonic);
    }
};
