const std = @import("std");
const os = std.os;
const fs = std.fs;

pub const ModelConfig = struct {
    path: []const u8,
    threads: u32 = 4,

    pub fn init(allocator: std.mem.Allocator) !ModelConfig {
        const home = std.process.getEnvVarOwned(allocator, "HOME") catch try allocator.dupe(u8, "");
        defer allocator.free(home);
        const default_path = try std.fmt.allocPrint(allocator, "{s}/.cache/wispra/models/ggml-tiny.en-q5_1.bin", .{home});
        return ModelConfig{
            .path = default_path,
            .threads = 4,
        };
    }

    pub fn deinit(self: *ModelConfig, allocator: std.mem.Allocator) void {
        allocator.free(self.path);
    }
};

pub const OutputConfig = struct {
    mode: []const u8 = "type", // type|clipboard|stdout
    allocator: std.mem.Allocator,
    
    pub fn deinit(self: *OutputConfig) void {
        if (!std.mem.eql(u8, self.mode, "type") and 
            !std.mem.eql(u8, self.mode, "clipboard") and 
            !std.mem.eql(u8, self.mode, "stdout")) {
            self.allocator.free(self.mode);
        }
    }
};

pub const SemanticCorrectionConfig = struct {
    enabled: bool = false,
    endpoint_url: []const u8 = "https://api.openai.com/v1/chat/completions",
    api_key: []const u8 = "",
    model: []const u8 = "gpt-4o-mini",
    timeout_ms: u32 = 10000,
    allocator: ?std.mem.Allocator = null,
    
    pub fn deinit(self: *SemanticCorrectionConfig, allocator: std.mem.Allocator) void {
        if (self.api_key.len > 0 and self.allocator != null) {
            allocator.free(self.api_key);
        }
        if (!std.mem.eql(u8, self.model, "gpt-4o-mini") and self.allocator != null) {
            allocator.free(self.model);
        }
        if (!std.mem.eql(u8, self.endpoint_url, "https://api.openai.com/v1/chat/completions") and self.allocator != null) {
            allocator.free(self.endpoint_url);
        }
    }
};

pub const TranscriptionLogConfig = struct {
    enabled: bool = true,
    path: []const u8 = "~/.local/share/wispra/transcriptions.log",
    auto_cleanup_days: ?u32 = null, // null = no auto cleanup, otherwise days to keep
    
    allocator: std.mem.Allocator,
    
    pub fn deinit(self: *TranscriptionLogConfig) void {
        if (!std.mem.eql(u8, self.path, "~/.local/share/wispra/transcriptions.log")) {
            self.allocator.free(self.path);
        }
    }
};

pub const AppConfig = struct {
    model: ModelConfig,
    output: OutputConfig,
    semantic_correction: SemanticCorrectionConfig,
    transcription_log: TranscriptionLogConfig,
    config_path: []const u8,
    debug: bool = false,
    allocator: std.mem.Allocator,

    pub fn init(allocator: std.mem.Allocator) !AppConfig {
        return AppConfig{
            .model = try ModelConfig.init(allocator),
            .output = .{ .allocator = allocator },
            .semantic_correction = .{},
            .transcription_log = .{ .allocator = allocator },
            .config_path = "",
            .debug = false,
            .allocator = allocator,
        };
    }

    pub fn deinit(self: *AppConfig) void {
        self.model.deinit(self.allocator);
        self.output.deinit();
        self.semantic_correction.deinit(self.allocator);
        self.transcription_log.deinit();
        if (self.config_path.len > 0) {
            self.allocator.free(self.config_path);
        }
    }
};

pub const ConfigLoader = struct {
    pub fn load(allocator: std.mem.Allocator, path: []const u8) !AppConfig {
        var config = try AppConfig.init(allocator);
        
        // Use default config path if none provided
        var config_path = path;
        var owned_path: ?[]const u8 = null;
        if (path.len == 0) {
            const home = std.process.getEnvVarOwned(allocator, "HOME") catch "/tmp";
            defer allocator.free(home);
            owned_path = try std.fmt.allocPrint(allocator, "{s}/.config/wispra/config.toml", .{home});
            config_path = owned_path.?;
        }
        defer if (owned_path) |p| allocator.free(p);
        
        config.config_path = try allocator.dupe(u8, config_path);

        const file = fs.openFileAbsolute(config_path, .{}) catch {
            std.debug.print("Config file not found at {s}, using defaults\n", .{config_path});
            return config;
        };
        defer file.close();

        const content = try file.readToEndAlloc(allocator, 1024 * 1024); // 1MB max
        defer allocator.free(content);

        // Parse TOML sections
        if (parseSemanticCorrectionFromToml(allocator, content)) |semantic_cfg| {
            var new_cfg = semantic_cfg;
            new_cfg.allocator = allocator;
            config.semantic_correction = new_cfg;
        } else |_| {
            // Failed to parse, keep defaults
        }
        
        if (parseModelFromToml(allocator, content)) |model_cfg| {
            config.model.deinit(allocator);
            config.model = model_cfg;
        } else |_| {}
        
        if (parseOutputFromToml(allocator, content)) |output_cfg| {
            config.output = output_cfg;
        } else |_| {}
        
        if (parseTranscriptionLogFromToml(allocator, content)) |log_cfg| {
            config.transcription_log.deinit();
            config.transcription_log = log_cfg;
        } else |_| {}

        return config;
    }
    
    fn parseSemanticCorrectionFromToml(allocator: std.mem.Allocator, content: []const u8) !SemanticCorrectionConfig {
        var cfg = SemanticCorrectionConfig{};
        var in_semantic_section = false;
        
        var lines = std.mem.splitScalar(u8, content, '\n');
        while (lines.next()) |line| {
            var trimmed = std.mem.trim(u8, line, " \t\r");
            
            // Skip comments and empty lines
            if (trimmed.len == 0 or trimmed[0] == '#') continue;
            
            // Check for section headers
            if (std.mem.startsWith(u8, trimmed, "[semantic_correction]")) {
                in_semantic_section = true;
                continue;
            } else if (std.mem.startsWith(u8, trimmed, "[")) {
                in_semantic_section = false;
                continue;
            }
            
            if (!in_semantic_section) continue;
            
            // Parse key = value pairs
            if (std.mem.indexOf(u8, trimmed, " = ")) |eq_pos| {
                const key = std.mem.trim(u8, trimmed[0..eq_pos], " \t");
                var value = std.mem.trim(u8, trimmed[eq_pos + 3..], " \t");
                
                // Remove quotes from string values
                if (value.len >= 2 and value[0] == '"' and value[value.len - 1] == '"') {
                    value = value[1..value.len - 1];
                }
                
                if (std.mem.eql(u8, key, "enabled")) {
                    cfg.enabled = std.mem.eql(u8, value, "true");
                } else if (std.mem.eql(u8, key, "api_key")) {
                    cfg.api_key = try allocator.dupe(u8, value);
                } else if (std.mem.eql(u8, key, "model")) {
                    cfg.model = try allocator.dupe(u8, value);
                } else if (std.mem.eql(u8, key, "endpoint_url")) {
                    cfg.endpoint_url = try allocator.dupe(u8, value);
                } else if (std.mem.eql(u8, key, "timeout_ms")) {
                    cfg.timeout_ms = std.fmt.parseInt(u32, value, 10) catch 10000;
                }
            }
        }
        
        return cfg;
    }
    
    fn parseModelFromToml(allocator: std.mem.Allocator, content: []const u8) !ModelConfig {
        var cfg = try ModelConfig.init(allocator);
        var in_model_section = false;
        
        var lines = std.mem.splitScalar(u8, content, '\n');
        while (lines.next()) |line| {
            var trimmed = std.mem.trim(u8, line, " \t\r");
            if (trimmed.len == 0 or trimmed[0] == '#') continue;
            
            if (std.mem.startsWith(u8, trimmed, "[model]")) {
                in_model_section = true;
                continue;
            } else if (std.mem.startsWith(u8, trimmed, "[")) {
                in_model_section = false;
                continue;
            }
            
            if (!in_model_section) continue;
            
            if (std.mem.indexOf(u8, trimmed, " = ")) |eq_pos| {
                const key = std.mem.trim(u8, trimmed[0..eq_pos], " \t");
                var value = std.mem.trim(u8, trimmed[eq_pos + 3..], " \t");
                
                if (value.len >= 2 and value[0] == '"' and value[value.len - 1] == '"') {
                    value = value[1..value.len - 1];
                }
                
                if (std.mem.eql(u8, key, "path")) {
                    allocator.free(cfg.path);
                    // Expand ~ to home directory
                    if (std.mem.startsWith(u8, value, "~/")) {
                        const home = std.process.getEnvVarOwned(allocator, "HOME") catch "/home/swiecki";
                        defer allocator.free(home);
                        cfg.path = try std.fmt.allocPrint(allocator, "{s}{s}", .{home, value[1..]});
                    } else {
                        cfg.path = try allocator.dupe(u8, value);
                    }
                } else if (std.mem.eql(u8, key, "threads")) {
                    cfg.threads = std.fmt.parseInt(u32, value, 10) catch 4;
                }
            }
        }
        
        return cfg;
    }
    
    fn parseOutputFromToml(allocator: std.mem.Allocator, content: []const u8) !OutputConfig {
        var cfg = OutputConfig{
            .allocator = allocator,
        };
        var in_output_section = false;
        
        var lines = std.mem.splitScalar(u8, content, '\n');
        while (lines.next()) |line| {
            var trimmed = std.mem.trim(u8, line, " \t\r");
            if (trimmed.len == 0 or trimmed[0] == '#') continue;
            
            if (std.mem.startsWith(u8, trimmed, "[output]")) {
                in_output_section = true;
                continue;
            } else if (std.mem.startsWith(u8, trimmed, "[")) {
                in_output_section = false;
                continue;
            }
            
            if (!in_output_section) continue;
            
            if (std.mem.indexOf(u8, trimmed, " = ")) |eq_pos| {
                const key = std.mem.trim(u8, trimmed[0..eq_pos], " \t");
                var value = std.mem.trim(u8, trimmed[eq_pos + 3..], " \t");
                
                if (value.len >= 2 and value[0] == '"' and value[value.len - 1] == '"') {
                    value = value[1..value.len - 1];
                }
                
                if (std.mem.eql(u8, key, "mode")) {
                    cfg.mode = try allocator.dupe(u8, value);
                }
            }
        }
        
        return cfg;
    }
    
    fn parseTranscriptionLogFromToml(allocator: std.mem.Allocator, content: []const u8) !TranscriptionLogConfig {
        var cfg = TranscriptionLogConfig{
            .allocator = allocator,
        };
        var in_log_section = false;
        
        var lines = std.mem.splitScalar(u8, content, '\n');
        while (lines.next()) |line| {
            var trimmed = std.mem.trim(u8, line, " \t\r");
            if (trimmed.len == 0 or trimmed[0] == '#') continue;
            
            if (std.mem.startsWith(u8, trimmed, "[transcription_log]")) {
                in_log_section = true;
                continue;
            } else if (std.mem.startsWith(u8, trimmed, "[")) {
                in_log_section = false;
                continue;
            }
            
            if (!in_log_section) continue;
            
            if (std.mem.indexOf(u8, trimmed, " = ")) |eq_pos| {
                const key = std.mem.trim(u8, trimmed[0..eq_pos], " \t");
                var value = std.mem.trim(u8, trimmed[eq_pos + 3..], " \t");
                
                if (value.len >= 2 and value[0] == '"' and value[value.len - 1] == '"') {
                    value = value[1..value.len - 1];
                }
                
                if (std.mem.eql(u8, key, "enabled")) {
                    cfg.enabled = std.mem.eql(u8, value, "true");
                } else if (std.mem.eql(u8, key, "path")) {
                    cfg.path = try allocator.dupe(u8, value);
                } else if (std.mem.eql(u8, key, "auto_cleanup_days")) {
                    cfg.auto_cleanup_days = std.fmt.parseInt(u32, value, 10) catch null;
                }
            }
        }
        
        return cfg;
    }

    pub fn print(config: *const AppConfig) void {
        std.debug.print("Configuration:\n", .{});
        std.debug.print("  Model path: {s}\n", .{config.model.path});
        std.debug.print("  Model threads: {d}\n", .{config.model.threads});
        std.debug.print("  Output mode: {s}\n", .{config.output.mode});
        std.debug.print("  Transcription log enabled: {}\n", .{config.transcription_log.enabled});
        std.debug.print("  Transcription log path: {s}\n", .{config.transcription_log.path});
        if (config.transcription_log.auto_cleanup_days) |days| {
            std.debug.print("  Log auto cleanup: {} days\n", .{days});
        } else {
            std.debug.print("  Log auto cleanup: disabled\n", .{});
        }
        std.debug.print("  Debug: {}\n", .{config.debug});
        std.debug.print("  Semantic correction enabled: {}\n", .{config.semantic_correction.enabled});
        std.debug.print("  Semantic correction model: {s}\n", .{config.semantic_correction.model});
        std.debug.print("  API key set: {}\n", .{config.semantic_correction.api_key.len > 0});
    }
};
