const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    // Build wisprad daemon
    const wisprad = b.addExecutable(.{
        .name = "wisprad",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });
    
    // Link with system libraries
    wisprad.linkLibC();
    wisprad.linkLibCpp();
    wisprad.linkSystemLibrary("portaudio");
    wisprad.linkSystemLibrary("pthread");
    wisprad.linkSystemLibrary("dl");
    wisprad.linkSystemLibrary("m"); // math library

    // Whisper.cpp integration
    const whisper_root = "/home/swiecki/Coding/wispra/third_party/whisper.cpp";
const whisper_build = "/home/swiecki/Coding/wispra/third_party/whisper.cpp/build";
    
    wisprad.addIncludePath(.{ .cwd_relative = whisper_root });
    wisprad.addIncludePath(.{ .cwd_relative = whisper_root ++ "/include" });
    wisprad.addIncludePath(.{ .cwd_relative = whisper_root ++ "/ggml/include" });
    
    // Link to built libraries
    wisprad.addLibraryPath(.{ .cwd_relative = whisper_build ++ "/src" });
    wisprad.addLibraryPath(.{ .cwd_relative = whisper_build ++ "/ggml/src" });
    wisprad.linkSystemLibrary("whisper");
    wisprad.linkSystemLibrary("ggml");
    
    // Install the daemon
    b.installArtifact(wisprad);
    
    // Build wispra-ptt CLI
    const wispra_ptt = b.addExecutable(.{
        .name = "wispra-ptt",
        .root_source_file = b.path("src/cli/wispra_cli.zig"),
        .target = target,
        .optimize = optimize,
    });
    
    // Install the CLI
    b.installArtifact(wispra_ptt);
    
    // Create run step for daemon
    const run_cmd = b.addRunArtifact(wisprad);
    run_cmd.step.dependOn(b.getInstallStep());
    
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }
    
    const run_step = b.step("run", "Run the daemon");
    run_step.dependOn(&run_cmd.step);
    
    // Create run step for CLI
    const run_cli_cmd = b.addRunArtifact(wispra_ptt);
    run_cli_cmd.step.dependOn(b.getInstallStep());
    
    if (b.args) |args| {
        run_cli_cmd.addArgs(args);
    }
    
    const run_cli_step = b.step("run-cli", "Run the CLI");
    run_cli_step.dependOn(&run_cli_cmd.step);
}
