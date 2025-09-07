const std = @import("std");
const c = @cImport({
    @cInclude("portaudio.h");
});

pub const PaDeviceInfoLite = struct {
    index: i32 = -1,
    name: []const u8,
    host_api: []const u8,
    max_input_channels: i32 = 0,
    default_samplerate: f64 = 0.0,
    is_default: bool = false,
};

pub const PortAudioCapture = struct {
    pub const FrameCallback = *const fn (pcm: []const i16, user_data: ?*anyopaque) void;
    
    stream: ?*c.PaStream = null,
    callback: ?FrameCallback = null,
    user_data: ?*anyopaque = null,
    allocator: std.mem.Allocator,
    
    pub fn init(allocator: std.mem.Allocator) PortAudioCapture {
        return PortAudioCapture{
            .allocator = allocator,
        };
    }
    
    pub fn deinit(self: *PortAudioCapture) void {
        self.stop();
    }
    
    // Audio callback wrapper for PortAudio
    fn audioCallback(
        input: ?*const anyopaque,
        output: ?*anyopaque,
        frameCount: c_ulong,
        timeInfo: ?*const c.PaStreamCallbackTimeInfo,
        statusFlags: c.PaStreamCallbackFlags,
        userData: ?*anyopaque,
    ) callconv(.C) c_int {
        _ = output;
        _ = timeInfo;
        _ = statusFlags;
        
        const self = @as(*PortAudioCapture, @ptrCast(@alignCast(userData.?)));
        if (input != null and self.callback != null) {
            const pcm = @as([*]const i16, @ptrCast(@alignCast(input)));
            self.callback.?(pcm[0..frameCount], self.user_data);
        }
        
        return c.paContinue;
    }
    
    pub fn start(
        self: *PortAudioCapture,
        sample_rate: i32,
        frame_ms: i32,
        device: []const u8,
        cb: FrameCallback,
        user_data: ?*anyopaque,
    ) !void {
        self.callback = cb;
        self.user_data = user_data;
        
        // Initialize PortAudio
        const pa_err = c.Pa_Initialize();
        if (pa_err != c.paNoError) {
            std.debug.print("Failed to initialize PortAudio: {s}\n", .{c.Pa_GetErrorText(pa_err)});
            return error.PortAudioInitFailed;
        }
        
        // Find device index
        var device_index: c.PaDeviceIndex = c.Pa_GetDefaultInputDevice();
        if (!std.mem.eql(u8, device, "default")) {
            // Try to parse as integer
            if (std.fmt.parseInt(i32, device, 10)) |idx| {
                device_index = idx;
            } else |_| {
                // Search by name substring
                const num_devices = c.Pa_GetDeviceCount();
                var i: c.PaDeviceIndex = 0;
                while (i < num_devices) : (i += 1) {
                    const info = c.Pa_GetDeviceInfo(i);
                    if (info != null and info.*.maxInputChannels > 0) {
                        const name = std.mem.span(info.*.name);
                        if (std.mem.indexOf(u8, name, device) != null) {
                            device_index = i;
                            break;
                        }
                    }
                }
            }
        }
        
        const device_info = c.Pa_GetDeviceInfo(device_index);
        if (device_info == null or device_info.*.maxInputChannels <= 0) {
            std.debug.print("Invalid audio device\n", .{});
            return error.InvalidDevice;
        }
        
        // Calculate frame size
        const frames_per_buffer = @as(c_ulong, @intCast(@divExact(sample_rate * frame_ms, 1000)));
        
        // Set up stream parameters
        var input_params = c.PaStreamParameters{
            .device = device_index,
            .channelCount = 1, // mono
            .sampleFormat = c.paInt16,
            .suggestedLatency = device_info.*.defaultLowInputLatency,
            .hostApiSpecificStreamInfo = null,
        };
        
        // Open stream
        const open_err = c.Pa_OpenStream(
            &self.stream,
            &input_params,
            null, // no output
            @as(f64, @floatFromInt(sample_rate)),
            frames_per_buffer,
            c.paClipOff,
            audioCallback,
            self,
        );
        
        if (open_err != c.paNoError) {
            std.debug.print("Failed to open PortAudio stream: {s}\n", .{c.Pa_GetErrorText(open_err)});
            return error.StreamOpenFailed;
        }
        
        // Start stream
        const start_err = c.Pa_StartStream(self.stream);
        if (start_err != c.paNoError) {
            std.debug.print("Failed to start PortAudio stream: {s}\n", .{c.Pa_GetErrorText(start_err)});
            _ = c.Pa_CloseStream(self.stream);
            self.stream = null;
            return error.StreamStartFailed;
        }
    }
    
    pub fn stop(self: *PortAudioCapture) void {
        if (self.stream) |stream| {
            _ = c.Pa_StopStream(stream);
            _ = c.Pa_CloseStream(stream);
            self.stream = null;
        }
        _ = c.Pa_Terminate();
    }
    
    pub fn listDevices(allocator: std.mem.Allocator) ![]PaDeviceInfoLite {
        const pa_err = c.Pa_Initialize();
        if (pa_err != c.paNoError) {
            return error.PortAudioInitFailed;
        }
        defer _ = c.Pa_Terminate();
        
        var devices = std.ArrayList(PaDeviceInfoLite).init(allocator);
        defer devices.deinit();
        
        const num_devices = c.Pa_GetDeviceCount();
        const default_input = c.Pa_GetDefaultInputDevice();
        
        var i: c.PaDeviceIndex = 0;
        while (i < num_devices) : (i += 1) {
            const info = c.Pa_GetDeviceInfo(i);
            if (info != null and info.*.maxInputChannels > 0) {
                const host_api_info = c.Pa_GetHostApiInfo(info.*.hostApi);
                
                try devices.append(PaDeviceInfoLite{
                    .index = i,
                    .name = try allocator.dupeZ(u8, std.mem.span(info.*.name)),
                    .host_api = if (host_api_info != null) 
                        try allocator.dupeZ(u8, std.mem.span(host_api_info.*.name))
                    else
                        try allocator.dupeZ(u8, "Unknown"),
                    .max_input_channels = info.*.maxInputChannels,
                    .default_samplerate = info.*.defaultSampleRate,
                    .is_default = (i == default_input),
                });
            }
        }
        
        return devices.toOwnedSlice();
    }
    
    pub fn listDevicesText(allocator: std.mem.Allocator) ![]u8 {
        const devices = try listDevices(allocator);
        defer {
            for (devices) |*device| {
                allocator.free(device.name);
                allocator.free(device.host_api);
            }
            allocator.free(devices);
        }
        
        var buf = std.ArrayList(u8).init(allocator);
        defer buf.deinit();
        
        const writer = buf.writer();
        try writer.writeAll("Available audio input devices:\n");
        
        for (devices) |device| {
            try writer.print("  [{d}] {s} ({s}) - {d} channels @ {d:.0} Hz", .{
                device.index,
                device.name,
                device.host_api,
                device.max_input_channels,
                device.default_samplerate,
            });
            if (device.is_default) {
                try writer.writeAll(" [DEFAULT]");
            }
            try writer.writeAll("\n");
        }
        
        return buf.toOwnedSlice();
    }
};
