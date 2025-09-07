const std = @import("std");
const config = @import("config.zig");

pub const Output = struct {
    cfg: config.OutputConfig,
    allocator: std.mem.Allocator,
    
    pub fn init(allocator: std.mem.Allocator, cfg: config.OutputConfig) Output {
        return Output{
            .cfg = cfg,
            .allocator = allocator,
        };
    }
    
    pub fn deinit(self: *Output) void {
        _ = self;
    }
    
    pub fn send(self: *const Output, text: []const u8) !void {
        if (std.mem.eql(u8, self.cfg.mode, "stdout")) {
            const stdout = std.io.getStdOut().writer();
            try stdout.print("{s}\n", .{text});
        } else if (std.mem.eql(u8, self.cfg.mode, "type")) {
            try self.pasteViaWtype(text);
        } else if (std.mem.eql(u8, self.cfg.mode, "clipboard")) {
            try self.pasteViaClipboard(text);
        }
    }
    
    fn pasteViaWtype(self: *const Output, text: []const u8) !void {
        const escaped_text = try self.shellEscape(text);
        defer self.allocator.free(escaped_text);
        
        const cmd = try std.fmt.allocPrint(self.allocator, "wtype {s}", .{escaped_text});
        defer self.allocator.free(cmd);
        
        const result = std.process.Child.run(.{
            .allocator = self.allocator,
            .argv = &[_][]const u8{ "sh", "-c", cmd },
        }) catch |err| {
            std.debug.print("Failed to run wtype: {}\n", .{err});
            return;
        };
        defer {
            self.allocator.free(result.stdout);
            self.allocator.free(result.stderr);
        }
    }
    
    fn pasteViaClipboard(self: *const Output, text: []const u8) !void {
        const escaped_text = try self.shellEscape(text);
        defer self.allocator.free(escaped_text);
        
        // Copy to clipboard
        const copy_cmd = try std.fmt.allocPrint(self.allocator, "wl-copy --type text/plain --primary {s}", .{escaped_text});
        defer self.allocator.free(copy_cmd);
        
        const copy_result = std.process.Child.run(.{
            .allocator = self.allocator,
            .argv = &[_][]const u8{ "sh", "-c", copy_cmd },
        }) catch |err| {
            std.debug.print("Failed to copy to clipboard: {}\n", .{err});
            return;
        };
        defer {
            self.allocator.free(copy_result.stdout);
            self.allocator.free(copy_result.stderr);
        }
        
        // Auto paste with Ctrl+V
        const paste_result = std.process.Child.run(.{
            .allocator = self.allocator,
            .argv = &[_][]const u8{ "wtype", "-M", "ctrl", "v", "-m", "ctrl" },
        }) catch |err| {
            std.debug.print("Failed to auto paste: {}\n", .{err});
            return;
        };
        defer {
            self.allocator.free(paste_result.stdout);
            self.allocator.free(paste_result.stderr);
        }
    }
    
    fn shellEscape(self: *const Output, text: []const u8) ![]const u8 {
        var result = std.ArrayList(u8).init(self.allocator);
        defer result.deinit();
        
        try result.append('"');
        for (text) |c| {
            switch (c) {
                '\\', '"' => {
                    try result.append('\\');
                    try result.append(c);
                },
                '\n' => try result.appendSlice("\\n"),
                else => try result.append(c),
            }
        }
        try result.append('"');
        
        return result.toOwnedSlice();
    }
};
