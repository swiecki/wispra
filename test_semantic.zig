const std = @import("std");
const semantic_correction_mod = @import("src/daemon/semantic_correction.zig");
const config = @import("src/daemon/config.zig");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();
    
    // Test config - you'd need to set OPENAI_API_KEY environment variable
    var cfg = config.SemanticCorrectionConfig{
        .enabled = true,
        .api_key = std.process.getEnvVarOwned(allocator, "OPENAI_API_KEY") catch "",
    };
    defer if (cfg.api_key.len > 0) allocator.free(cfg.api_key);
    
    var corrector = semantic_correction_mod.SemanticCorrector.init(allocator, cfg);
    defer corrector.deinit();
    
    const test_text = "umm, so like, I want to, uh, write a function that, you know, sorts an array";
    
    const result = corrector.correctWithMetrics(test_text) catch |err| {
        std.debug.print("Error: {}\n", .{err});
        return;
    };
    defer if (result.text.ptr != test_text.ptr) allocator.free(result.text);
    
    std.debug.print("Original: {s}\n", .{test_text});
    std.debug.print("Corrected: {s}\n", .{result.text});
    std.debug.print("Attempted: {}\n", .{result.attempted});
    std.debug.print("Successful: {}\n", .{result.successful});
    std.debug.print("Duration: {}ms\n", .{result.duration_ms});
}
