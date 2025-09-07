const std = @import("std");
const vaxis = @import("vaxis");
const database = @import("database");

const Event = union(enum) {
    key_press: vaxis.Key,
    winsize: vaxis.Winsize,
};

const App = struct {
    allocator: std.mem.Allocator,
    should_quit: bool = false,
    
    // Data
    transcription_log: database.TranscriptionLog,
    entries: std.ArrayList(database.TranscriptionEntry),
    stats: ?database.Stats = null,
    
    // UI state
    selected_index: usize = 0,
    scroll_offset: usize = 0,
    content_height: usize = 0,
    
    pub fn init(allocator: std.mem.Allocator) !App {
        // Get transcription log path
        const home = std.process.getEnvVarOwned(allocator, "HOME") catch return error.HomeNotFound;
        defer allocator.free(home);
        
        const log_path = try std.fmt.allocPrint(allocator, "{s}/.local/share/wispra/transcriptions.log", .{home});
        defer allocator.free(log_path);
        
        var transcription_log = try database.TranscriptionLog.init(allocator, log_path);
        const entries = try transcription_log.getRecent(1000);
        
        return App{
            .allocator = allocator,
            .transcription_log = transcription_log,
            .entries = entries,
        };
    }
    
    pub fn deinit(self: *App) void {
        for (self.entries.items) |*entry| {
            var mutable_entry = entry.*;
            mutable_entry.deinit(self.allocator);
        }
        self.entries.deinit();
        self.transcription_log.deinit();
    }
    
    pub fn handleEvent(self: *App, event: Event) !void {
        switch (event) {
            .key_press => |key| {
                if (key.matches('q', .{})) {
                    self.should_quit = true;
                    return;
                } else if (key.codepoint == 'c' and key.mods.ctrl) {
                    self.should_quit = true;
                    return;
                } else if (key.matches('j', .{})) {
                    self.moveDown();
                } else if (key.matches('k', .{})) {
                    self.moveUp();
                } else if (key.matches('c', .{})) {
                    try self.copySelectedToClipboard();
                } else if (key.matches('x', .{})) {
                    try self.deleteSelected();
                } else if (key.matches('r', .{})) {
                    try self.refresh();
                }
            },
            .winsize => |ws| {
                self.content_height = @max(1, ws.rows -| 6); // Reserve space for header/footer
            },
        }
    }
    
    // Helper function to write text at a given position
    fn writeText(win: vaxis.Window, text: []const u8, col: usize, row: usize, style: vaxis.Style) void {
        for (text, 0..) |char, i| {
            if (col + i >= win.width) break;
            const char_str = [_]u8{char};
            win.writeCell(@intCast(col + i), @intCast(row), .{
                .char = .{ .grapheme = char_str[0..1], .width = 1 },
                .style = style,
            });
        }
    }

    pub fn render(self: *App, vx: *vaxis.Vaxis) !void {
        const win = vx.window();
        win.clear();
        
        // Header
        var row: usize = 0;
        const title = "🎤 Wispra Transcription History";
        writeText(win, title, 0, row, .{ .fg = .{ .index = 6 }, .bold = true });
        row += 1;
        
        // Stats line
        if (self.stats == null) {
            self.stats = self.transcription_log.getStats() catch null;
        }
        
        if (self.stats) |stats| {
            const stats_text = try std.fmt.allocPrint(self.allocator, 
                "Total: {} | Words: {} | Avg: {d:.1}ms | Corrected: {}", 
                .{ stats.total_transcriptions, stats.total_words, stats.avg_processing_time_ms, stats.total_with_semantic_correction }
            );
            defer self.allocator.free(stats_text);
            
            writeText(win, stats_text, 0, row, .{ .fg = .{ .index = 8 } });
        }
        row += 2;
        
        // Column headers
        writeText(win, "Time", 0, row, .{ .fg = .{ .index = 7 }, .bold = true });
        writeText(win, "✓", 18, row, .{ .fg = .{ .index = 7 }, .bold = true });
        writeText(win, "Text", 20, row, .{ .fg = .{ .index = 7 }, .bold = true });
        writeText(win, "Model", win.width -| 20, row, .{ .fg = .{ .index = 7 }, .bold = true });
        row += 1;
        
        // Separator line
        for (0..win.width) |col| {
            win.writeCell(@intCast(col), @intCast(row), .{ .char = .{ .grapheme = "-", .width = 1 }, .style = .{ .fg = .{ .index = 8 } } });
        }
        row += 1;
        
        // Transcription entries
        const start_row = row;
        if (self.entries.items.len == 0) {
            writeText(win, "No transcriptions found. Start recording with wispra-ptt!", 2, start_row, .{ .fg = .{ .index = 8 } });
        } else {
            const visible_entries = @min(self.content_height, self.entries.items.len -| self.scroll_offset);
            
            for (0..visible_entries) |i| {
                const entry_index = self.scroll_offset + i;
                if (entry_index >= self.entries.items.len) break;
                
                const entry = &self.entries.items[entry_index];
                const is_selected = entry_index == self.selected_index;
                
                const current_row = start_row + i;
                
                // Background for selected item
                if (is_selected) {
                    for (0..win.width) |col| {
                        win.writeCell(@intCast(col), @intCast(current_row), .{ 
                            .char = .{ .grapheme = " ", .width = 1 }, 
                            .style = .{ .bg = .{ .index = 4 }, .fg = .{ .index = 15 } } 
                        });
                    }
                }
                
                // Format timestamp as readable time
                const timestamp_sec = @divTrunc(entry.timestamp, 1000);
                const time_text = try std.fmt.allocPrint(self.allocator, "{}", .{timestamp_sec});
                defer self.allocator.free(time_text);
                
                // Get display text (prefer corrected text if available)
                const display_text = if (entry.corrected_text) |corrected| corrected else entry.raw_text;
                const max_text_width = win.width -| 45;
                const truncated_text = if (display_text.len > max_text_width)
                    display_text[0..max_text_width]
                else
                    display_text;
                
                const model_name = std.fs.path.basename(entry.model_used);
                
                // Style for this row
                const fg_color: vaxis.Color = if (is_selected) .{ .index = 15 } else .default;
                const bg_color: vaxis.Color = if (is_selected) .{ .index = 4 } else .default;
                const style = vaxis.Style{ .bg = bg_color, .fg = fg_color };
                
                // Time column
                writeText(win, time_text, 0, current_row, style);
                
                // Semantic correction indicator
                if (entry.semantic_correction_used) {
                    writeText(win, "✓", 18, current_row, .{ .fg = .{ .index = 2 }, .bg = bg_color });
                }
                
                // Text content
                writeText(win, truncated_text, 20, current_row, style);
                
                // Model (right-aligned)
                const model_col = @max(0, win.width -| model_name.len);
                writeText(win, model_name, model_col, current_row, style);
            }
        }
        
        // Footer with help
        const footer_row = win.height -| 2;
        writeText(win, "j/k navigate | c copy | x delete | r refresh | q quit", 0, footer_row, .{ .fg = .{ .index = 8 } });
        
        // Scroll indicator
        if (self.entries.items.len > 0 and self.entries.items.len > self.content_height) {
            const scroll_info = try std.fmt.allocPrint(self.allocator, "[{}/{}]", .{ self.selected_index + 1, self.entries.items.len });
            defer self.allocator.free(scroll_info);
            
            const scroll_col = @max(0, win.width -| scroll_info.len);
            writeText(win, scroll_info, scroll_col, footer_row, .{ .fg = .{ .index = 8 } });
        }
    }
    
    // Navigation methods
    fn moveDown(self: *App) void {
        if (self.entries.items.len == 0) return;
        
        if (self.selected_index < self.entries.items.len - 1) {
            self.selected_index += 1;
            
            if (self.selected_index >= self.scroll_offset + self.content_height) {
                self.scroll_offset = self.selected_index - self.content_height + 1;
            }
        }
    }
    
    fn moveUp(self: *App) void {
        if (self.entries.items.len == 0) return;
        
        if (self.selected_index > 0) {
            self.selected_index -= 1;
            
            if (self.selected_index < self.scroll_offset) {
                self.scroll_offset = self.selected_index;
            }
        }
    }
    
    fn pageDown(self: *App) void {
        const page_size = @max(1, self.content_height -| 1);
        for (0..page_size) |_| {
            self.moveDown();
        }
    }
    
    fn pageUp(self: *App) void {
        const page_size = @max(1, self.content_height -| 1);
        for (0..page_size) |_| {
            self.moveUp();
        }
    }
    
    fn goToTop(self: *App) void {
        self.selected_index = 0;
        self.scroll_offset = 0;
    }
    
    fn goToBottom(self: *App) void {
        if (self.entries.items.len == 0) return;
        
        self.selected_index = self.entries.items.len - 1;
        if (self.entries.items.len > self.content_height) {
            self.scroll_offset = self.entries.items.len - self.content_height;
        } else {
            self.scroll_offset = 0;
        }
    }
    
    fn copySelectedToClipboard(self: *App) !void {
        if (self.entries.items.len == 0 or self.selected_index >= self.entries.items.len) return;
        
        const entry = &self.entries.items[self.selected_index];
        const text_to_copy = if (entry.corrected_text) |corrected| corrected else entry.raw_text;
        
        const result = std.process.Child.run(.{
            .allocator = self.allocator,
            .argv = &[_][]const u8{ "wl-copy", text_to_copy },
        }) catch |err| {
            std.debug.print("Failed to copy to clipboard: {}\n", .{err});
            return;
        };
        defer self.allocator.free(result.stdout);
        defer self.allocator.free(result.stderr);
        
        if (result.term.Exited != 0) {
            std.debug.print("wl-copy failed with exit code {}\n", .{result.term.Exited});
        }
    }
    
    fn deleteSelected(self: *App) !void {
        if (self.entries.items.len == 0 or self.selected_index >= self.entries.items.len) return;
        
        // Simple deletion by recreating the log file without the selected entry
        const entry_to_delete = &self.entries.items[self.selected_index];
        const timestamp_to_delete = entry_to_delete.timestamp;
        
        // Read all entries and filter out the one to delete
        var all_entries = try self.transcription_log.getRecent(10000);
        defer {
            for (all_entries.items) |*entry| {
                var mutable_entry = entry.*;
                mutable_entry.deinit(self.allocator);
            }
            all_entries.deinit();
        }
        
        // Create temp file without the deleted entry
        const temp_path = try std.fmt.allocPrint(self.allocator, "{s}.tmp", .{self.transcription_log.file_path});
        defer self.allocator.free(temp_path);
        
        const temp_file = try std.fs.createFileAbsolute(temp_path, .{});
        defer temp_file.close();
        
        for (all_entries.items) |*entry| {
            if (entry.timestamp != timestamp_to_delete) {
                const log_line = try entry.toLogLine(self.allocator);
                defer self.allocator.free(log_line);
                try temp_file.writeAll(log_line);
            }
        }
        
        // Replace original file
        try std.fs.renameAbsolute(temp_path, self.transcription_log.file_path);
        
        // Refresh entries
        try self.refresh();
        
        // Adjust selection
        if (self.selected_index >= self.entries.items.len and self.entries.items.len > 0) {
            self.selected_index = self.entries.items.len - 1;
        }
    }
    
    fn refresh(self: *App) !void {
        // Clear current entries
        for (self.entries.items) |*entry| {
            var mutable_entry = entry.*;
            mutable_entry.deinit(self.allocator);
        }
        self.entries.clearAndFree();
        
        // Reload entries and stats
        self.entries = try self.transcription_log.getRecent(1000);
        self.stats = try self.transcription_log.getStats();
        
        // Adjust selection
        if (self.selected_index >= self.entries.items.len and self.entries.items.len > 0) {
            self.selected_index = self.entries.items.len - 1;
        }
    }
};

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();
    
    // Initialize app
    var app = App.init(allocator) catch |err| {
        switch (err) {
            error.FileNotFound => {
                std.debug.print("No transcription log found at ~/.local/share/wispra/transcriptions.log\n", .{});
                std.debug.print("Make sure wisprad has been running and has recorded some transcriptions.\n", .{});
                return;
            },
            error.HomeNotFound => {
                std.debug.print("Could not find HOME environment variable.\n", .{});
                return;
            },
            else => return err,
        }
    };
    defer app.deinit();
    
    // Initialize vaxis
    var tty = try vaxis.Tty.init();
    defer tty.deinit();
    
    var vx = try vaxis.init(allocator, .{});
    defer vx.deinit(allocator, tty.anyWriter());
    
    // Initialize event loop
    var loop: vaxis.Loop(Event) = .{ .tty = &tty, .vaxis = &vx };
    try loop.init();
    
    try loop.start();
    defer loop.stop();
    
    // Enter alt screen
    try vx.enterAltScreen(tty.anyWriter());
    defer vx.exitAltScreen(tty.anyWriter()) catch {};
    
    // Query terminal features
    try vx.queryTerminal(tty.anyWriter(), 1 * std.time.ns_per_s);
    
    // Load initial data
    try app.refresh();
    
    // Main event loop
    while (!app.should_quit) {
        // Get next event
        loop.pollEvent();
        while (loop.tryEvent()) |event| {
            try app.handleEvent(event);
        }
        
        // Render
        try app.render(&vx);
        try vx.render(tty.anyWriter());
    }
}
