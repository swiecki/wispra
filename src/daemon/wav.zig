const std = @import("std");

// Simple 16-bit PCM WAV writer (mono)
pub const WavWriter = struct {
    file: ?std.fs.File = null,
    data_bytes: u32 = 0,

    pub fn open(self: *WavWriter, path: []const u8) !void {
        // Create parent directory if needed
        if (std.fs.path.dirname(path)) |dir| {
            std.fs.makeDirAbsolute(dir) catch |err| {
                if (err != error.PathAlreadyExists) return err;
            };
        }

        self.file = try std.fs.createFileAbsolute(path, .{ .truncate = true });

        // Write placeholder header (will fix sizes in close)
        try self.writeBytes("RIFF");
        try self.writeU32Le(0); // riff size placeholder
        try self.writeBytes("WAVE");
        try self.writeBytes("fmt ");
        try self.writeU32Le(16); // PCM fmt chunk size
        try self.writeU16Le(1);  // audio format = PCM
        try self.writeU16Le(1);  // channels = 1
        try self.writeU32Le(16000); // sample rate
        try self.writeU32Le(16000 * 2); // byte rate = sr * channels * bps/8
        try self.writeU16Le(2);  // block align = channels * bps/8
        try self.writeU16Le(16); // bits per sample
        try self.writeBytes("data");
        try self.writeU32Le(0); // data size placeholder
    }

    pub fn write(self: *WavWriter, pcm: []const i16) !void {
        if (self.file) |f| {
            try f.writer().writeAll(std.mem.sliceAsBytes(pcm));
            self.data_bytes +%= @as(u32, @intCast(pcm.len * @sizeOf(i16)));
        }
    }

    pub fn close(self: *WavWriter) void {
        const f = self.file orelse return;
        self.file = null;
        // Patch header sizes
        // riff size = 4 (WAVE) + (8+16) fmt + (8+data)
        const riff_size: u32 = 4 + (8 + 16) + (8 + self.data_bytes);
        const data_size: u32 = self.data_bytes;
        _ = f.seekTo(4) catch return;
        _ = f.writer().writeInt(u32, riff_size, .little) catch {};
        _ = f.seekTo(40) catch return;
        _ = f.writer().writeInt(u32, data_size, .little) catch {};
        f.close();
    }

    fn writeBytes(self: *WavWriter, s: []const u8) !void {
        try (self.file orelse return error.NotOpen).writer().writeAll(s);
    }
    fn writeU16Le(self: *WavWriter, v: u16) !void {
        try (self.file orelse return error.NotOpen).writer().writeInt(u16, v, .little);
    }
    fn writeU32Le(self: *WavWriter, v: u32) !void {
        try (self.file orelse return error.NotOpen).writer().writeInt(u32, v, .little);
    }
};
