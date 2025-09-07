const std = @import("std");
const os = std.os;
const net = std.net;

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

fn sendCommand(allocator: std.mem.Allocator, msg: []const u8) ![]const u8 {
    const socket_path = try getDefaultSocketPath(allocator);
    defer allocator.free(socket_path);
    
    const address = try net.Address.initUnix(socket_path);
    const stream = std.posix.socket(std.posix.AF.UNIX, std.posix.SOCK.STREAM, 0) catch {
        std.debug.print("wisprad not running ({s})\n", .{socket_path});
        return error.DaemonNotRunning;
    };
    std.posix.connect(stream, &address.any, address.getOsSockLen()) catch {
        std.debug.print("wisprad not running ({s})\n", .{socket_path});
        return error.DaemonNotRunning;
    };
    const net_stream = net.Stream{ .handle = stream };
    defer net_stream.close();
    
    try net_stream.writeAll(msg);
    
    var buf: [4096]u8 = undefined;
    const n = try net_stream.read(&buf);
    
    if (n > 0) {
        return try allocator.dupe(u8, buf[0..n]);
    } else {
        return try allocator.dupe(u8, "");
    }
}

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();
    
    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);
    
    if (args.len < 2) {
        std.debug.print("Usage: wispra-ptt start|stop|status|devices|monitor [seconds]|config --print\n", .{});
        return error.InvalidArguments;
    }
    
    const cmd = args[1];
    
    if (std.mem.eql(u8, cmd, "start")) {
        var msg = std.ArrayList(u8).init(allocator);
        defer msg.deinit();
        try msg.appendSlice("START");
        if (args.len > 2) {
            try msg.append(' ');
            try msg.appendSlice(args[2]);
        }
        const resp = try sendCommand(allocator, msg.items);
        defer allocator.free(resp);
    } else if (std.mem.eql(u8, cmd, "stop")) {
        const resp = try sendCommand(allocator, "STOP");
        defer allocator.free(resp);
        if (resp.len > 0) {
            try std.io.getStdOut().writeAll(resp);
        }
    } else if (std.mem.eql(u8, cmd, "status")) {
        const resp = try sendCommand(allocator, "STATUS");
        defer allocator.free(resp);
        try std.io.getStdOut().writeAll(resp);
    } else if (std.mem.eql(u8, cmd, "devices")) {
        const resp = try sendCommand(allocator, "DEVICES");
        defer allocator.free(resp);
        try std.io.getStdOut().writeAll(resp);
    } else if (std.mem.eql(u8, cmd, "monitor")) {
        var secs: u32 = 5;
        if (args.len > 2) {
            secs = std.fmt.parseInt(u32, args[2], 10) catch 5;
            if (secs < 1) secs = 1;
        }
        
        var msg = std.ArrayList(u8).init(allocator);
        defer msg.deinit();
        try msg.appendSlice("START");
        if (args.len > 3) {
            try msg.append(' ');
            try msg.appendSlice(args[3]);
        }
        
        _ = try sendCommand(allocator, msg.items);
        std.time.sleep(secs * std.time.ns_per_s);
        _ = try sendCommand(allocator, "STOP");
        
        const status = try sendCommand(allocator, "STATUS");
        defer allocator.free(status);
        if (status.len > 0) {
            try std.io.getStdOut().writeAll(status);
        } else {
            try std.io.getStdOut().writeAll("ok\n");
        }
    } else if (std.mem.eql(u8, cmd, "config") and args.len > 2 and std.mem.eql(u8, args[2], "--print")) {
        const resp = try sendCommand(allocator, "CONFIG_PRINT");
        defer allocator.free(resp);
        try std.io.getStdOut().writeAll(resp);
    } else {
        std.debug.print("Unknown command\n", .{});
        return error.UnknownCommand;
    }
}
