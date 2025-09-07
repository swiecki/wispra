const std = @import("std");

pub const Stats = struct {
    total_transcriptions: u64,
    total_with_semantic_correction: u64,
    avg_processing_time_ms: f64,
    total_words: u64,
    earliest_timestamp: ?i64,
    latest_timestamp: ?i64,
};

pub const TranscriptionEntry = struct {
    timestamp: i64,
    raw_text: []const u8,
    corrected_text: ?[]const u8,
    semantic_correction_used: bool,
    processing_time_ms: i64,
    model_used: []const u8,
    session_id: ?[]const u8,
    
    pub fn deinit(self: *TranscriptionEntry, allocator: std.mem.Allocator) void {
        allocator.free(self.raw_text);
        if (self.corrected_text) |text| {
            allocator.free(text);
        }
        allocator.free(self.model_used);
        if (self.session_id) |id| {
            allocator.free(id);
        }
    }
    
    pub fn fromLogLine(allocator: std.mem.Allocator, line: []const u8) !TranscriptionEntry {
        var parts = std.mem.splitScalar(u8, line, '|');
        
        const timestamp_str = parts.next() orelse return error.InvalidFormat;
        const raw_text = parts.next() orelse return error.InvalidFormat;
        const corrected_text = parts.next();
        const semantic_used_str = parts.next() orelse return error.InvalidFormat;
        const processing_time_str = parts.next() orelse return error.InvalidFormat;
        const model = parts.next() orelse return error.InvalidFormat;
        const session_id = parts.next();
        
        return TranscriptionEntry{
            .timestamp = try std.fmt.parseInt(i64, timestamp_str, 10),
            .raw_text = try allocator.dupe(u8, raw_text),
            .corrected_text = if (corrected_text != null and corrected_text.?.len > 0) 
                try allocator.dupe(u8, corrected_text.?) 
            else 
                null,
            .semantic_correction_used = std.mem.eql(u8, semantic_used_str, "1"),
            .processing_time_ms = try std.fmt.parseInt(i64, processing_time_str, 10),
            .model_used = try allocator.dupe(u8, model),
            .session_id = if (session_id != null and session_id.?.len > 0) 
                try allocator.dupe(u8, session_id.?) 
            else 
                null,
        };
    }
    
    pub fn toLogLine(self: *const TranscriptionEntry, allocator: std.mem.Allocator) ![]const u8 {
        // Escape pipes in text fields
        const escaped_raw = try escapePipes(allocator, self.raw_text);
        defer allocator.free(escaped_raw);
        
        const escaped_corrected = if (self.corrected_text) |text|
            try escapePipes(allocator, text)
        else
            null;
        defer if (escaped_corrected) |text| allocator.free(text);
        
        return try std.fmt.allocPrint(allocator, "{d}|{s}|{s}|{d}|{d}|{s}|{s}\n", .{
            self.timestamp,
            escaped_raw,
            if (escaped_corrected) |text| text else "",
            @as(u8, if (self.semantic_correction_used) 1 else 0),
            self.processing_time_ms,
            self.model_used,
            if (self.session_id) |id| id else "",
        });
    }
    
    fn escapePipes(allocator: std.mem.Allocator, text: []const u8) ![]const u8 {
        var result = std.ArrayList(u8).init(allocator);
        defer result.deinit();
        
        for (text) |c| {
            if (c == '|') {
                try result.appendSlice("\\|");
            } else if (c == '\\') {
                try result.appendSlice("\\\\");
            } else if (c == '\n') {
                try result.appendSlice("\\n");
            } else {
                try result.append(c);
            }
        }
        
        return result.toOwnedSlice();
    }
};

pub const TranscriptionLog = struct {
    file_path: []const u8,
    allocator: std.mem.Allocator,
    
    pub fn init(allocator: std.mem.Allocator, file_path: []const u8) !TranscriptionLog {
        // Create directory if it doesn't exist
        if (std.fs.path.dirname(file_path)) |dir| {
            std.fs.makeDirAbsolute(dir) catch |err| {
                if (err != error.PathAlreadyExists) {
                    std.debug.print("Warning: Could not create log directory {s}: {}\n", .{ dir, err });
                }
            };
        }
        
        return TranscriptionLog{
            .file_path = try allocator.dupe(u8, file_path),
            .allocator = allocator,
        };
    }
    
    pub fn deinit(self: *TranscriptionLog) void {
        self.allocator.free(self.file_path);
    }
    
    pub fn append(self: *const TranscriptionLog, entry: struct {
        raw_text: []const u8,
        corrected_text: ?[]const u8 = null,
        semantic_correction_used: bool = false,
        processing_time_ms: i64,
        model_used: []const u8,
        session_id: ?[]const u8 = null,
    }) !void {
        const timestamp = std.time.milliTimestamp();
        
        const log_entry = TranscriptionEntry{
            .timestamp = timestamp,
            .raw_text = entry.raw_text,
            .corrected_text = entry.corrected_text,
            .semantic_correction_used = entry.semantic_correction_used,
            .processing_time_ms = entry.processing_time_ms,
            .model_used = entry.model_used,
            .session_id = entry.session_id,
        };
        
        const log_line = try log_entry.toLogLine(self.allocator);
        defer self.allocator.free(log_line);
        
        const file = std.fs.createFileAbsolute(self.file_path, .{ .truncate = false }) catch |err| {
            std.debug.print("Could not open transcription log file {s}: {}\n", .{ self.file_path, err });
            return err;
        };
        defer file.close();
        
        try file.seekFromEnd(0);
        try file.writeAll(log_line);
    }
    
    pub fn getRecent(self: *const TranscriptionLog, limit: u32) !std.ArrayList(TranscriptionEntry) {
        const file = std.fs.openFileAbsolute(self.file_path, .{}) catch |err| {
            if (err == error.FileNotFound) {
                return std.ArrayList(TranscriptionEntry).init(self.allocator);
            }
            return err;
        };
        defer file.close();
        
        const content = try file.readToEndAlloc(self.allocator, std.math.maxInt(usize));
        defer self.allocator.free(content);
        
        var entries = std.ArrayList(TranscriptionEntry).init(self.allocator);
        var lines_iter = std.mem.splitScalar(u8, content, '\n');
        var all_lines = std.ArrayList([]const u8).init(self.allocator);
        defer all_lines.deinit();
        
        // Collect all non-empty lines
        while (lines_iter.next()) |line| {
            const trimmed = std.mem.trim(u8, line, " \t\r\n");
            if (trimmed.len > 0) {
                try all_lines.append(trimmed);
            }
        }
        
        // Take the last 'limit' lines
        const start_idx = if (all_lines.items.len > limit) all_lines.items.len - limit else 0;
        const lines_to_process = all_lines.items[start_idx..];
        
        for (lines_to_process) |line| {
            if (TranscriptionEntry.fromLogLine(self.allocator, line)) |entry| {
                try entries.append(entry);
            } else |err| {
                std.debug.print("Failed to parse log line: {s} - Error: {}\n", .{ line, err });
                continue;
            }
        }
        
        return entries;
    }
    
    pub fn search(self: *const TranscriptionLog, search_text: []const u8, limit: u32) !std.ArrayList(TranscriptionEntry) {
        const file = std.fs.openFileAbsolute(self.file_path, .{}) catch |err| {
            if (err == error.FileNotFound) {
                return std.ArrayList(TranscriptionEntry).init(self.allocator);
            }
            return err;
        };
        defer file.close();
        
        const content = try file.readToEndAlloc(self.allocator, std.math.maxInt(usize));
        defer self.allocator.free(content);
        
        var entries = std.ArrayList(TranscriptionEntry).init(self.allocator);
        var lines_iter = std.mem.splitScalar(u8, content, '\n');
        var count: u32 = 0;
        
        while (lines_iter.next()) |line| {
            if (count >= limit) break;
            
            const trimmed = std.mem.trim(u8, line, " \t\r\n");
            if (trimmed.len == 0) continue;
            
            // Simple case-insensitive search
            const line_lower = try self.allocator.alloc(u8, trimmed.len);
            defer self.allocator.free(line_lower);
            _ = std.ascii.lowerString(line_lower, trimmed);
            
            const search_lower = try self.allocator.alloc(u8, search_text.len);
            defer self.allocator.free(search_lower);
            _ = std.ascii.lowerString(search_lower, search_text);
            
            if (std.mem.indexOf(u8, line_lower, search_lower) != null) {
                if (TranscriptionEntry.fromLogLine(self.allocator, trimmed)) |entry| {
                    try entries.append(entry);
                    count += 1;
                } else |err| {
                    std.debug.print("Failed to parse log line: {s} - Error: {}\n", .{ trimmed, err });
                    continue;
                }
            }
        }
        
        return entries;
    }
    
    pub fn getStats(self: *const TranscriptionLog) !Stats {
        const file = std.fs.openFileAbsolute(self.file_path, .{}) catch |err| {
            if (err == error.FileNotFound) {
                return Stats{
                    .total_transcriptions = 0,
                    .total_with_semantic_correction = 0,
                    .avg_processing_time_ms = 0.0,
                    .total_words = 0,
                    .earliest_timestamp = null,
                    .latest_timestamp = null,
                };
            }
            return err;
        };
        defer file.close();
        
        const content = try file.readToEndAlloc(self.allocator, std.math.maxInt(usize));
        defer self.allocator.free(content);
        
        var total_transcriptions: u64 = 0;
        var total_with_correction: u64 = 0;
        var total_processing_time: i64 = 0;
        var total_words: u64 = 0;
        var earliest_timestamp: ?i64 = null;
        var latest_timestamp: ?i64 = null;
        
        var lines_iter = std.mem.splitScalar(u8, content, '\n');
        while (lines_iter.next()) |line| {
            const trimmed = std.mem.trim(u8, line, " \t\r\n");
            if (trimmed.len == 0) continue;
            
            if (TranscriptionEntry.fromLogLine(self.allocator, trimmed)) |entry| {
                var mutable_entry = entry;
                defer mutable_entry.deinit(self.allocator);
                
                total_transcriptions += 1;
                if (mutable_entry.semantic_correction_used) {
                    total_with_correction += 1;
                }
                total_processing_time += mutable_entry.processing_time_ms;
                
                // Count words in the final text (corrected if available, otherwise raw)
                const text_to_count = if (mutable_entry.corrected_text) |corrected| corrected else mutable_entry.raw_text;
                var word_iter = std.mem.tokenizeAny(u8, text_to_count, " \t\n\r");
                while (word_iter.next()) |_| {
                    total_words += 1;
                }
                
                if (earliest_timestamp == null or mutable_entry.timestamp < earliest_timestamp.?) {
                    earliest_timestamp = mutable_entry.timestamp;
                }
                if (latest_timestamp == null or mutable_entry.timestamp > latest_timestamp.?) {
                    latest_timestamp = mutable_entry.timestamp;
                }
            } else |_| {
                continue;
            }
        }
        
        const avg_processing_time = if (total_transcriptions > 0)
            @as(f64, @floatFromInt(total_processing_time)) / @as(f64, @floatFromInt(total_transcriptions))
        else
            0.0;
        
        return Stats{
            .total_transcriptions = total_transcriptions,
            .total_with_semantic_correction = total_with_correction,
            .avg_processing_time_ms = avg_processing_time,
            .total_words = total_words,
            .earliest_timestamp = earliest_timestamp,
            .latest_timestamp = latest_timestamp,
        };
    }
    
    pub fn cleanup(self: *const TranscriptionLog, days_to_keep: u32) !u64 {
        const cutoff_timestamp = std.time.milliTimestamp() - (@as(i64, days_to_keep) * 24 * 60 * 60 * 1000);
        
        const file = std.fs.openFileAbsolute(self.file_path, .{}) catch |err| {
            if (err == error.FileNotFound) {
                return 0;
            }
            return err;
        };
        defer file.close();
        
        const content = try file.readToEndAlloc(self.allocator, std.math.maxInt(usize));
        defer self.allocator.free(content);
        
        var kept_lines = std.ArrayList([]const u8).init(self.allocator);
        defer kept_lines.deinit();
        
        var lines_iter = std.mem.splitScalar(u8, content, '\n');
        var removed_count: u64 = 0;
        
        while (lines_iter.next()) |line| {
            const trimmed = std.mem.trim(u8, line, " \t\r\n");
            if (trimmed.len == 0) continue;
            
            if (TranscriptionEntry.fromLogLine(self.allocator, trimmed)) |entry| {
                var mutable_entry = entry;
                defer mutable_entry.deinit(self.allocator);
                
                if (mutable_entry.timestamp >= cutoff_timestamp) {
                    try kept_lines.append(trimmed);
                } else {
                    removed_count += 1;
                }
            } else |_| {
                // Keep malformed lines as-is
                try kept_lines.append(trimmed);
            }
        }
        
        // Rewrite the file with only the kept lines
        const temp_file = try std.fmt.allocPrint(self.allocator, "{s}.tmp", .{self.file_path});
        defer self.allocator.free(temp_file);
        
        const out_file = try std.fs.createFileAbsolute(temp_file, .{});
        defer out_file.close();
        
        for (kept_lines.items) |line| {
            try out_file.writeAll(line);
            try out_file.writeAll("\n");
        }
        
        // Replace original file with temp file
        try std.fs.renameAbsolute(temp_file, self.file_path);
        
        return removed_count;
    }
};
