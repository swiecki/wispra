const std = @import("std");
const config = @import("config.zig");
const wc = @cImport({
    @cInclude("whisper.h");
});

// Disable whisper log to avoid backend issues
fn whisperLogCallback(level: c_uint, message: [*c]const u8, user_data: ?*anyopaque) callconv(.C) void {
    _ = level;
    _ = message;
    _ = user_data;
}

pub const Transcriber = struct {
    cfg: config.AppConfig,
    allocator: std.mem.Allocator,
    buf: std.ArrayList(i16),
    ctx: ?*wc.whisper_context = null,
    
    pub fn init(allocator: std.mem.Allocator, cfg: config.AppConfig) Transcriber {
        return Transcriber{
            .cfg = cfg,
            .allocator = allocator,
            .buf = std.ArrayList(i16).init(allocator),
        };
    }
    
    pub fn deinit(self: *Transcriber) void {
        if (self.ctx) |cptr| wc.whisper_free(cptr);
        self.ctx = null;
        self.buf.deinit();
    }
    
    pub fn reset_session(self: *Transcriber) void {
        self.buf.clearRetainingCapacity();
    }

    pub fn transcribe(self: *Transcriber, audio_data: []const i16) ![]const u8 {
        if (self.ctx == null) return error.ModelNotLoaded;
        
        // Convert i16 -> f32 in range [-1,1]
        var f32buf = try self.allocator.alloc(f32, audio_data.len);
        defer self.allocator.free(f32buf);
        for (audio_data, 0..) |s, i| {
            f32buf[i] = @as(f32, @floatFromInt(s)) / 32768.0;
        }

        var params = wc.whisper_full_default_params(wc.WHISPER_SAMPLING_GREEDY);
        params.print_progress = false;
        params.print_timestamps = false;
        params.print_special = false;
        params.translate = false;
        const n_threads = std.Thread.getCpuCount() catch 4;
        params.n_threads = @intCast(n_threads);

        const res = wc.whisper_full(self.ctx.?, params, f32buf.ptr, @intCast(f32buf.len));
        if (res != 0) return error.WhisperFailed;

        const nseg: c_int = wc.whisper_full_n_segments(self.ctx.?);
        var out = std.ArrayList(u8).init(self.allocator);
        defer out.deinit();
        var w = out.writer();
        var first = true;
        var i: c_int = 0;
        while (i < nseg) : (i += 1) {
            const cstr = wc.whisper_full_get_segment_text(self.ctx.?, i);
            if (cstr) |p| {
                const seg = std.mem.span(p);
                if (!first) try w.writeByte(' ');
                first = false;
                try w.writeAll(seg);
            }
        }
        return out.toOwnedSlice();
    }
    
    pub fn loadModel(self: *Transcriber) !void {
        std.debug.print("Loading model from: {s}\n", .{self.cfg.model.path});
        
        // Disable whisper logging BEFORE initialization
        wc.whisper_log_set(whisperLogCallback, null);
        
        if (self.ctx) |cptr| {
            wc.whisper_free(cptr);
            self.ctx = null;
        }
        // Use the same approach as C++ version - params but properly configured
        const cparams = wc.whisper_context_default_params();
        self.ctx = wc.whisper_init_from_file_with_params(@ptrCast(self.cfg.model.path), cparams);
        if (self.ctx == null) return error.ModelLoadFailed;
    }
    
    pub fn add_audio(self: *Transcriber, pcm: []const i16) !void {
        try self.buf.appendSlice(pcm);
    }
    
    pub fn finalize(self: *Transcriber) ![]const u8 {
        if (self.ctx == null) return error.ModelNotLoaded;
        // Convert i16 -> f32 in range [-1,1]
        var f32buf = try self.allocator.alloc(f32, self.buf.items.len);
        defer self.allocator.free(f32buf);
        for (self.buf.items, 0..) |s, i| {
            f32buf[i] = @as(f32, @floatFromInt(s)) / 32768.0;
        }

        var params = wc.whisper_full_default_params(wc.WHISPER_SAMPLING_GREEDY);
        params.new_segment_callback = null;
        params.language = "en";
        params.print_realtime = false;
        params.debug_mode = false;
        params.no_timestamps = true;
        params.print_special = false;
        params.translate = false;
        params.single_segment = true;
        params.print_progress = false;
        params.no_context = true;  // KEY FIX: This is critical
        params.max_tokens = 64;
        params.n_threads = @intCast(std.Thread.getCpuCount() catch 4);
        params.audio_ctx = 0;
        params.temperature = 0.0;
        params.max_initial_ts = 0.0;
        params.length_penalty = 1.0;
        params.temperature_inc = 0.2;
        params.entropy_thold = 2.4;
        params.logprob_thold = -1.0;
        params.greedy.best_of = 1;
        params.beam_search.beam_size = 2;
        params.no_speech_thold = 0.1;
        params.suppress_nst = false;
        params.suppress_blank = false;

        const res = wc.whisper_full(self.ctx.?, params, f32buf.ptr, @intCast(f32buf.len));
        if (res != 0) return error.WhisperFailed;

        const nseg: c_int = wc.whisper_full_n_segments(self.ctx.?);
        var out = std.ArrayList(u8).init(self.allocator);
        defer out.deinit();
        var w = out.writer();
        var first = true;
        var i: c_int = 0;
        while (i < nseg) : (i += 1) {
            const cstr = wc.whisper_full_get_segment_text(self.ctx.?, i);
            if (cstr) |p| {
                const seg = std.mem.span(p);
                if (!first) try w.writeByte(' ');
                first = false;
                try w.writeAll(seg);
            }
        }
        return out.toOwnedSlice();
    }
};
