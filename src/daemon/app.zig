const std = @import("std");
const os = std.os;
const net = std.net;
const config = @import("config.zig");
const metrics_mod = @import("metrics.zig");
const ring_buffer = @import("ring_buffer.zig");
const audio = @import("audio_portaudio.zig");
const output_mod = @import("output.zig");
const transcriber_mod = @import("transcriber.zig");
const vad_stub = @import("vad_stub.zig");
const semantic_correction_mod = @import("semantic_correction.zig");
const database_mod = @import("../shared/database.zig");
const WavWriter = @import("wav.zig").WavWriter;

const kSampleRate = 16000;
const kFrameMs = 10;
const kPrerollMs = 300;

pub const App = struct {
    cfg: config.AppConfig,
    metrics: metrics_mod.Metrics,
    running: std.atomic.Value(bool),
    allocator: std.mem.Allocator,
    
    socket_path: []const u8,
    server: ?net.Server = null,
    log_file: ?std.fs.File = null,
    
    ring: ring_buffer.RingBuffer,
    pa: audio.PortAudioCapture,
    out: output_mod.Output,
    trans: transcriber_mod.Transcriber,
    corrector: semantic_correction_mod.SemanticCorrector,
    database: ?database_mod.TranscriptionLog,
    
    is_active: std.atomic.Value(bool),
    session_start: i64 = 0,

    // Session WAV capture
    wav: WavWriter = .{},
    wav_path: []const u8 = "",
    
    pub fn init(allocator: std.mem.Allocator) !App {
        const cfg = try config.ConfigLoader.load(allocator, "");
        
        return App{
            .cfg = cfg,
            .metrics = metrics_mod.Metrics.init(),
            .running = std.atomic.Value(bool).init(true),
            .allocator = allocator,
            .socket_path = try getDefaultSocketPath(allocator),
            .ring = try ring_buffer.RingBuffer.init(allocator, 1 << 15), // ~64k samples
            .pa = audio.PortAudioCapture.init(allocator),
            .out = output_mod.Output.init(allocator, cfg.output),
            .trans = transcriber_mod.Transcriber.init(allocator, cfg),
            .corrector = semantic_correction_mod.SemanticCorrector.init(allocator, cfg.semantic_correction),
            .database = if (cfg.transcription_log.enabled) blk: {
                const expanded_path = if (std.mem.startsWith(u8, cfg.transcription_log.path, "~/"))
                    try expandHomePath(allocator, cfg.transcription_log.path)
                else
                    try allocator.dupe(u8, cfg.transcription_log.path);
                defer allocator.free(expanded_path);
                
                // Create directory if needed
                if (std.fs.path.dirname(expanded_path)) |dir| {
                    std.fs.makeDirAbsolute(dir) catch |err| {
                        if (err != error.PathAlreadyExists) {
                            std.debug.print("Warning: Could not create log directory {s}: {}\n", .{ dir, err });
                        }
                    };
                }
                
                break :blk database_mod.TranscriptionLog.init(allocator, expanded_path) catch |err| {
                    std.debug.print("Warning: Could not initialize transcription log: {}\n", .{err});
                    break :blk null;
                };
            } else null,
            .is_active = std.atomic.Value(bool).init(false),
        };
    }
    
    pub fn deinit(self: *App) void {
        self.ring.deinit();
        self.pa.deinit();
        self.out.deinit();
        self.trans.deinit();
        self.corrector.deinit();
        if (self.database) |*db| {
            db.deinit();
        }
        self.cfg.deinit();
        self.allocator.free(self.socket_path);
        if (self.wav_path.len > 0) self.allocator.free(self.wav_path);
        if (self.log_file) |file| {
            file.close();
        }
    }
    
    fn expandHomePath(allocator: std.mem.Allocator, path: []const u8) ![]const u8 {
        if (!std.mem.startsWith(u8, path, "~/")) {
            return try allocator.dupe(u8, path);
        }
        
        const home = std.process.getEnvVarOwned(allocator, "HOME") catch return error.HomeNotFound;
        defer allocator.free(home);
        
        return try std.fmt.allocPrint(allocator, "{s}/{s}", .{ home, path[2..] });
    }
    
    fn getDefaultSocketPath(allocator: std.mem.Allocator) ![]const u8 {
        const home = std.process.getEnvVarOwned(allocator, "HOME") catch try allocator.dupe(u8, "/tmp");
        defer allocator.free(home);
        const base = try std.fmt.allocPrint(allocator, "{s}/.local/run", .{home});
        defer allocator.free(base);
        
        // Create directory if it doesn't exist
        std.fs.makeDirAbsolute(base) catch |err| {
            if (err != error.PathAlreadyExists) return err;
        };
        
        return try std.fmt.allocPrint(allocator, "{s}/wispra.sock", .{base});
    }
    
    pub fn run(self: *App, args: [][:0]u8) !void {
        // Parse basic flags
        var i: usize = 1;
        while (i < args.len) : (i += 1) {
            if (std.mem.eql(u8, args[i], "--debug")) {
                self.cfg.debug = true;
            } else if (std.mem.eql(u8, args[i], "--config") and i + 1 < args.len) {
                i += 1;
                self.cfg.deinit();
                self.cfg = try config.ConfigLoader.load(self.allocator, args[i]);
            }
        }
        
        // Set up logging
        const home = std.process.getEnvVarOwned(self.allocator, "HOME") catch try self.allocator.dupe(u8, "/tmp");
        defer self.allocator.free(home);
        const log_dir = try std.fmt.allocPrint(self.allocator, "{s}/.local/state/wispra/logs", .{home});
        defer self.allocator.free(log_dir);
        
        std.fs.makeDirAbsolute(log_dir) catch |err| {
            if (err != error.PathAlreadyExists) return err;
        };
        
        const log_path = try std.fmt.allocPrint(self.allocator, "{s}/wispra.log", .{log_dir});
        defer self.allocator.free(log_path);
        
        self.log_file = try std.fs.createFileAbsolute(log_path, .{ .truncate = false });
        try self.log_file.?.seekFromEnd(0);
        
        // Load transcriber model
        try self.trans.loadModel();
        
        // Run server
        try self.runServer();
    }
    
    fn log(self: *App, message: []const u8) void {
        if (self.log_file) |file| {
            const timestamp = std.time.milliTimestamp();
            file.writer().print("{d} {s}\n", .{ timestamp, message }) catch {};
        }
    }
    
    fn runServer(self: *App) !void {
        // Remove existing socket
        std.fs.deleteFileAbsolute(self.socket_path) catch {};
        
        const address = try net.Address.initUnix(self.socket_path);
        self.server = try net.Address.listen(address, .{});
        
        if (self.cfg.debug) {
            std.debug.print("wisprad listening on {s}\n", .{self.socket_path});
        }
        self.log("listening on socket");
        
        while (self.running.load(.monotonic)) {
            const connection = self.server.?.accept() catch continue;
            self.handleClient(connection);
            connection.stream.close();
        }
    }
    
    fn handleClient(self: *App, connection: net.Server.Connection) void {
        var buf: [128]u8 = undefined;
        const n = connection.stream.read(&buf) catch return;
        if (n == 0) return;
        
        const cmd = buf[0..n];
        
        if (std.mem.startsWith(u8, cmd, "START")) {
            // Optional: START <device>
            // Device selection removed - using default device
            self.startPtt();
            connection.stream.writeAll("OK") catch {};
        } else if (std.mem.startsWith(u8, cmd, "STOP")) {
            const text = self.stopPtt();
            if (text.len > 0) {
                connection.stream.writeAll(text) catch {};
                self.allocator.free(text);
            } else {
                connection.stream.writeAll("\n") catch {};
            }
        } else if (std.mem.startsWith(u8, cmd, "STATUS")) {
            const status = std.fmt.allocPrint(
                self.allocator,
                "active={d},ttff_ms={d},finalize_ms={d}\n",
                .{
                    @intFromBool(self.is_active.load(.monotonic)),
                    self.metrics.getTtff(),
                    self.metrics.getFinalize(),
                }
            ) catch return;
            defer self.allocator.free(status);
            connection.stream.writeAll(status) catch {};
        } else if (std.mem.startsWith(u8, cmd, "CONFIG_PRINT")) {
            config.ConfigLoader.print(&self.cfg);
        } else if (std.mem.startsWith(u8, cmd, "DEVICES")) {
            const text = audio.PortAudioCapture.listDevicesText(self.allocator) catch return;
            defer self.allocator.free(text);
            connection.stream.writeAll(text) catch {};
        }
    }
    
    fn startPtt(self: *App) void {
        if (self.is_active.swap(true, .monotonic)) return; // already active
        
        self.log("START");
        self.session_start = std.time.milliTimestamp();
        self.metrics.incrementSessions();
        
        // Reset transcriber session
        self.trans.reset_session();

        // Set ring buffer read position
        self.ring.setReadFromPreroll(@as(usize, kPrerollMs) * @as(usize, kSampleRate) / 1000);

        // Open session WAV file
        const maybe_home = std.process.getEnvVarOwned(self.allocator, "HOME") catch null;
        defer if (maybe_home) |h| self.allocator.free(h);
        const home = if (maybe_home) |h| h else "/tmp";
        const dir = std.fmt.allocPrint(self.allocator, "{s}/.local/state/wispra", .{home}) catch {
            self.is_active.store(false, .monotonic);
            return;
        };
        defer self.allocator.free(dir);
        std.fs.makeDirAbsolute(dir) catch |err| {
            if (err != error.PathAlreadyExists) {
                self.is_active.store(false, .monotonic);
                return;
            }
        };
        self.wav_path = std.fmt.allocPrint(self.allocator, "{s}/session.wav", .{dir}) catch {
            self.is_active.store(false, .monotonic);
            return;
        };
        if (self.wav_path.len > 0) {
            self.wav.open(self.wav_path) catch {
                self.is_active.store(false, .monotonic);
                return;
            };
        }

        // Start audio capture
        self.pa.start(
            kSampleRate,
            kFrameMs,
            "default",
            struct {
                fn callback(pcm: []const i16, user_data: ?*anyopaque) void {
                    const app = @as(*App, @ptrCast(@alignCast(user_data.?)));
                    app.onAudioFrame(pcm);
                }
            }.callback,
            self,
        ) catch |err| {
            std.debug.print("Audio (PortAudio) failed to start: {}\n", .{err});
            self.is_active.store(false, .monotonic);
            return;
        };
    }
    
    fn onAudioFrame(self: *App, pcm: []const i16) void {
        // Write to ring buffer
        self.ring.write(pcm);

        // Write to WAV file (capture-only mode)
        self.wav.write(pcm) catch {};
        
        // Add to transcriber
        self.trans.add_audio(pcm) catch {};
        
        // Debug logging disabled to avoid integer overflow
    }
    
    fn stopPtt(self: *App) []const u8 {
        if (!self.is_active.swap(false, .monotonic)) return "";
        
        self.log("STOP");
        self.pa.stop();

        // finalize WAV file
        self.wav.close();
        
        const t0 = std.time.milliTimestamp();
        const final_text = self.trans.finalize() catch return "";
        
        // Apply semantic correction if enabled
        const correction_result = self.corrector.correctWithMetrics(final_text) catch |err| blk: {
            std.debug.print("Semantic correction failed: {}\n", .{err});
            break :blk semantic_correction_mod.SemanticCorrectionResult{
                .text = self.allocator.dupe(u8, final_text) catch final_text,
                .attempted = true,
                .successful = false,
                .duration_ms = 0,
            };
        };
        defer if (correction_result.text.ptr != final_text.ptr) self.allocator.free(correction_result.text);
        
        var corrected_text = correction_result.text;
        if (correction_result.attempted) {
            if (self.cfg.debug) {
                std.debug.print("semantic correction: attempted=true duration_ms={d} successful={}\n", .{ 
                    correction_result.duration_ms, 
                    correction_result.successful 
                });
                if (correction_result.successful) {
                    std.debug.print("corrected: {s}\n", .{corrected_text});
                }
            }
        } else {
            corrected_text = final_text;
        }
        
        if (self.cfg.debug) {
            std.debug.print("final: {s}\n", .{final_text});
        }
        
        // Log final and corrected transcripts
        const final_log = std.fmt.allocPrint(self.allocator, "final: {s}", .{final_text}) catch "";
        defer if (final_log.len > 0) self.allocator.free(final_log);
        self.log(final_log);
        
        if (correction_result.attempted and correction_result.successful and !std.mem.eql(u8, final_text, corrected_text)) {
            const corrected_log = std.fmt.allocPrint(self.allocator, "corrected: {s}", .{corrected_text}) catch "";
            defer if (corrected_log.len > 0) self.allocator.free(corrected_log);
            self.log(corrected_log);
        }
        
        // Strip leading/trailing whitespace before sending
        const trimmed_text = std.mem.trim(u8, corrected_text, " \t\n\r");
        
        // Store in transcription log if enabled
        if (self.database) |*transcription_log| {
            const processing_time = std.time.milliTimestamp() - t0;
            transcription_log.append(.{
                .raw_text = final_text,
                .corrected_text = if (correction_result.attempted and correction_result.successful and !std.mem.eql(u8, final_text, corrected_text)) corrected_text else null,
                .semantic_correction_used = correction_result.attempted and correction_result.successful,
                .processing_time_ms = processing_time,
                .model_used = std.fs.path.basename(self.cfg.model.path),
                .session_id = if (self.session_start > 0) 
                    std.fmt.allocPrint(self.allocator, "session_{d}", .{self.session_start}) catch null
                else 
                    null,
            }) catch |err| {
                if (self.cfg.debug) {
                    std.debug.print("Transcription log append failed: {}\n", .{err});
                }
            };
            
            if (self.cfg.debug) {
                std.debug.print("Stored transcription to log\n", .{});
            }
            
            // Cleanup session_id if we allocated it
            if (self.session_start > 0) {
                if (std.fmt.allocPrint(self.allocator, "session_{d}", .{self.session_start})) |session_id| {
                    defer self.allocator.free(session_id);
                } else |_| {}
            }
        }
        
        // Send trimmed text to output  
        self.out.send(trimmed_text) catch {};
        
        const t1 = std.time.milliTimestamp();
        self.metrics.updateFinalize(t1 - t0);

        // free wav_path for next session
        if (self.wav_path.len > 0) {
            self.allocator.free(self.wav_path);
            self.wav_path = "";
        }
        
        // Return corrected text with newline
        const out = std.fmt.allocPrint(self.allocator, "{s}\n", .{trimmed_text}) catch "";
        return out;
    }
};
