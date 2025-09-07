const std = @import("std");

// Lock-free single-producer single-consumer ring buffer for int16 audio
pub const RingBuffer = struct {
    buf: []i16,
    mask: usize,
    write_pos: std.atomic.Value(usize),
    read_pos: std.atomic.Value(usize),
    allocator: std.mem.Allocator,

    pub fn init(allocator: std.mem.Allocator, capacity_samples: usize) !RingBuffer {
        // require power of two for mask indexing
        var cap: usize = 1;
        while (cap < capacity_samples) {
            cap <<= 1;
        }

        const buf = try allocator.alloc(i16, cap);
        @memset(buf, 0);

        return RingBuffer{
            .buf = buf,
            .mask = cap - 1,
            .write_pos = std.atomic.Value(usize).init(0),
            .read_pos = std.atomic.Value(usize).init(0),
            .allocator = allocator,
        };
    }

    pub fn deinit(self: *RingBuffer) void {
        self.allocator.free(self.buf);
    }

    pub fn capacity(self: *const RingBuffer) usize {
        return self.buf.len;
    }

    // write n samples
    pub fn write(self: *RingBuffer, data: []const i16) void {
        const w = self.write_pos.load(.monotonic);
        for (data, 0..) |sample, i| {
            self.buf[(w + i) & self.mask] = sample;
        }
        self.write_pos.store(w + data.len, .release);
    }

    // read n samples into out; assumes consumer does not overtake producer
    pub fn read(self: *RingBuffer, out: []i16) void {
        const r = self.read_pos.load(.monotonic);
        for (out, 0..) |*sample, i| {
            sample.* = self.buf[(r + i) & self.mask];
        }
        self.read_pos.store(r + out.len, .release);
    }

    // peek without moving read index
    pub fn peek(self: *const RingBuffer, out: []i16, back_offset: usize) void {
        const w = self.write_pos.load(.acquire);
        const start = (w -% back_offset -% out.len) & self.mask;
        for (out, 0..) |*sample, i| {
            sample.* = self.buf[(start + i) & self.mask];
        }
    }

    // set read pointer to be back_offset behind current write
    pub fn setReadFromPreroll(self: *RingBuffer, back_offset: usize) void {
        const w = self.write_pos.load(.acquire);
        self.read_pos.store(w -% back_offset, .release);
    }

    pub fn availableToRead(self: *const RingBuffer) usize {
        return self.write_pos.load(.acquire) -% self.read_pos.load(.acquire);
    }
};
