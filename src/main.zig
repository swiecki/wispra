const std = @import("std");
const App = @import("daemon/app.zig").App;

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();
    
    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);
    
    var app = try App.init(allocator);
    defer app.deinit();
    
    try app.run(args);
}
