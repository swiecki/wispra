const std = @import("std");
const database = @import("database");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();
    
    // Get args
    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);
    
    // Get transcription log path
    const home = std.process.getEnvVarOwned(allocator, "HOME") catch {
        std.debug.print("Could not find HOME environment variable.\n", .{});
        return;
    };
    defer allocator.free(home);
    
    const log_path = try std.fmt.allocPrint(allocator, "{s}/.local/share/wispra/transcriptions.log", .{home});
    defer allocator.free(log_path);
    
    var transcription_log = database.TranscriptionLog.init(allocator, log_path) catch |err| {
        std.debug.print("Error opening transcription log: {}\n", .{err});
        std.debug.print("Make sure wisprad has been running and has recorded some transcriptions.\n", .{});
        return;
    };
    defer transcription_log.deinit();
    
    if (args.len > 1 and std.mem.eql(u8, args[1], "stats")) {
        // Show statistics
        const stats = try transcription_log.getStats();
        
        std.debug.print("📊 Wispra Statistics\n", .{});
        std.debug.print("─────────────────────\n", .{});
        std.debug.print("Total transcriptions: {}\n", .{stats.total_transcriptions});
        std.debug.print("Total words: {}\n", .{stats.total_words});
        std.debug.print("With semantic correction: {}\n", .{stats.total_with_semantic_correction});
        std.debug.print("Average processing time: {d:.1} ms\n", .{stats.avg_processing_time_ms});
        
        if (stats.earliest_timestamp) |earliest| {
            std.debug.print("First transcription: {}\n", .{earliest});
        }
        if (stats.latest_timestamp) |latest| {
            std.debug.print("Latest transcription: {}\n", .{latest});
        }
        
        return;
    }
    
    if (args.len > 2 and std.mem.eql(u8, args[1], "search")) {
        // Search transcriptions
        const search_term = args[2];
        std.debug.print("🔍 Searching for: {s}\n", .{search_term});
        std.debug.print("────────────────────────\n", .{});
        
        var results = try transcription_log.search(search_term, 10);
        defer {
            for (results.items) |*entry| {
                var mutable_entry = entry.*;
                mutable_entry.deinit(allocator);
            }
            results.deinit();
        }
        
        if (results.items.len == 0) {
            std.debug.print("No results found.\n", .{});
            return;
        }
        
        for (results.items, 0..) |*entry, i| {
            const display_text = if (entry.corrected_text) |corrected| corrected else entry.raw_text;
            std.debug.print("{}: {s}\n", .{ i + 1, display_text });
            if (entry.semantic_correction_used) {
                std.debug.print("   (✓ corrected)\n", .{});
            }
            std.debug.print("\n", .{});
        }
        
        return;
    }
    
    // Show recent transcriptions
    const limit: u32 = if (args.len > 1) 
        std.fmt.parseInt(u32, args[1], 10) catch 10
    else 
        10;
    
    std.debug.print("📝 Recent {} Transcriptions\n", .{limit});
    std.debug.print("──────────────────────────\n", .{});
    
    var entries = try transcription_log.getRecent(limit);
    defer {
        for (entries.items) |*entry| {
            var mutable_entry = entry.*;
            mutable_entry.deinit(allocator);
        }
        entries.deinit();
    }
    
    if (entries.items.len == 0) {
        std.debug.print("No transcriptions found.\n", .{});
        std.debug.print("Start recording with: wispra-ptt start\n", .{});
        return;
    }
    
    for (entries.items, 0..) |*entry, i| {
        const timestamp_sec = @divTrunc(entry.timestamp, 1000);
        const display_text = if (entry.corrected_text) |corrected| corrected else entry.raw_text;
        const model_name = std.fs.path.basename(entry.model_used);
        
        std.debug.print("{}. [{}] {s}\n", .{ i + 1, timestamp_sec, display_text });
        std.debug.print("   Model: {s} | Processing: {}ms", .{ model_name, entry.processing_time_ms });
        if (entry.semantic_correction_used) {
            std.debug.print(" | ✓ Corrected", .{});
        }
        std.debug.print("\n\n", .{});
    }
    
    std.debug.print("Usage:\n", .{});
    std.debug.print("  wispra-history [count]     Show recent transcriptions\n", .{});
    std.debug.print("  wispra-history stats       Show statistics\n", .{});
    std.debug.print("  wispra-history search <term>  Search transcriptions\n", .{});
}
