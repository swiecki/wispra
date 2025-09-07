pub const packages = struct {
    pub const @"N-V-__8AAH-mpwB7g3MnqYU-ooUBF1t99RP27dZ9addtMVXD" = struct {
        pub const build_root = "/home/swiecki/.cache/zig/p/N-V-__8AAH-mpwB7g3MnqYU-ooUBF1t99RP27dZ9addtMVXD";
        pub const deps: []const struct { []const u8, []const u8 } = &.{};
    };
    pub const @"sqlite-3.48.0-F2R_a5yODgDFvwwsytm7ZONcSqYBo3qv1PmXOtw3tqLA" = struct {
        pub const build_root = "/home/swiecki/.cache/zig/p/sqlite-3.48.0-F2R_a5yODgDFvwwsytm7ZONcSqYBo3qv1PmXOtw3tqLA";
        pub const build_zig = @import("sqlite-3.48.0-F2R_a5yODgDFvwwsytm7ZONcSqYBo3qv1PmXOtw3tqLA");
        pub const deps: []const struct { []const u8, []const u8 } = &.{
            .{ "sqlite", "N-V-__8AAH-mpwB7g3MnqYU-ooUBF1t99RP27dZ9addtMVXD" },
        };
    };
    pub const @"vaxis-0.5.1-BWNV_JIWCQAoX8lZ-5eLf-sFzA-h7aXvNNEenyC2b83s" = struct {
        pub const build_root = "/home/swiecki/.cache/zig/p/vaxis-0.5.1-BWNV_JIWCQAoX8lZ-5eLf-sFzA-h7aXvNNEenyC2b83s";
        pub const build_zig = @import("vaxis-0.5.1-BWNV_JIWCQAoX8lZ-5eLf-sFzA-h7aXvNNEenyC2b83s");
        pub const deps: []const struct { []const u8, []const u8 } = &.{
            .{ "zigimg", "zigimg-0.1.0-8_eo2nWlEgCddu8EGLOM_RkYshx3sC8tWv-yYA4-htS6" },
            .{ "zg", "zg-0.14.1-oGqU3IQ_tALZIiBN026_NTaPJqU-Upm8P_C7QED2Rzm8" },
        };
    };
    pub const @"zg-0.14.1-oGqU3IQ_tALZIiBN026_NTaPJqU-Upm8P_C7QED2Rzm8" = struct {
        pub const build_root = "/home/swiecki/.cache/zig/p/zg-0.14.1-oGqU3IQ_tALZIiBN026_NTaPJqU-Upm8P_C7QED2Rzm8";
        pub const build_zig = @import("zg-0.14.1-oGqU3IQ_tALZIiBN026_NTaPJqU-Upm8P_C7QED2Rzm8");
        pub const deps: []const struct { []const u8, []const u8 } = &.{
        };
    };
    pub const @"zigimg-0.1.0-8_eo2nWlEgCddu8EGLOM_RkYshx3sC8tWv-yYA4-htS6" = struct {
        pub const build_root = "/home/swiecki/.cache/zig/p/zigimg-0.1.0-8_eo2nWlEgCddu8EGLOM_RkYshx3sC8tWv-yYA4-htS6";
        pub const build_zig = @import("zigimg-0.1.0-8_eo2nWlEgCddu8EGLOM_RkYshx3sC8tWv-yYA4-htS6");
        pub const deps: []const struct { []const u8, []const u8 } = &.{
        };
    };
};

pub const root_deps: []const struct { []const u8, []const u8 } = &.{
    .{ "sqlite", "sqlite-3.48.0-F2R_a5yODgDFvwwsytm7ZONcSqYBo3qv1PmXOtw3tqLA" },
    .{ "vaxis", "vaxis-0.5.1-BWNV_JIWCQAoX8lZ-5eLf-sFzA-h7aXvNNEenyC2b83s" },
};
