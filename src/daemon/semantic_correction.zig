const std = @import("std");
const config = @import("config.zig");

// OpenAI API response structures
const OpenAIMessage = struct {
    role: []const u8,
    content: []const u8,
    refusal: ?[]const u8 = null,
    annotations: ?[]std.json.Value = null,
};

const OpenAIChoice = struct {
    index: u32,
    message: OpenAIMessage,
    finish_reason: []const u8,
    logprobs: ?std.json.Value = null,
};

const OpenAIUsage = struct {
    prompt_tokens: u32,
    completion_tokens: u32,
    total_tokens: u32,
    prompt_tokens_details: ?std.json.Value = null,
    completion_tokens_details: ?std.json.Value = null,
};

const OpenAIResponse = struct {
    id: []const u8,
    object: []const u8,
    created: u64,
    model: []const u8,
    choices: []OpenAIChoice,
    usage: ?OpenAIUsage = null,
    service_tier: ?[]const u8 = null,
    system_fingerprint: ?[]const u8 = null,
};

pub const SemanticCorrectionResult = struct {
    text: []const u8,
    attempted: bool = false,
    successful: bool = false,
    duration_ms: i64 = 0,
};

pub const SemanticCorrector = struct {
    cfg: config.SemanticCorrectionConfig,
    allocator: std.mem.Allocator,
    
    pub fn init(allocator: std.mem.Allocator, cfg: config.SemanticCorrectionConfig) SemanticCorrector {
        return SemanticCorrector{
            .cfg = cfg,
            .allocator = allocator,
        };
    }
    
    pub fn deinit(self: *SemanticCorrector) void {
        _ = self;
    }
    
    pub fn correct(self: *const SemanticCorrector, text: []const u8) ![]const u8 {
        const result = try self.correctWithMetrics(text);
        return result.text;
    }
    
    pub fn correctWithMetrics(self: *const SemanticCorrector, text: []const u8) !SemanticCorrectionResult {
        var result = SemanticCorrectionResult{
            .text = try self.allocator.dupe(u8, text),
        };
        
        if (!self.cfg.enabled or self.cfg.api_key.len == 0 or text.len == 0) {
            return result;
        }
        
        result.attempted = true;
        const start_time = std.time.milliTimestamp();
        
        const corrected = self.makeRequest(text) catch |err| {
            const end_time = std.time.milliTimestamp();
            result.duration_ms = end_time - start_time;
            std.debug.print("Semantic correction error: {}\n", .{err});
            return result;
        };
        
        const end_time = std.time.milliTimestamp();
        result.duration_ms = end_time - start_time;
        
        if (corrected.len > 0) {
            self.allocator.free(result.text);
            result.text = corrected;
            result.successful = true;
        }
        
        return result;
    }
    
    fn makeRequest(self: *const SemanticCorrector, text: []const u8) ![]const u8 {
        const json_payload = try self.createJsonPayload(text);
        defer self.allocator.free(json_payload);
        
        // Use curl via subprocess - write JSON to temp file to avoid shell escaping issues
        const temp_file = try std.fmt.allocPrint(self.allocator, "/tmp/wispra_semantic_{d}.json", .{std.time.milliTimestamp()});
        defer self.allocator.free(temp_file);
        
        const file = try std.fs.createFileAbsolute(temp_file, .{});
        defer file.close();
        defer std.fs.deleteFileAbsolute(temp_file) catch {};
        
        try file.writeAll(json_payload);
        
        const curl_cmd = try std.fmt.allocPrint(self.allocator, 
            \\curl -s -X POST "{s}" \
            \\  -H "Content-Type: application/json" \
            \\  -H "Authorization: Bearer {s}" \
            \\  -d @{s} \
            \\  --max-time {d}
        , .{ self.cfg.endpoint_url, self.cfg.api_key, temp_file, self.cfg.timeout_ms / 1000 });
        defer self.allocator.free(curl_cmd);
        
        const result = try std.process.Child.run(.{
            .allocator = self.allocator,
            .argv = &[_][]const u8{ "sh", "-c", curl_cmd },
        });
        defer self.allocator.free(result.stderr);
        
        if (result.term.Exited != 0) {
            std.debug.print("Curl failed with exit code {d}\n", .{result.term.Exited});
            std.debug.print("Curl stderr: {s}\n", .{result.stderr});
            std.debug.print("Curl stdout: {s}\n", .{result.stdout});
            self.allocator.free(result.stdout);
            return error.CurlFailed;
        }
        
        const response = try self.extractResponse(result.stdout);
        self.allocator.free(result.stdout);
        return response;
    }
    
    fn createJsonPayload(self: *const SemanticCorrector, text: []const u8) ![]const u8 {
        const RequestMessage = struct {
            role: []const u8,
            content: []const u8,
        };
        
        const RequestPayload = struct {
            model: []const u8,
            messages: []RequestMessage,
            max_tokens: u32 = 150,
            temperature: f32 = 0.3,
        };
        
        var messages = [_]RequestMessage{
            .{
                .role = "system",
                .content = "You are a helpful assistant that corrects a transcript to capture the intent of the user. You correct spelling errors, grammar errors, and artifacts of speech that result from a user pausing, using filler words, or correcting themselves mid-thought. e.g. 'lets get pizza actually lets get salad' should return 'lets get salad'. Only output the corrected text that aligns with the user's final intent, nothing else.",
            },
            .{
                .role = "user",
                .content = text,
            },
        };
        
        const payload = RequestPayload{
            .model = self.cfg.model,
            .messages = &messages,
        };
        
        var json_string = std.ArrayList(u8).init(self.allocator);
        defer json_string.deinit();
        
        try std.json.stringify(payload, .{}, json_string.writer());
        return json_string.toOwnedSlice();
    }
    
    fn extractResponse(self: *const SemanticCorrector, response_body: []const u8) ![]const u8 {
        const parsed = std.json.parseFromSlice(OpenAIResponse, self.allocator, response_body, .{}) catch |err| {
            std.debug.print("JSON parse error: {}\n", .{err});
            std.debug.print("Response body: {s}\n", .{response_body});
            return error.JsonParseError;
        };
        defer parsed.deinit();
        
        if (parsed.value.choices.len == 0) {
            return error.NoChoicesInResponse;
        }
        
        const content = parsed.value.choices[0].message.content;
        return try self.allocator.dupe(u8, content);
    }

};
