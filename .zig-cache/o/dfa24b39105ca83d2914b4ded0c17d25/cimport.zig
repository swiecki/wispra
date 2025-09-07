pub const __builtin_bswap16 = @import("std").zig.c_builtins.__builtin_bswap16;
pub const __builtin_bswap32 = @import("std").zig.c_builtins.__builtin_bswap32;
pub const __builtin_bswap64 = @import("std").zig.c_builtins.__builtin_bswap64;
pub const __builtin_signbit = @import("std").zig.c_builtins.__builtin_signbit;
pub const __builtin_signbitf = @import("std").zig.c_builtins.__builtin_signbitf;
pub const __builtin_popcount = @import("std").zig.c_builtins.__builtin_popcount;
pub const __builtin_ctz = @import("std").zig.c_builtins.__builtin_ctz;
pub const __builtin_clz = @import("std").zig.c_builtins.__builtin_clz;
pub const __builtin_sqrt = @import("std").zig.c_builtins.__builtin_sqrt;
pub const __builtin_sqrtf = @import("std").zig.c_builtins.__builtin_sqrtf;
pub const __builtin_sin = @import("std").zig.c_builtins.__builtin_sin;
pub const __builtin_sinf = @import("std").zig.c_builtins.__builtin_sinf;
pub const __builtin_cos = @import("std").zig.c_builtins.__builtin_cos;
pub const __builtin_cosf = @import("std").zig.c_builtins.__builtin_cosf;
pub const __builtin_exp = @import("std").zig.c_builtins.__builtin_exp;
pub const __builtin_expf = @import("std").zig.c_builtins.__builtin_expf;
pub const __builtin_exp2 = @import("std").zig.c_builtins.__builtin_exp2;
pub const __builtin_exp2f = @import("std").zig.c_builtins.__builtin_exp2f;
pub const __builtin_log = @import("std").zig.c_builtins.__builtin_log;
pub const __builtin_logf = @import("std").zig.c_builtins.__builtin_logf;
pub const __builtin_log2 = @import("std").zig.c_builtins.__builtin_log2;
pub const __builtin_log2f = @import("std").zig.c_builtins.__builtin_log2f;
pub const __builtin_log10 = @import("std").zig.c_builtins.__builtin_log10;
pub const __builtin_log10f = @import("std").zig.c_builtins.__builtin_log10f;
pub const __builtin_abs = @import("std").zig.c_builtins.__builtin_abs;
pub const __builtin_labs = @import("std").zig.c_builtins.__builtin_labs;
pub const __builtin_llabs = @import("std").zig.c_builtins.__builtin_llabs;
pub const __builtin_fabs = @import("std").zig.c_builtins.__builtin_fabs;
pub const __builtin_fabsf = @import("std").zig.c_builtins.__builtin_fabsf;
pub const __builtin_floor = @import("std").zig.c_builtins.__builtin_floor;
pub const __builtin_floorf = @import("std").zig.c_builtins.__builtin_floorf;
pub const __builtin_ceil = @import("std").zig.c_builtins.__builtin_ceil;
pub const __builtin_ceilf = @import("std").zig.c_builtins.__builtin_ceilf;
pub const __builtin_trunc = @import("std").zig.c_builtins.__builtin_trunc;
pub const __builtin_truncf = @import("std").zig.c_builtins.__builtin_truncf;
pub const __builtin_round = @import("std").zig.c_builtins.__builtin_round;
pub const __builtin_roundf = @import("std").zig.c_builtins.__builtin_roundf;
pub const __builtin_strlen = @import("std").zig.c_builtins.__builtin_strlen;
pub const __builtin_strcmp = @import("std").zig.c_builtins.__builtin_strcmp;
pub const __builtin_object_size = @import("std").zig.c_builtins.__builtin_object_size;
pub const __builtin___memset_chk = @import("std").zig.c_builtins.__builtin___memset_chk;
pub const __builtin_memset = @import("std").zig.c_builtins.__builtin_memset;
pub const __builtin___memcpy_chk = @import("std").zig.c_builtins.__builtin___memcpy_chk;
pub const __builtin_memcpy = @import("std").zig.c_builtins.__builtin_memcpy;
pub const __builtin_expect = @import("std").zig.c_builtins.__builtin_expect;
pub const __builtin_nanf = @import("std").zig.c_builtins.__builtin_nanf;
pub const __builtin_huge_valf = @import("std").zig.c_builtins.__builtin_huge_valf;
pub const __builtin_inff = @import("std").zig.c_builtins.__builtin_inff;
pub const __builtin_isnan = @import("std").zig.c_builtins.__builtin_isnan;
pub const __builtin_isinf = @import("std").zig.c_builtins.__builtin_isinf;
pub const __builtin_isinf_sign = @import("std").zig.c_builtins.__builtin_isinf_sign;
pub const __has_builtin = @import("std").zig.c_builtins.__has_builtin;
pub const __builtin_assume = @import("std").zig.c_builtins.__builtin_assume;
pub const __builtin_unreachable = @import("std").zig.c_builtins.__builtin_unreachable;
pub const __builtin_constant_p = @import("std").zig.c_builtins.__builtin_constant_p;
pub const __builtin_mul_overflow = @import("std").zig.c_builtins.__builtin_mul_overflow;
pub const ptrdiff_t = c_long;
pub const wchar_t = c_int;
pub const max_align_t = extern struct {
    __clang_max_align_nonce1: c_longlong align(8) = @import("std").mem.zeroes(c_longlong),
    __clang_max_align_nonce2: c_longdouble align(16) = @import("std").mem.zeroes(c_longdouble),
};
pub const __u_char = u8;
pub const __u_short = c_ushort;
pub const __u_int = c_uint;
pub const __u_long = c_ulong;
pub const __int8_t = i8;
pub const __uint8_t = u8;
pub const __int16_t = c_short;
pub const __uint16_t = c_ushort;
pub const __int32_t = c_int;
pub const __uint32_t = c_uint;
pub const __int64_t = c_long;
pub const __uint64_t = c_ulong;
pub const __int_least8_t = __int8_t;
pub const __uint_least8_t = __uint8_t;
pub const __int_least16_t = __int16_t;
pub const __uint_least16_t = __uint16_t;
pub const __int_least32_t = __int32_t;
pub const __uint_least32_t = __uint32_t;
pub const __int_least64_t = __int64_t;
pub const __uint_least64_t = __uint64_t;
pub const __quad_t = c_long;
pub const __u_quad_t = c_ulong;
pub const __intmax_t = c_long;
pub const __uintmax_t = c_ulong;
pub const __dev_t = c_ulong;
pub const __uid_t = c_uint;
pub const __gid_t = c_uint;
pub const __ino_t = c_ulong;
pub const __ino64_t = c_ulong;
pub const __mode_t = c_uint;
pub const __nlink_t = c_ulong;
pub const __off_t = c_long;
pub const __off64_t = c_long;
pub const __pid_t = c_int;
pub const __fsid_t = extern struct {
    __val: [2]c_int = @import("std").mem.zeroes([2]c_int),
};
pub const __clock_t = c_long;
pub const __rlim_t = c_ulong;
pub const __rlim64_t = c_ulong;
pub const __id_t = c_uint;
pub const __time_t = c_long;
pub const __useconds_t = c_uint;
pub const __suseconds_t = c_long;
pub const __suseconds64_t = c_long;
pub const __daddr_t = c_int;
pub const __key_t = c_int;
pub const __clockid_t = c_int;
pub const __timer_t = ?*anyopaque;
pub const __blksize_t = c_long;
pub const __blkcnt_t = c_long;
pub const __blkcnt64_t = c_long;
pub const __fsblkcnt_t = c_ulong;
pub const __fsblkcnt64_t = c_ulong;
pub const __fsfilcnt_t = c_ulong;
pub const __fsfilcnt64_t = c_ulong;
pub const __fsword_t = c_long;
pub const __ssize_t = c_long;
pub const __syscall_slong_t = c_long;
pub const __syscall_ulong_t = c_ulong;
pub const __loff_t = __off64_t;
pub const __caddr_t = [*c]u8;
pub const __intptr_t = c_long;
pub const __socklen_t = c_uint;
pub const __sig_atomic_t = c_int;
pub const int_least8_t = __int_least8_t;
pub const int_least16_t = __int_least16_t;
pub const int_least32_t = __int_least32_t;
pub const int_least64_t = __int_least64_t;
pub const uint_least8_t = __uint_least8_t;
pub const uint_least16_t = __uint_least16_t;
pub const uint_least32_t = __uint_least32_t;
pub const uint_least64_t = __uint_least64_t;
pub const int_fast8_t = i8;
pub const int_fast16_t = c_long;
pub const int_fast32_t = c_long;
pub const int_fast64_t = c_long;
pub const uint_fast8_t = u8;
pub const uint_fast16_t = c_ulong;
pub const uint_fast32_t = c_ulong;
pub const uint_fast64_t = c_ulong;
pub const intmax_t = __intmax_t;
pub const uintmax_t = __uintmax_t;
pub const struct___va_list_tag_1 = extern struct {
    gp_offset: c_uint = @import("std").mem.zeroes(c_uint),
    fp_offset: c_uint = @import("std").mem.zeroes(c_uint),
    overflow_arg_area: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    reg_save_area: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const __builtin_va_list = [1]struct___va_list_tag_1;
pub const __gnuc_va_list = __builtin_va_list;
const union_unnamed_2 = extern union {
    __wch: c_uint,
    __wchb: [4]u8,
};
pub const __mbstate_t = extern struct {
    __count: c_int = @import("std").mem.zeroes(c_int),
    __value: union_unnamed_2 = @import("std").mem.zeroes(union_unnamed_2),
};
pub const struct__G_fpos_t = extern struct {
    __pos: __off_t = @import("std").mem.zeroes(__off_t),
    __state: __mbstate_t = @import("std").mem.zeroes(__mbstate_t),
};
pub const __fpos_t = struct__G_fpos_t;
pub const struct__G_fpos64_t = extern struct {
    __pos: __off64_t = @import("std").mem.zeroes(__off64_t),
    __state: __mbstate_t = @import("std").mem.zeroes(__mbstate_t),
};
pub const __fpos64_t = struct__G_fpos64_t;
pub const struct__IO_marker = opaque {};
// /usr/include/bits/types/struct_FILE.h:75:7: warning: struct demoted to opaque type - has bitfield
pub const struct__IO_FILE = opaque {};
pub const __FILE = struct__IO_FILE;
pub const FILE = struct__IO_FILE;
pub const struct__IO_codecvt = opaque {};
pub const struct__IO_wide_data = opaque {};
pub const _IO_lock_t = anyopaque;
pub const cookie_read_function_t = fn (?*anyopaque, [*c]u8, usize) callconv(.c) __ssize_t;
pub const cookie_write_function_t = fn (?*anyopaque, [*c]const u8, usize) callconv(.c) __ssize_t;
pub const cookie_seek_function_t = fn (?*anyopaque, [*c]__off64_t, c_int) callconv(.c) c_int;
pub const cookie_close_function_t = fn (?*anyopaque) callconv(.c) c_int;
pub const struct__IO_cookie_io_functions_t = extern struct {
    read: ?*const cookie_read_function_t = @import("std").mem.zeroes(?*const cookie_read_function_t),
    write: ?*const cookie_write_function_t = @import("std").mem.zeroes(?*const cookie_write_function_t),
    seek: ?*const cookie_seek_function_t = @import("std").mem.zeroes(?*const cookie_seek_function_t),
    close: ?*const cookie_close_function_t = @import("std").mem.zeroes(?*const cookie_close_function_t),
};
pub const cookie_io_functions_t = struct__IO_cookie_io_functions_t;
pub const va_list = __gnuc_va_list;
pub const off_t = __off_t;
pub const fpos_t = __fpos_t;
pub extern var stdin: ?*FILE;
pub extern var stdout: ?*FILE;
pub extern var stderr: ?*FILE;
pub extern fn remove(__filename: [*c]const u8) c_int;
pub extern fn rename(__old: [*c]const u8, __new: [*c]const u8) c_int;
pub extern fn renameat(__oldfd: c_int, __old: [*c]const u8, __newfd: c_int, __new: [*c]const u8) c_int;
pub extern fn fclose(__stream: ?*FILE) c_int;
pub extern fn tmpfile() ?*FILE;
pub extern fn tmpnam([*c]u8) [*c]u8;
pub extern fn tmpnam_r(__s: [*c]u8) [*c]u8;
pub extern fn tempnam(__dir: [*c]const u8, __pfx: [*c]const u8) [*c]u8;
pub extern fn fflush(__stream: ?*FILE) c_int;
pub extern fn fflush_unlocked(__stream: ?*FILE) c_int;
pub extern fn fopen(__filename: [*c]const u8, __modes: [*c]const u8) ?*FILE;
pub extern fn freopen(noalias __filename: [*c]const u8, noalias __modes: [*c]const u8, noalias __stream: ?*FILE) ?*FILE;
pub extern fn fdopen(__fd: c_int, __modes: [*c]const u8) ?*FILE;
pub extern fn fopencookie(noalias __magic_cookie: ?*anyopaque, noalias __modes: [*c]const u8, __io_funcs: cookie_io_functions_t) ?*FILE;
pub extern fn fmemopen(__s: ?*anyopaque, __len: usize, __modes: [*c]const u8) ?*FILE;
pub extern fn open_memstream(__bufloc: [*c][*c]u8, __sizeloc: [*c]usize) ?*FILE;
pub extern fn setbuf(noalias __stream: ?*FILE, noalias __buf: [*c]u8) void;
pub extern fn setvbuf(noalias __stream: ?*FILE, noalias __buf: [*c]u8, __modes: c_int, __n: usize) c_int;
pub extern fn setbuffer(noalias __stream: ?*FILE, noalias __buf: [*c]u8, __size: usize) void;
pub extern fn setlinebuf(__stream: ?*FILE) void;
pub extern fn fprintf(noalias __stream: ?*FILE, noalias __format: [*c]const u8, ...) c_int;
pub extern fn printf(__format: [*c]const u8, ...) c_int;
pub extern fn sprintf(noalias __s: [*c]u8, noalias __format: [*c]const u8, ...) c_int;
pub extern fn vfprintf(noalias __s: ?*FILE, noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag_1) c_int;
pub extern fn vprintf(noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag_1) c_int;
pub extern fn vsprintf(noalias __s: [*c]u8, noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag_1) c_int;
pub extern fn snprintf(noalias __s: [*c]u8, __maxlen: c_ulong, noalias __format: [*c]const u8, ...) c_int;
pub extern fn vsnprintf(noalias __s: [*c]u8, __maxlen: c_ulong, noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag_1) c_int;
pub extern fn vasprintf(noalias __ptr: [*c][*c]u8, noalias __f: [*c]const u8, __arg: [*c]struct___va_list_tag_1) c_int;
pub extern fn __asprintf(noalias __ptr: [*c][*c]u8, noalias __fmt: [*c]const u8, ...) c_int;
pub extern fn asprintf(noalias __ptr: [*c][*c]u8, noalias __fmt: [*c]const u8, ...) c_int;
pub extern fn vdprintf(__fd: c_int, noalias __fmt: [*c]const u8, __arg: [*c]struct___va_list_tag_1) c_int;
pub extern fn dprintf(__fd: c_int, noalias __fmt: [*c]const u8, ...) c_int;
pub extern fn fscanf(noalias __stream: ?*FILE, noalias __format: [*c]const u8, ...) c_int;
pub extern fn scanf(noalias __format: [*c]const u8, ...) c_int;
pub extern fn sscanf(noalias __s: [*c]const u8, noalias __format: [*c]const u8, ...) c_int;
// /usr/include/bits/floatn.h:83:24: warning: unsupported type: 'Complex'
pub const __cfloat128 = @compileError("unable to resolve typedef child type");
// /usr/include/bits/floatn.h:83:24
pub const _Float128 = f128;
pub const _Float32 = f32;
pub const _Float64 = f64;
pub const _Float32x = f64;
pub const _Float64x = c_longdouble;
pub extern fn vfscanf(noalias __s: ?*FILE, noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag_1) c_int;
pub extern fn vscanf(noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag_1) c_int;
pub extern fn vsscanf(noalias __s: [*c]const u8, noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag_1) c_int;
pub extern fn fgetc(__stream: ?*FILE) c_int;
pub extern fn getc(__stream: ?*FILE) c_int;
pub extern fn getchar() c_int;
pub extern fn getc_unlocked(__stream: ?*FILE) c_int;
pub extern fn getchar_unlocked() c_int;
pub extern fn fgetc_unlocked(__stream: ?*FILE) c_int;
pub extern fn fputc(__c: c_int, __stream: ?*FILE) c_int;
pub extern fn putc(__c: c_int, __stream: ?*FILE) c_int;
pub extern fn putchar(__c: c_int) c_int;
pub extern fn fputc_unlocked(__c: c_int, __stream: ?*FILE) c_int;
pub extern fn putc_unlocked(__c: c_int, __stream: ?*FILE) c_int;
pub extern fn putchar_unlocked(__c: c_int) c_int;
pub extern fn getw(__stream: ?*FILE) c_int;
pub extern fn putw(__w: c_int, __stream: ?*FILE) c_int;
pub extern fn fgets(noalias __s: [*c]u8, __n: c_int, noalias __stream: ?*FILE) [*c]u8;
pub extern fn __getdelim(noalias __lineptr: [*c][*c]u8, noalias __n: [*c]usize, __delimiter: c_int, noalias __stream: ?*FILE) __ssize_t;
pub extern fn getdelim(noalias __lineptr: [*c][*c]u8, noalias __n: [*c]usize, __delimiter: c_int, noalias __stream: ?*FILE) __ssize_t;
pub extern fn getline(noalias __lineptr: [*c][*c]u8, noalias __n: [*c]usize, noalias __stream: ?*FILE) __ssize_t;
pub extern fn fputs(noalias __s: [*c]const u8, noalias __stream: ?*FILE) c_int;
pub extern fn puts(__s: [*c]const u8) c_int;
pub extern fn ungetc(__c: c_int, __stream: ?*FILE) c_int;
pub extern fn fread(__ptr: ?*anyopaque, __size: c_ulong, __n: c_ulong, __stream: ?*FILE) c_ulong;
pub extern fn fwrite(__ptr: ?*const anyopaque, __size: c_ulong, __n: c_ulong, __s: ?*FILE) c_ulong;
pub extern fn fread_unlocked(noalias __ptr: ?*anyopaque, __size: usize, __n: usize, noalias __stream: ?*FILE) usize;
pub extern fn fwrite_unlocked(noalias __ptr: ?*const anyopaque, __size: usize, __n: usize, noalias __stream: ?*FILE) usize;
pub extern fn fseek(__stream: ?*FILE, __off: c_long, __whence: c_int) c_int;
pub extern fn ftell(__stream: ?*FILE) c_long;
pub extern fn rewind(__stream: ?*FILE) void;
pub extern fn fseeko(__stream: ?*FILE, __off: __off_t, __whence: c_int) c_int;
pub extern fn ftello(__stream: ?*FILE) __off_t;
pub extern fn fgetpos(noalias __stream: ?*FILE, noalias __pos: [*c]fpos_t) c_int;
pub extern fn fsetpos(__stream: ?*FILE, __pos: [*c]const fpos_t) c_int;
pub extern fn clearerr(__stream: ?*FILE) void;
pub extern fn feof(__stream: ?*FILE) c_int;
pub extern fn ferror(__stream: ?*FILE) c_int;
pub extern fn clearerr_unlocked(__stream: ?*FILE) void;
pub extern fn feof_unlocked(__stream: ?*FILE) c_int;
pub extern fn ferror_unlocked(__stream: ?*FILE) c_int;
pub extern fn perror(__s: [*c]const u8) void;
pub extern fn fileno(__stream: ?*FILE) c_int;
pub extern fn fileno_unlocked(__stream: ?*FILE) c_int;
pub extern fn pclose(__stream: ?*FILE) c_int;
pub extern fn popen(__command: [*c]const u8, __modes: [*c]const u8) ?*FILE;
pub extern fn ctermid(__s: [*c]u8) [*c]u8;
pub extern fn flockfile(__stream: ?*FILE) void;
pub extern fn ftrylockfile(__stream: ?*FILE) c_int;
pub extern fn funlockfile(__stream: ?*FILE) void;
pub extern fn __uflow(?*FILE) c_int;
pub extern fn __overflow(?*FILE, c_int) c_int;
pub const ggml_abort_callback_t = ?*const fn ([*c]const u8) callconv(.c) void;
pub extern fn ggml_set_abort_callback(callback: ggml_abort_callback_t) ggml_abort_callback_t;
pub extern fn ggml_abort(file: [*c]const u8, line: c_int, fmt: [*c]const u8, ...) void;
pub const GGML_STATUS_ALLOC_FAILED: c_int = -2;
pub const GGML_STATUS_FAILED: c_int = -1;
pub const GGML_STATUS_SUCCESS: c_int = 0;
pub const GGML_STATUS_ABORTED: c_int = 1;
pub const enum_ggml_status = c_int;
pub extern fn ggml_status_to_string(status: enum_ggml_status) [*c]const u8;
pub const ggml_fp16_t = u16;
pub extern fn ggml_fp16_to_fp32(ggml_fp16_t) f32;
pub extern fn ggml_fp32_to_fp16(f32) ggml_fp16_t;
pub extern fn ggml_fp16_to_fp32_row([*c]const ggml_fp16_t, [*c]f32, i64) void;
pub extern fn ggml_fp32_to_fp16_row([*c]const f32, [*c]ggml_fp16_t, i64) void;
pub const ggml_bf16_t = extern struct {
    bits: u16 = @import("std").mem.zeroes(u16),
};
pub extern fn ggml_fp32_to_bf16(f32) ggml_bf16_t;
pub extern fn ggml_bf16_to_fp32(ggml_bf16_t) f32;
pub extern fn ggml_bf16_to_fp32_row([*c]const ggml_bf16_t, [*c]f32, i64) void;
pub extern fn ggml_fp32_to_bf16_row_ref([*c]const f32, [*c]ggml_bf16_t, i64) void;
pub extern fn ggml_fp32_to_bf16_row([*c]const f32, [*c]ggml_bf16_t, i64) void;
pub const struct_ggml_object = opaque {};
pub const struct_ggml_context = opaque {};
pub const struct_ggml_cgraph = opaque {};
pub const GGML_TYPE_F32: c_int = 0;
pub const GGML_TYPE_F16: c_int = 1;
pub const GGML_TYPE_Q4_0: c_int = 2;
pub const GGML_TYPE_Q4_1: c_int = 3;
pub const GGML_TYPE_Q5_0: c_int = 6;
pub const GGML_TYPE_Q5_1: c_int = 7;
pub const GGML_TYPE_Q8_0: c_int = 8;
pub const GGML_TYPE_Q8_1: c_int = 9;
pub const GGML_TYPE_Q2_K: c_int = 10;
pub const GGML_TYPE_Q3_K: c_int = 11;
pub const GGML_TYPE_Q4_K: c_int = 12;
pub const GGML_TYPE_Q5_K: c_int = 13;
pub const GGML_TYPE_Q6_K: c_int = 14;
pub const GGML_TYPE_Q8_K: c_int = 15;
pub const GGML_TYPE_IQ2_XXS: c_int = 16;
pub const GGML_TYPE_IQ2_XS: c_int = 17;
pub const GGML_TYPE_IQ3_XXS: c_int = 18;
pub const GGML_TYPE_IQ1_S: c_int = 19;
pub const GGML_TYPE_IQ4_NL: c_int = 20;
pub const GGML_TYPE_IQ3_S: c_int = 21;
pub const GGML_TYPE_IQ2_S: c_int = 22;
pub const GGML_TYPE_IQ4_XS: c_int = 23;
pub const GGML_TYPE_I8: c_int = 24;
pub const GGML_TYPE_I16: c_int = 25;
pub const GGML_TYPE_I32: c_int = 26;
pub const GGML_TYPE_I64: c_int = 27;
pub const GGML_TYPE_F64: c_int = 28;
pub const GGML_TYPE_IQ1_M: c_int = 29;
pub const GGML_TYPE_BF16: c_int = 30;
pub const GGML_TYPE_TQ1_0: c_int = 34;
pub const GGML_TYPE_TQ2_0: c_int = 35;
pub const GGML_TYPE_MXFP4: c_int = 39;
pub const GGML_TYPE_COUNT: c_int = 40;
pub const enum_ggml_type = c_uint;
pub const GGML_PREC_DEFAULT: c_int = 0;
pub const GGML_PREC_F32: c_int = 10;
pub const enum_ggml_prec = c_uint;
pub const GGML_FTYPE_UNKNOWN: c_int = -1;
pub const GGML_FTYPE_ALL_F32: c_int = 0;
pub const GGML_FTYPE_MOSTLY_F16: c_int = 1;
pub const GGML_FTYPE_MOSTLY_Q4_0: c_int = 2;
pub const GGML_FTYPE_MOSTLY_Q4_1: c_int = 3;
pub const GGML_FTYPE_MOSTLY_Q4_1_SOME_F16: c_int = 4;
pub const GGML_FTYPE_MOSTLY_Q8_0: c_int = 7;
pub const GGML_FTYPE_MOSTLY_Q5_0: c_int = 8;
pub const GGML_FTYPE_MOSTLY_Q5_1: c_int = 9;
pub const GGML_FTYPE_MOSTLY_Q2_K: c_int = 10;
pub const GGML_FTYPE_MOSTLY_Q3_K: c_int = 11;
pub const GGML_FTYPE_MOSTLY_Q4_K: c_int = 12;
pub const GGML_FTYPE_MOSTLY_Q5_K: c_int = 13;
pub const GGML_FTYPE_MOSTLY_Q6_K: c_int = 14;
pub const GGML_FTYPE_MOSTLY_IQ2_XXS: c_int = 15;
pub const GGML_FTYPE_MOSTLY_IQ2_XS: c_int = 16;
pub const GGML_FTYPE_MOSTLY_IQ3_XXS: c_int = 17;
pub const GGML_FTYPE_MOSTLY_IQ1_S: c_int = 18;
pub const GGML_FTYPE_MOSTLY_IQ4_NL: c_int = 19;
pub const GGML_FTYPE_MOSTLY_IQ3_S: c_int = 20;
pub const GGML_FTYPE_MOSTLY_IQ2_S: c_int = 21;
pub const GGML_FTYPE_MOSTLY_IQ4_XS: c_int = 22;
pub const GGML_FTYPE_MOSTLY_IQ1_M: c_int = 23;
pub const GGML_FTYPE_MOSTLY_BF16: c_int = 24;
pub const GGML_FTYPE_MOSTLY_MXFP4: c_int = 25;
pub const enum_ggml_ftype = c_int;
pub const GGML_OP_NONE: c_int = 0;
pub const GGML_OP_DUP: c_int = 1;
pub const GGML_OP_ADD: c_int = 2;
pub const GGML_OP_ADD_ID: c_int = 3;
pub const GGML_OP_ADD1: c_int = 4;
pub const GGML_OP_ACC: c_int = 5;
pub const GGML_OP_SUB: c_int = 6;
pub const GGML_OP_MUL: c_int = 7;
pub const GGML_OP_DIV: c_int = 8;
pub const GGML_OP_SQR: c_int = 9;
pub const GGML_OP_SQRT: c_int = 10;
pub const GGML_OP_LOG: c_int = 11;
pub const GGML_OP_SIN: c_int = 12;
pub const GGML_OP_COS: c_int = 13;
pub const GGML_OP_SUM: c_int = 14;
pub const GGML_OP_SUM_ROWS: c_int = 15;
pub const GGML_OP_MEAN: c_int = 16;
pub const GGML_OP_ARGMAX: c_int = 17;
pub const GGML_OP_COUNT_EQUAL: c_int = 18;
pub const GGML_OP_REPEAT: c_int = 19;
pub const GGML_OP_REPEAT_BACK: c_int = 20;
pub const GGML_OP_CONCAT: c_int = 21;
pub const GGML_OP_SILU_BACK: c_int = 22;
pub const GGML_OP_NORM: c_int = 23;
pub const GGML_OP_RMS_NORM: c_int = 24;
pub const GGML_OP_RMS_NORM_BACK: c_int = 25;
pub const GGML_OP_GROUP_NORM: c_int = 26;
pub const GGML_OP_L2_NORM: c_int = 27;
pub const GGML_OP_MUL_MAT: c_int = 28;
pub const GGML_OP_MUL_MAT_ID: c_int = 29;
pub const GGML_OP_OUT_PROD: c_int = 30;
pub const GGML_OP_SCALE: c_int = 31;
pub const GGML_OP_SET: c_int = 32;
pub const GGML_OP_CPY: c_int = 33;
pub const GGML_OP_CONT: c_int = 34;
pub const GGML_OP_RESHAPE: c_int = 35;
pub const GGML_OP_VIEW: c_int = 36;
pub const GGML_OP_PERMUTE: c_int = 37;
pub const GGML_OP_TRANSPOSE: c_int = 38;
pub const GGML_OP_GET_ROWS: c_int = 39;
pub const GGML_OP_GET_ROWS_BACK: c_int = 40;
pub const GGML_OP_SET_ROWS: c_int = 41;
pub const GGML_OP_DIAG: c_int = 42;
pub const GGML_OP_DIAG_MASK_INF: c_int = 43;
pub const GGML_OP_DIAG_MASK_ZERO: c_int = 44;
pub const GGML_OP_SOFT_MAX: c_int = 45;
pub const GGML_OP_SOFT_MAX_BACK: c_int = 46;
pub const GGML_OP_ROPE: c_int = 47;
pub const GGML_OP_ROPE_BACK: c_int = 48;
pub const GGML_OP_CLAMP: c_int = 49;
pub const GGML_OP_CONV_TRANSPOSE_1D: c_int = 50;
pub const GGML_OP_IM2COL: c_int = 51;
pub const GGML_OP_IM2COL_BACK: c_int = 52;
pub const GGML_OP_CONV_2D: c_int = 53;
pub const GGML_OP_CONV_2D_DW: c_int = 54;
pub const GGML_OP_CONV_TRANSPOSE_2D: c_int = 55;
pub const GGML_OP_POOL_1D: c_int = 56;
pub const GGML_OP_POOL_2D: c_int = 57;
pub const GGML_OP_POOL_2D_BACK: c_int = 58;
pub const GGML_OP_UPSCALE: c_int = 59;
pub const GGML_OP_PAD: c_int = 60;
pub const GGML_OP_PAD_REFLECT_1D: c_int = 61;
pub const GGML_OP_ROLL: c_int = 62;
pub const GGML_OP_ARANGE: c_int = 63;
pub const GGML_OP_TIMESTEP_EMBEDDING: c_int = 64;
pub const GGML_OP_ARGSORT: c_int = 65;
pub const GGML_OP_LEAKY_RELU: c_int = 66;
pub const GGML_OP_FLASH_ATTN_EXT: c_int = 67;
pub const GGML_OP_FLASH_ATTN_BACK: c_int = 68;
pub const GGML_OP_SSM_CONV: c_int = 69;
pub const GGML_OP_SSM_SCAN: c_int = 70;
pub const GGML_OP_WIN_PART: c_int = 71;
pub const GGML_OP_WIN_UNPART: c_int = 72;
pub const GGML_OP_GET_REL_POS: c_int = 73;
pub const GGML_OP_ADD_REL_POS: c_int = 74;
pub const GGML_OP_RWKV_WKV6: c_int = 75;
pub const GGML_OP_GATED_LINEAR_ATTN: c_int = 76;
pub const GGML_OP_RWKV_WKV7: c_int = 77;
pub const GGML_OP_UNARY: c_int = 78;
pub const GGML_OP_MAP_CUSTOM1: c_int = 79;
pub const GGML_OP_MAP_CUSTOM2: c_int = 80;
pub const GGML_OP_MAP_CUSTOM3: c_int = 81;
pub const GGML_OP_CUSTOM: c_int = 82;
pub const GGML_OP_CROSS_ENTROPY_LOSS: c_int = 83;
pub const GGML_OP_CROSS_ENTROPY_LOSS_BACK: c_int = 84;
pub const GGML_OP_OPT_STEP_ADAMW: c_int = 85;
pub const GGML_OP_OPT_STEP_SGD: c_int = 86;
pub const GGML_OP_GLU: c_int = 87;
pub const GGML_OP_COUNT: c_int = 88;
pub const enum_ggml_op = c_uint;
pub const GGML_UNARY_OP_ABS: c_int = 0;
pub const GGML_UNARY_OP_SGN: c_int = 1;
pub const GGML_UNARY_OP_NEG: c_int = 2;
pub const GGML_UNARY_OP_STEP: c_int = 3;
pub const GGML_UNARY_OP_TANH: c_int = 4;
pub const GGML_UNARY_OP_ELU: c_int = 5;
pub const GGML_UNARY_OP_RELU: c_int = 6;
pub const GGML_UNARY_OP_SIGMOID: c_int = 7;
pub const GGML_UNARY_OP_GELU: c_int = 8;
pub const GGML_UNARY_OP_GELU_QUICK: c_int = 9;
pub const GGML_UNARY_OP_SILU: c_int = 10;
pub const GGML_UNARY_OP_HARDSWISH: c_int = 11;
pub const GGML_UNARY_OP_HARDSIGMOID: c_int = 12;
pub const GGML_UNARY_OP_EXP: c_int = 13;
pub const GGML_UNARY_OP_GELU_ERF: c_int = 14;
pub const GGML_UNARY_OP_COUNT: c_int = 15;
pub const enum_ggml_unary_op = c_uint;
pub const GGML_GLU_OP_REGLU: c_int = 0;
pub const GGML_GLU_OP_GEGLU: c_int = 1;
pub const GGML_GLU_OP_SWIGLU: c_int = 2;
pub const GGML_GLU_OP_SWIGLU_OAI: c_int = 3;
pub const GGML_GLU_OP_GEGLU_ERF: c_int = 4;
pub const GGML_GLU_OP_GEGLU_QUICK: c_int = 5;
pub const GGML_GLU_OP_COUNT: c_int = 6;
pub const enum_ggml_glu_op = c_uint;
pub const GGML_OBJECT_TYPE_TENSOR: c_int = 0;
pub const GGML_OBJECT_TYPE_GRAPH: c_int = 1;
pub const GGML_OBJECT_TYPE_WORK_BUFFER: c_int = 2;
pub const enum_ggml_object_type = c_uint;
pub const GGML_LOG_LEVEL_NONE: c_int = 0;
pub const GGML_LOG_LEVEL_DEBUG: c_int = 1;
pub const GGML_LOG_LEVEL_INFO: c_int = 2;
pub const GGML_LOG_LEVEL_WARN: c_int = 3;
pub const GGML_LOG_LEVEL_ERROR: c_int = 4;
pub const GGML_LOG_LEVEL_CONT: c_int = 5;
pub const enum_ggml_log_level = c_uint;
pub const GGML_TENSOR_FLAG_INPUT: c_int = 1;
pub const GGML_TENSOR_FLAG_OUTPUT: c_int = 2;
pub const GGML_TENSOR_FLAG_PARAM: c_int = 4;
pub const GGML_TENSOR_FLAG_LOSS: c_int = 8;
pub const enum_ggml_tensor_flag = c_uint;
pub const struct_ggml_init_params = extern struct {
    mem_size: usize = @import("std").mem.zeroes(usize),
    mem_buffer: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    no_alloc: bool = @import("std").mem.zeroes(bool),
};
pub const struct_ggml_backend_buffer_3 = opaque {};
pub const struct_ggml_tensor = extern struct {
    type: enum_ggml_type = @import("std").mem.zeroes(enum_ggml_type),
    buffer: ?*struct_ggml_backend_buffer_3 = @import("std").mem.zeroes(?*struct_ggml_backend_buffer_3),
    ne: [4]i64 = @import("std").mem.zeroes([4]i64),
    nb: [4]usize = @import("std").mem.zeroes([4]usize),
    op: enum_ggml_op = @import("std").mem.zeroes(enum_ggml_op),
    op_params: [16]i32 = @import("std").mem.zeroes([16]i32),
    flags: i32 = @import("std").mem.zeroes(i32),
    src: [10][*c]struct_ggml_tensor = @import("std").mem.zeroes([10][*c]struct_ggml_tensor),
    view_src: [*c]struct_ggml_tensor = @import("std").mem.zeroes([*c]struct_ggml_tensor),
    view_offs: usize = @import("std").mem.zeroes(usize),
    data: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    name: [64]u8 = @import("std").mem.zeroes([64]u8),
    extra: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    padding: [8]u8 = @import("std").mem.zeroes([8]u8),
};
pub const GGML_TENSOR_SIZE: usize = @sizeOf(struct_ggml_tensor);
pub const ggml_abort_callback = ?*const fn (?*anyopaque) callconv(.c) bool;
pub const ggml_guid = [16]u8;
pub const ggml_guid_t = [*c]ggml_guid;
pub extern fn ggml_guid_matches(guid_a: ggml_guid_t, guid_b: ggml_guid_t) bool;
pub extern fn ggml_version() [*c]const u8;
pub extern fn ggml_commit() [*c]const u8;
pub extern fn ggml_time_init() void;
pub extern fn ggml_time_ms() i64;
pub extern fn ggml_time_us() i64;
pub extern fn ggml_cycles() i64;
pub extern fn ggml_cycles_per_ms() i64;
pub extern fn ggml_fopen(fname: [*c]const u8, mode: [*c]const u8) ?*FILE;
pub extern fn ggml_print_object(obj: ?*const struct_ggml_object) void;
pub extern fn ggml_print_objects(ctx: ?*const struct_ggml_context) void;
pub extern fn ggml_nelements(tensor: [*c]const struct_ggml_tensor) i64;
pub extern fn ggml_nrows(tensor: [*c]const struct_ggml_tensor) i64;
pub extern fn ggml_nbytes(tensor: [*c]const struct_ggml_tensor) usize;
pub extern fn ggml_nbytes_pad(tensor: [*c]const struct_ggml_tensor) usize;
pub extern fn ggml_blck_size(@"type": enum_ggml_type) i64;
pub extern fn ggml_type_size(@"type": enum_ggml_type) usize;
pub extern fn ggml_row_size(@"type": enum_ggml_type, ne: i64) usize;
pub extern fn ggml_type_sizef(@"type": enum_ggml_type) f64;
pub extern fn ggml_type_name(@"type": enum_ggml_type) [*c]const u8;
pub extern fn ggml_op_name(op: enum_ggml_op) [*c]const u8;
pub extern fn ggml_op_symbol(op: enum_ggml_op) [*c]const u8;
pub extern fn ggml_unary_op_name(op: enum_ggml_unary_op) [*c]const u8;
pub extern fn ggml_glu_op_name(op: enum_ggml_glu_op) [*c]const u8;
pub extern fn ggml_op_desc(t: [*c]const struct_ggml_tensor) [*c]const u8;
pub extern fn ggml_element_size(tensor: [*c]const struct_ggml_tensor) usize;
pub extern fn ggml_is_quantized(@"type": enum_ggml_type) bool;
pub extern fn ggml_ftype_to_ggml_type(ftype: enum_ggml_ftype) enum_ggml_type;
pub extern fn ggml_is_transposed(tensor: [*c]const struct_ggml_tensor) bool;
pub extern fn ggml_is_permuted(tensor: [*c]const struct_ggml_tensor) bool;
pub extern fn ggml_is_empty(tensor: [*c]const struct_ggml_tensor) bool;
pub extern fn ggml_is_scalar(tensor: [*c]const struct_ggml_tensor) bool;
pub extern fn ggml_is_vector(tensor: [*c]const struct_ggml_tensor) bool;
pub extern fn ggml_is_matrix(tensor: [*c]const struct_ggml_tensor) bool;
pub extern fn ggml_is_3d(tensor: [*c]const struct_ggml_tensor) bool;
pub extern fn ggml_n_dims(tensor: [*c]const struct_ggml_tensor) c_int;
pub extern fn ggml_is_contiguous(tensor: [*c]const struct_ggml_tensor) bool;
pub extern fn ggml_is_contiguous_0(tensor: [*c]const struct_ggml_tensor) bool;
pub extern fn ggml_is_contiguous_1(tensor: [*c]const struct_ggml_tensor) bool;
pub extern fn ggml_is_contiguous_2(tensor: [*c]const struct_ggml_tensor) bool;
pub extern fn ggml_is_contiguously_allocated(tensor: [*c]const struct_ggml_tensor) bool;
pub extern fn ggml_is_contiguous_channels(tensor: [*c]const struct_ggml_tensor) bool;
pub extern fn ggml_is_contiguous_rows(tensor: [*c]const struct_ggml_tensor) bool;
pub extern fn ggml_are_same_shape(t0: [*c]const struct_ggml_tensor, t1: [*c]const struct_ggml_tensor) bool;
pub extern fn ggml_are_same_stride(t0: [*c]const struct_ggml_tensor, t1: [*c]const struct_ggml_tensor) bool;
pub extern fn ggml_can_repeat(t0: [*c]const struct_ggml_tensor, t1: [*c]const struct_ggml_tensor) bool;
pub extern fn ggml_tensor_overhead() usize;
pub extern fn ggml_validate_row_data(@"type": enum_ggml_type, data: ?*const anyopaque, nbytes: usize) bool;
pub extern fn ggml_init(params: struct_ggml_init_params) ?*struct_ggml_context;
pub extern fn ggml_reset(ctx: ?*struct_ggml_context) void;
pub extern fn ggml_free(ctx: ?*struct_ggml_context) void;
pub extern fn ggml_used_mem(ctx: ?*const struct_ggml_context) usize;
pub extern fn ggml_get_no_alloc(ctx: ?*struct_ggml_context) bool;
pub extern fn ggml_set_no_alloc(ctx: ?*struct_ggml_context, no_alloc: bool) void;
pub extern fn ggml_get_mem_buffer(ctx: ?*const struct_ggml_context) ?*anyopaque;
pub extern fn ggml_get_mem_size(ctx: ?*const struct_ggml_context) usize;
pub extern fn ggml_get_max_tensor_size(ctx: ?*const struct_ggml_context) usize;
pub extern fn ggml_new_tensor(ctx: ?*struct_ggml_context, @"type": enum_ggml_type, n_dims: c_int, ne: [*c]const i64) [*c]struct_ggml_tensor;
pub extern fn ggml_new_tensor_1d(ctx: ?*struct_ggml_context, @"type": enum_ggml_type, ne0: i64) [*c]struct_ggml_tensor;
pub extern fn ggml_new_tensor_2d(ctx: ?*struct_ggml_context, @"type": enum_ggml_type, ne0: i64, ne1: i64) [*c]struct_ggml_tensor;
pub extern fn ggml_new_tensor_3d(ctx: ?*struct_ggml_context, @"type": enum_ggml_type, ne0: i64, ne1: i64, ne2: i64) [*c]struct_ggml_tensor;
pub extern fn ggml_new_tensor_4d(ctx: ?*struct_ggml_context, @"type": enum_ggml_type, ne0: i64, ne1: i64, ne2: i64, ne3: i64) [*c]struct_ggml_tensor;
pub extern fn ggml_new_buffer(ctx: ?*struct_ggml_context, nbytes: usize) ?*anyopaque;
pub extern fn ggml_dup_tensor(ctx: ?*struct_ggml_context, src: [*c]const struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_view_tensor(ctx: ?*struct_ggml_context, src: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_get_first_tensor(ctx: ?*const struct_ggml_context) [*c]struct_ggml_tensor;
pub extern fn ggml_get_next_tensor(ctx: ?*const struct_ggml_context, tensor: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_get_tensor(ctx: ?*struct_ggml_context, name: [*c]const u8) [*c]struct_ggml_tensor;
pub extern fn ggml_unravel_index(tensor: [*c]const struct_ggml_tensor, i: i64, @"i0": [*c]i64, @"i1": [*c]i64, @"i2": [*c]i64, @"i3": [*c]i64) void;
pub extern fn ggml_get_unary_op(tensor: [*c]const struct_ggml_tensor) enum_ggml_unary_op;
pub extern fn ggml_get_glu_op(tensor: [*c]const struct_ggml_tensor) enum_ggml_glu_op;
pub extern fn ggml_get_data(tensor: [*c]const struct_ggml_tensor) ?*anyopaque;
pub extern fn ggml_get_data_f32(tensor: [*c]const struct_ggml_tensor) [*c]f32;
pub extern fn ggml_get_name(tensor: [*c]const struct_ggml_tensor) [*c]const u8;
pub extern fn ggml_set_name(tensor: [*c]struct_ggml_tensor, name: [*c]const u8) [*c]struct_ggml_tensor;
pub extern fn ggml_format_name(tensor: [*c]struct_ggml_tensor, fmt: [*c]const u8, ...) [*c]struct_ggml_tensor;
pub extern fn ggml_set_input(tensor: [*c]struct_ggml_tensor) void;
pub extern fn ggml_set_output(tensor: [*c]struct_ggml_tensor) void;
pub extern fn ggml_set_param(tensor: [*c]struct_ggml_tensor) void;
pub extern fn ggml_set_loss(tensor: [*c]struct_ggml_tensor) void;
pub extern fn ggml_dup(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_dup_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_add(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_add_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_add_cast(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor, @"type": enum_ggml_type) [*c]struct_ggml_tensor;
pub extern fn ggml_add_id(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor, ids: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_add1(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_add1_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_acc(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor, nb1: usize, nb2: usize, nb3: usize, offset: usize) [*c]struct_ggml_tensor;
pub extern fn ggml_acc_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor, nb1: usize, nb2: usize, nb3: usize, offset: usize) [*c]struct_ggml_tensor;
pub extern fn ggml_sub(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_sub_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_mul(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_mul_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_div(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_div_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_sqr(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_sqr_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_sqrt(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_sqrt_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_log(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_log_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_sin(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_sin_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_cos(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_cos_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_sum(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_sum_rows(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_mean(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_argmax(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_count_equal(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_repeat(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_repeat_4d(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, ne0: i64, ne1: i64, ne2: i64, ne3: i64) [*c]struct_ggml_tensor;
pub extern fn ggml_repeat_back(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_concat(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor, dim: c_int) [*c]struct_ggml_tensor;
pub extern fn ggml_abs(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_abs_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_sgn(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_sgn_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_neg(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_neg_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_step(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_step_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_tanh(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_tanh_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_elu(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_elu_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_relu(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_leaky_relu(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, negative_slope: f32, inplace: bool) [*c]struct_ggml_tensor;
pub extern fn ggml_relu_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_sigmoid(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_sigmoid_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_gelu(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_gelu_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_gelu_erf(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_gelu_erf_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_gelu_quick(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_gelu_quick_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_silu(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_silu_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_silu_back(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_hardswish(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_hardsigmoid(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_exp(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_exp_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_glu(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, op: enum_ggml_glu_op, swapped: bool) [*c]struct_ggml_tensor;
pub extern fn ggml_reglu(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_reglu_swapped(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_geglu(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_geglu_swapped(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_swiglu(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_swiglu_swapped(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_geglu_erf(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_geglu_erf_swapped(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_geglu_quick(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_geglu_quick_swapped(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_glu_split(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor, op: enum_ggml_glu_op) [*c]struct_ggml_tensor;
pub extern fn ggml_reglu_split(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_geglu_split(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_swiglu_split(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_geglu_erf_split(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_geglu_quick_split(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_swiglu_oai(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor, alpha: f32, limit: f32) [*c]struct_ggml_tensor;
pub extern fn ggml_norm(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, eps: f32) [*c]struct_ggml_tensor;
pub extern fn ggml_norm_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, eps: f32) [*c]struct_ggml_tensor;
pub extern fn ggml_rms_norm(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, eps: f32) [*c]struct_ggml_tensor;
pub extern fn ggml_rms_norm_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, eps: f32) [*c]struct_ggml_tensor;
pub extern fn ggml_group_norm(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, n_groups: c_int, eps: f32) [*c]struct_ggml_tensor;
pub extern fn ggml_group_norm_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, n_groups: c_int, eps: f32) [*c]struct_ggml_tensor;
pub extern fn ggml_l2_norm(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, eps: f32) [*c]struct_ggml_tensor;
pub extern fn ggml_l2_norm_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, eps: f32) [*c]struct_ggml_tensor;
pub extern fn ggml_rms_norm_back(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor, eps: f32) [*c]struct_ggml_tensor;
pub extern fn ggml_mul_mat(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_mul_mat_set_prec(a: [*c]struct_ggml_tensor, prec: enum_ggml_prec) void;
pub extern fn ggml_mul_mat_id(ctx: ?*struct_ggml_context, as: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor, ids: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_out_prod(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_scale(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, s: f32) [*c]struct_ggml_tensor;
pub extern fn ggml_scale_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, s: f32) [*c]struct_ggml_tensor;
pub extern fn ggml_scale_bias(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, s: f32, b: f32) [*c]struct_ggml_tensor;
pub extern fn ggml_scale_bias_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, s: f32, b: f32) [*c]struct_ggml_tensor;
pub extern fn ggml_set(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor, nb1: usize, nb2: usize, nb3: usize, offset: usize) [*c]struct_ggml_tensor;
pub extern fn ggml_set_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor, nb1: usize, nb2: usize, nb3: usize, offset: usize) [*c]struct_ggml_tensor;
pub extern fn ggml_set_1d(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor, offset: usize) [*c]struct_ggml_tensor;
pub extern fn ggml_set_1d_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor, offset: usize) [*c]struct_ggml_tensor;
pub extern fn ggml_set_2d(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor, nb1: usize, offset: usize) [*c]struct_ggml_tensor;
pub extern fn ggml_set_2d_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor, nb1: usize, offset: usize) [*c]struct_ggml_tensor;
pub extern fn ggml_cpy(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_cast(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, @"type": enum_ggml_type) [*c]struct_ggml_tensor;
pub extern fn ggml_cont(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_cont_1d(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, ne0: i64) [*c]struct_ggml_tensor;
pub extern fn ggml_cont_2d(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, ne0: i64, ne1: i64) [*c]struct_ggml_tensor;
pub extern fn ggml_cont_3d(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, ne0: i64, ne1: i64, ne2: i64) [*c]struct_ggml_tensor;
pub extern fn ggml_cont_4d(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, ne0: i64, ne1: i64, ne2: i64, ne3: i64) [*c]struct_ggml_tensor;
pub extern fn ggml_reshape(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_reshape_1d(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, ne0: i64) [*c]struct_ggml_tensor;
pub extern fn ggml_reshape_2d(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, ne0: i64, ne1: i64) [*c]struct_ggml_tensor;
pub extern fn ggml_reshape_3d(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, ne0: i64, ne1: i64, ne2: i64) [*c]struct_ggml_tensor;
pub extern fn ggml_reshape_4d(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, ne0: i64, ne1: i64, ne2: i64, ne3: i64) [*c]struct_ggml_tensor;
pub extern fn ggml_view_1d(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, ne0: i64, offset: usize) [*c]struct_ggml_tensor;
pub extern fn ggml_view_2d(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, ne0: i64, ne1: i64, nb1: usize, offset: usize) [*c]struct_ggml_tensor;
pub extern fn ggml_view_3d(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, ne0: i64, ne1: i64, ne2: i64, nb1: usize, nb2: usize, offset: usize) [*c]struct_ggml_tensor;
pub extern fn ggml_view_4d(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, ne0: i64, ne1: i64, ne2: i64, ne3: i64, nb1: usize, nb2: usize, nb3: usize, offset: usize) [*c]struct_ggml_tensor;
pub extern fn ggml_permute(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, axis0: c_int, axis1: c_int, axis2: c_int, axis3: c_int) [*c]struct_ggml_tensor;
pub extern fn ggml_transpose(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_get_rows(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_get_rows_back(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor, c: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_set_rows(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor, c: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_diag(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_diag_mask_inf(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, n_past: c_int) [*c]struct_ggml_tensor;
pub extern fn ggml_diag_mask_inf_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, n_past: c_int) [*c]struct_ggml_tensor;
pub extern fn ggml_diag_mask_zero(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, n_past: c_int) [*c]struct_ggml_tensor;
pub extern fn ggml_diag_mask_zero_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, n_past: c_int) [*c]struct_ggml_tensor;
pub extern fn ggml_soft_max(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_soft_max_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_soft_max_ext(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, mask: [*c]struct_ggml_tensor, scale: f32, max_bias: f32) [*c]struct_ggml_tensor;
pub extern fn ggml_soft_max_add_sinks(a: [*c]struct_ggml_tensor, sinks: [*c]struct_ggml_tensor) void;
pub extern fn ggml_soft_max_ext_back(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor, scale: f32, max_bias: f32) [*c]struct_ggml_tensor;
pub extern fn ggml_soft_max_ext_back_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor, scale: f32, max_bias: f32) [*c]struct_ggml_tensor;
pub extern fn ggml_rope(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor, n_dims: c_int, mode: c_int) [*c]struct_ggml_tensor;
pub extern fn ggml_rope_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor, n_dims: c_int, mode: c_int) [*c]struct_ggml_tensor;
pub extern fn ggml_rope_ext(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor, c: [*c]struct_ggml_tensor, n_dims: c_int, mode: c_int, n_ctx_orig: c_int, freq_base: f32, freq_scale: f32, ext_factor: f32, attn_factor: f32, beta_fast: f32, beta_slow: f32) [*c]struct_ggml_tensor;
pub extern fn ggml_rope_multi(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor, c: [*c]struct_ggml_tensor, n_dims: c_int, sections: [*c]c_int, mode: c_int, n_ctx_orig: c_int, freq_base: f32, freq_scale: f32, ext_factor: f32, attn_factor: f32, beta_fast: f32, beta_slow: f32) [*c]struct_ggml_tensor;
pub extern fn ggml_rope_ext_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor, c: [*c]struct_ggml_tensor, n_dims: c_int, mode: c_int, n_ctx_orig: c_int, freq_base: f32, freq_scale: f32, ext_factor: f32, attn_factor: f32, beta_fast: f32, beta_slow: f32) [*c]struct_ggml_tensor;
pub extern fn ggml_rope_multi_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor, c: [*c]struct_ggml_tensor, n_dims: c_int, sections: [*c]c_int, mode: c_int, n_ctx_orig: c_int, freq_base: f32, freq_scale: f32, ext_factor: f32, attn_factor: f32, beta_fast: f32, beta_slow: f32) [*c]struct_ggml_tensor;
pub extern fn ggml_rope_custom(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor, n_dims: c_int, mode: c_int, n_ctx_orig: c_int, freq_base: f32, freq_scale: f32, ext_factor: f32, attn_factor: f32, beta_fast: f32, beta_slow: f32) [*c]struct_ggml_tensor;
pub extern fn ggml_rope_custom_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor, n_dims: c_int, mode: c_int, n_ctx_orig: c_int, freq_base: f32, freq_scale: f32, ext_factor: f32, attn_factor: f32, beta_fast: f32, beta_slow: f32) [*c]struct_ggml_tensor;
pub extern fn ggml_rope_yarn_corr_dims(n_dims: c_int, n_ctx_orig: c_int, freq_base: f32, beta_fast: f32, beta_slow: f32, dims: [*c]f32) void;
pub extern fn ggml_rope_ext_back(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor, c: [*c]struct_ggml_tensor, n_dims: c_int, mode: c_int, n_ctx_orig: c_int, freq_base: f32, freq_scale: f32, ext_factor: f32, attn_factor: f32, beta_fast: f32, beta_slow: f32) [*c]struct_ggml_tensor;
pub extern fn ggml_rope_multi_back(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor, c: [*c]struct_ggml_tensor, n_dims: c_int, sections: [*c]c_int, mode: c_int, n_ctx_orig: c_int, freq_base: f32, freq_scale: f32, ext_factor: f32, attn_factor: f32, beta_fast: f32, beta_slow: f32) [*c]struct_ggml_tensor;
pub extern fn ggml_clamp(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, min: f32, max: f32) [*c]struct_ggml_tensor;
pub extern fn ggml_im2col(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor, s0: c_int, s1: c_int, p0: c_int, p1: c_int, d0: c_int, d1: c_int, is_2D: bool, dst_type: enum_ggml_type) [*c]struct_ggml_tensor;
pub extern fn ggml_im2col_back(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor, ne: [*c]i64, s0: c_int, s1: c_int, p0: c_int, p1: c_int, d0: c_int, d1: c_int, is_2D: bool) [*c]struct_ggml_tensor;
pub extern fn ggml_conv_1d(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor, s0: c_int, p0: c_int, d0: c_int) [*c]struct_ggml_tensor;
pub extern fn ggml_conv_1d_ph(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor, s: c_int, d: c_int) [*c]struct_ggml_tensor;
pub extern fn ggml_conv_1d_dw(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor, s0: c_int, p0: c_int, d0: c_int) [*c]struct_ggml_tensor;
pub extern fn ggml_conv_1d_dw_ph(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor, s0: c_int, d0: c_int) [*c]struct_ggml_tensor;
pub extern fn ggml_conv_transpose_1d(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor, s0: c_int, p0: c_int, d0: c_int) [*c]struct_ggml_tensor;
pub extern fn ggml_conv_2d(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor, s0: c_int, s1: c_int, p0: c_int, p1: c_int, d0: c_int, d1: c_int) [*c]struct_ggml_tensor;
pub extern fn ggml_conv_2d_sk_p0(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_conv_2d_s1_ph(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_conv_2d_dw(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor, s0: c_int, s1: c_int, p0: c_int, p1: c_int, d0: c_int, d1: c_int) [*c]struct_ggml_tensor;
pub extern fn ggml_conv_2d_dw_direct(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor, stride0: c_int, stride1: c_int, pad0: c_int, pad1: c_int, dilation0: c_int, dilation1: c_int) [*c]struct_ggml_tensor;
pub extern fn ggml_conv_transpose_2d_p0(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor, stride: c_int) [*c]struct_ggml_tensor;
pub extern fn ggml_conv_2d_direct(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor, s0: c_int, s1: c_int, p0: c_int, p1: c_int, d0: c_int, d1: c_int) [*c]struct_ggml_tensor;
pub const GGML_OP_POOL_MAX: c_int = 0;
pub const GGML_OP_POOL_AVG: c_int = 1;
pub const GGML_OP_POOL_COUNT: c_int = 2;
pub const enum_ggml_op_pool = c_uint;
pub extern fn ggml_pool_1d(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, op: enum_ggml_op_pool, k0: c_int, s0: c_int, p0: c_int) [*c]struct_ggml_tensor;
pub extern fn ggml_pool_2d(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, op: enum_ggml_op_pool, k0: c_int, k1: c_int, s0: c_int, s1: c_int, p0: f32, p1: f32) [*c]struct_ggml_tensor;
pub extern fn ggml_pool_2d_back(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, af: [*c]struct_ggml_tensor, op: enum_ggml_op_pool, k0: c_int, k1: c_int, s0: c_int, s1: c_int, p0: f32, p1: f32) [*c]struct_ggml_tensor;
pub const GGML_SCALE_MODE_NEAREST: c_int = 0;
pub const GGML_SCALE_MODE_BILINEAR: c_int = 1;
pub const GGML_SCALE_MODE_COUNT: c_int = 2;
pub const enum_ggml_scale_mode = c_uint;
pub const GGML_SCALE_FLAG_ALIGN_CORNERS: c_int = 256;
pub const enum_ggml_scale_flag = c_uint;
pub extern fn ggml_upscale(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, scale_factor: c_int, mode: enum_ggml_scale_mode) [*c]struct_ggml_tensor;
pub extern fn ggml_upscale_ext(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, ne0: c_int, ne1: c_int, ne2: c_int, ne3: c_int, mode: enum_ggml_scale_mode) [*c]struct_ggml_tensor;
pub extern fn ggml_interpolate(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, ne0: i64, ne1: i64, ne2: i64, ne3: i64, mode: u32) [*c]struct_ggml_tensor;
pub extern fn ggml_pad(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, p0: c_int, p1: c_int, p2: c_int, p3: c_int) [*c]struct_ggml_tensor;
pub extern fn ggml_pad_reflect_1d(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, p0: c_int, p1: c_int) [*c]struct_ggml_tensor;
pub extern fn ggml_roll(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, shift0: c_int, shift1: c_int, shift2: c_int, shift3: c_int) [*c]struct_ggml_tensor;
pub extern fn ggml_timestep_embedding(ctx: ?*struct_ggml_context, timesteps: [*c]struct_ggml_tensor, dim: c_int, max_period: c_int) [*c]struct_ggml_tensor;
pub const GGML_SORT_ORDER_ASC: c_int = 0;
pub const GGML_SORT_ORDER_DESC: c_int = 1;
pub const enum_ggml_sort_order = c_uint;
pub extern fn ggml_argsort(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, order: enum_ggml_sort_order) [*c]struct_ggml_tensor;
pub extern fn ggml_arange(ctx: ?*struct_ggml_context, start: f32, stop: f32, step: f32) [*c]struct_ggml_tensor;
pub extern fn ggml_top_k(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, k: c_int) [*c]struct_ggml_tensor;
pub extern fn ggml_flash_attn_ext(ctx: ?*struct_ggml_context, q: [*c]struct_ggml_tensor, k: [*c]struct_ggml_tensor, v: [*c]struct_ggml_tensor, mask: [*c]struct_ggml_tensor, scale: f32, max_bias: f32, logit_softcap: f32) [*c]struct_ggml_tensor;
pub extern fn ggml_flash_attn_ext_set_prec(a: [*c]struct_ggml_tensor, prec: enum_ggml_prec) void;
pub extern fn ggml_flash_attn_ext_get_prec(a: [*c]const struct_ggml_tensor) enum_ggml_prec;
pub extern fn ggml_flash_attn_ext_add_sinks(a: [*c]struct_ggml_tensor, sinks: [*c]struct_ggml_tensor) void;
pub extern fn ggml_flash_attn_back(ctx: ?*struct_ggml_context, q: [*c]struct_ggml_tensor, k: [*c]struct_ggml_tensor, v: [*c]struct_ggml_tensor, d: [*c]struct_ggml_tensor, masked: bool) [*c]struct_ggml_tensor;
pub extern fn ggml_ssm_conv(ctx: ?*struct_ggml_context, sx: [*c]struct_ggml_tensor, c: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_ssm_scan(ctx: ?*struct_ggml_context, s: [*c]struct_ggml_tensor, x: [*c]struct_ggml_tensor, dt: [*c]struct_ggml_tensor, A: [*c]struct_ggml_tensor, B: [*c]struct_ggml_tensor, C: [*c]struct_ggml_tensor, ids: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_win_part(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, w: c_int) [*c]struct_ggml_tensor;
pub extern fn ggml_win_unpart(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, w0: c_int, h0: c_int, w: c_int) [*c]struct_ggml_tensor;
pub extern fn ggml_unary(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, op: enum_ggml_unary_op) [*c]struct_ggml_tensor;
pub extern fn ggml_unary_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, op: enum_ggml_unary_op) [*c]struct_ggml_tensor;
pub extern fn ggml_get_rel_pos(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, qh: c_int, kh: c_int) [*c]struct_ggml_tensor;
pub extern fn ggml_add_rel_pos(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, pw: [*c]struct_ggml_tensor, ph: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_add_rel_pos_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, pw: [*c]struct_ggml_tensor, ph: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_rwkv_wkv6(ctx: ?*struct_ggml_context, k: [*c]struct_ggml_tensor, v: [*c]struct_ggml_tensor, r: [*c]struct_ggml_tensor, tf: [*c]struct_ggml_tensor, td: [*c]struct_ggml_tensor, state: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_gated_linear_attn(ctx: ?*struct_ggml_context, k: [*c]struct_ggml_tensor, v: [*c]struct_ggml_tensor, q: [*c]struct_ggml_tensor, g: [*c]struct_ggml_tensor, state: [*c]struct_ggml_tensor, scale: f32) [*c]struct_ggml_tensor;
pub extern fn ggml_rwkv_wkv7(ctx: ?*struct_ggml_context, r: [*c]struct_ggml_tensor, w: [*c]struct_ggml_tensor, k: [*c]struct_ggml_tensor, v: [*c]struct_ggml_tensor, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor, state: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub const ggml_custom1_op_t = ?*const fn ([*c]struct_ggml_tensor, [*c]const struct_ggml_tensor, c_int, c_int, ?*anyopaque) callconv(.c) void;
pub const ggml_custom2_op_t = ?*const fn ([*c]struct_ggml_tensor, [*c]const struct_ggml_tensor, [*c]const struct_ggml_tensor, c_int, c_int, ?*anyopaque) callconv(.c) void;
pub const ggml_custom3_op_t = ?*const fn ([*c]struct_ggml_tensor, [*c]const struct_ggml_tensor, [*c]const struct_ggml_tensor, [*c]const struct_ggml_tensor, c_int, c_int, ?*anyopaque) callconv(.c) void;
pub extern fn ggml_map_custom1(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, fun: ggml_custom1_op_t, n_tasks: c_int, userdata: ?*anyopaque) [*c]struct_ggml_tensor;
pub extern fn ggml_map_custom1_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, fun: ggml_custom1_op_t, n_tasks: c_int, userdata: ?*anyopaque) [*c]struct_ggml_tensor;
pub extern fn ggml_map_custom2(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor, fun: ggml_custom2_op_t, n_tasks: c_int, userdata: ?*anyopaque) [*c]struct_ggml_tensor;
pub extern fn ggml_map_custom2_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor, fun: ggml_custom2_op_t, n_tasks: c_int, userdata: ?*anyopaque) [*c]struct_ggml_tensor;
pub extern fn ggml_map_custom3(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor, c: [*c]struct_ggml_tensor, fun: ggml_custom3_op_t, n_tasks: c_int, userdata: ?*anyopaque) [*c]struct_ggml_tensor;
pub extern fn ggml_map_custom3_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor, c: [*c]struct_ggml_tensor, fun: ggml_custom3_op_t, n_tasks: c_int, userdata: ?*anyopaque) [*c]struct_ggml_tensor;
pub const ggml_custom_op_t = ?*const fn ([*c]struct_ggml_tensor, c_int, c_int, ?*anyopaque) callconv(.c) void;
pub extern fn ggml_custom_4d(ctx: ?*struct_ggml_context, @"type": enum_ggml_type, ne0: i64, ne1: i64, ne2: i64, ne3: i64, args: [*c][*c]struct_ggml_tensor, n_args: c_int, fun: ggml_custom_op_t, n_tasks: c_int, userdata: ?*anyopaque) [*c]struct_ggml_tensor;
pub extern fn ggml_custom_inplace(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, args: [*c][*c]struct_ggml_tensor, n_args: c_int, fun: ggml_custom_op_t, n_tasks: c_int, userdata: ?*anyopaque) [*c]struct_ggml_tensor;
pub extern fn ggml_cross_entropy_loss(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_cross_entropy_loss_back(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, b: [*c]struct_ggml_tensor, c: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_opt_step_adamw(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, grad: [*c]struct_ggml_tensor, m: [*c]struct_ggml_tensor, v: [*c]struct_ggml_tensor, adamw_params: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_opt_step_sgd(ctx: ?*struct_ggml_context, a: [*c]struct_ggml_tensor, grad: [*c]struct_ggml_tensor, sgd_params: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_build_forward_expand(cgraph: ?*struct_ggml_cgraph, tensor: [*c]struct_ggml_tensor) void;
pub extern fn ggml_build_backward_expand(ctx: ?*struct_ggml_context, cgraph: ?*struct_ggml_cgraph, grad_accs: [*c][*c]struct_ggml_tensor) void;
pub extern fn ggml_new_graph(ctx: ?*struct_ggml_context) ?*struct_ggml_cgraph;
pub extern fn ggml_new_graph_custom(ctx: ?*struct_ggml_context, size: usize, grads: bool) ?*struct_ggml_cgraph;
pub extern fn ggml_graph_dup(ctx: ?*struct_ggml_context, cgraph: ?*struct_ggml_cgraph, force_grads: bool) ?*struct_ggml_cgraph;
pub extern fn ggml_graph_cpy(src: ?*struct_ggml_cgraph, dst: ?*struct_ggml_cgraph) void;
pub extern fn ggml_graph_reset(cgraph: ?*struct_ggml_cgraph) void;
pub extern fn ggml_graph_clear(cgraph: ?*struct_ggml_cgraph) void;
pub extern fn ggml_graph_size(cgraph: ?*struct_ggml_cgraph) c_int;
pub extern fn ggml_graph_node(cgraph: ?*struct_ggml_cgraph, i: c_int) [*c]struct_ggml_tensor;
pub extern fn ggml_graph_nodes(cgraph: ?*struct_ggml_cgraph) [*c][*c]struct_ggml_tensor;
pub extern fn ggml_graph_n_nodes(cgraph: ?*struct_ggml_cgraph) c_int;
pub extern fn ggml_graph_add_node(cgraph: ?*struct_ggml_cgraph, tensor: [*c]struct_ggml_tensor) void;
pub extern fn ggml_graph_overhead() usize;
pub extern fn ggml_graph_overhead_custom(size: usize, grads: bool) usize;
pub extern fn ggml_graph_get_tensor(cgraph: ?*const struct_ggml_cgraph, name: [*c]const u8) [*c]struct_ggml_tensor;
pub extern fn ggml_graph_get_grad(cgraph: ?*const struct_ggml_cgraph, node: [*c]const struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_graph_get_grad_acc(cgraph: ?*const struct_ggml_cgraph, node: [*c]const struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_graph_print(cgraph: ?*const struct_ggml_cgraph) void;
pub extern fn ggml_graph_dump_dot(gb: ?*const struct_ggml_cgraph, gf: ?*const struct_ggml_cgraph, filename: [*c]const u8) void;
pub const ggml_log_callback = ?*const fn (enum_ggml_log_level, [*c]const u8, ?*anyopaque) callconv(.c) void;
pub extern fn ggml_log_set(log_callback: ggml_log_callback, user_data: ?*anyopaque) void;
pub extern fn ggml_set_zero(tensor: [*c]struct_ggml_tensor) [*c]struct_ggml_tensor;
pub extern fn ggml_quantize_init(@"type": enum_ggml_type) void;
pub extern fn ggml_quantize_free() void;
pub extern fn ggml_quantize_requires_imatrix(@"type": enum_ggml_type) bool;
pub extern fn ggml_quantize_chunk(@"type": enum_ggml_type, src: [*c]const f32, dst: ?*anyopaque, start: i64, nrows: i64, n_per_row: i64, imatrix: [*c]const f32) usize;
pub const ggml_to_float_t = ?*const fn (noalias ?*const anyopaque, noalias [*c]f32, i64) callconv(.c) void;
pub const ggml_from_float_t = ?*const fn (noalias [*c]const f32, noalias ?*anyopaque, i64) callconv(.c) void;
pub const struct_ggml_type_traits = extern struct {
    type_name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    blck_size: i64 = @import("std").mem.zeroes(i64),
    blck_size_interleave: i64 = @import("std").mem.zeroes(i64),
    type_size: usize = @import("std").mem.zeroes(usize),
    is_quantized: bool = @import("std").mem.zeroes(bool),
    to_float: ggml_to_float_t = @import("std").mem.zeroes(ggml_to_float_t),
    from_float_ref: ggml_from_float_t = @import("std").mem.zeroes(ggml_from_float_t),
};
pub extern fn ggml_get_type_traits(@"type": enum_ggml_type) [*c]const struct_ggml_type_traits;
pub const GGML_SCHED_PRIO_LOW: c_int = -1;
pub const GGML_SCHED_PRIO_NORMAL: c_int = 0;
pub const GGML_SCHED_PRIO_MEDIUM: c_int = 1;
pub const GGML_SCHED_PRIO_HIGH: c_int = 2;
pub const GGML_SCHED_PRIO_REALTIME: c_int = 3;
pub const enum_ggml_sched_priority = c_int;
pub const struct_ggml_threadpool_params = extern struct {
    cpumask: [512]bool = @import("std").mem.zeroes([512]bool),
    n_threads: c_int = @import("std").mem.zeroes(c_int),
    prio: enum_ggml_sched_priority = @import("std").mem.zeroes(enum_ggml_sched_priority),
    poll: u32 = @import("std").mem.zeroes(u32),
    strict_cpu: bool = @import("std").mem.zeroes(bool),
    paused: bool = @import("std").mem.zeroes(bool),
};
pub const struct_ggml_threadpool = opaque {};
pub const ggml_threadpool_t = ?*struct_ggml_threadpool;
pub extern fn ggml_threadpool_params_default(n_threads: c_int) struct_ggml_threadpool_params;
pub extern fn ggml_threadpool_params_init(p: [*c]struct_ggml_threadpool_params, n_threads: c_int) void;
pub extern fn ggml_threadpool_params_match(p0: [*c]const struct_ggml_threadpool_params, p1: [*c]const struct_ggml_threadpool_params) bool;
pub const struct_ggml_backend_buffer_type = opaque {};
pub const ggml_backend_buffer_type_t = ?*struct_ggml_backend_buffer_type;
pub const ggml_backend_buffer_t = ?*struct_ggml_backend_buffer_3;
pub const struct_ggml_backend = opaque {};
pub const ggml_backend_t = ?*struct_ggml_backend;
pub const struct_ggml_tallocr = extern struct {
    buffer: ggml_backend_buffer_t = @import("std").mem.zeroes(ggml_backend_buffer_t),
    base: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    alignment: usize = @import("std").mem.zeroes(usize),
    offset: usize = @import("std").mem.zeroes(usize),
};
pub extern fn ggml_tallocr_new(buffer: ggml_backend_buffer_t) struct_ggml_tallocr;
pub extern fn ggml_tallocr_alloc(talloc: [*c]struct_ggml_tallocr, tensor: [*c]struct_ggml_tensor) enum_ggml_status;
pub const struct_ggml_gallocr = opaque {};
pub const ggml_gallocr_t = ?*struct_ggml_gallocr;
pub extern fn ggml_gallocr_new(buft: ggml_backend_buffer_type_t) ggml_gallocr_t;
pub extern fn ggml_gallocr_new_n(bufts: [*c]ggml_backend_buffer_type_t, n_bufs: c_int) ggml_gallocr_t;
pub extern fn ggml_gallocr_free(galloc: ggml_gallocr_t) void;
pub extern fn ggml_gallocr_reserve(galloc: ggml_gallocr_t, graph: ?*struct_ggml_cgraph) bool;
pub extern fn ggml_gallocr_reserve_n(galloc: ggml_gallocr_t, graph: ?*struct_ggml_cgraph, node_buffer_ids: [*c]const c_int, leaf_buffer_ids: [*c]const c_int) bool;
pub extern fn ggml_gallocr_alloc_graph(galloc: ggml_gallocr_t, graph: ?*struct_ggml_cgraph) bool;
pub extern fn ggml_gallocr_get_buffer_size(galloc: ggml_gallocr_t, buffer_id: c_int) usize;
pub extern fn ggml_backend_alloc_ctx_tensors_from_buft(ctx: ?*struct_ggml_context, buft: ggml_backend_buffer_type_t) ?*struct_ggml_backend_buffer_3;
pub extern fn ggml_backend_alloc_ctx_tensors(ctx: ?*struct_ggml_context, backend: ggml_backend_t) ?*struct_ggml_backend_buffer_3;
pub const struct_ggml_backend_event = opaque {};
pub const ggml_backend_event_t = ?*struct_ggml_backend_event;
pub const ggml_backend_graph_plan_t = ?*anyopaque;
pub const struct_ggml_backend_reg = opaque {};
pub const ggml_backend_reg_t = ?*struct_ggml_backend_reg;
pub const struct_ggml_backend_device = opaque {};
pub const ggml_backend_dev_t = ?*struct_ggml_backend_device;
pub extern fn ggml_backend_buft_name(buft: ggml_backend_buffer_type_t) [*c]const u8;
pub extern fn ggml_backend_buft_alloc_buffer(buft: ggml_backend_buffer_type_t, size: usize) ggml_backend_buffer_t;
pub extern fn ggml_backend_buft_get_alignment(buft: ggml_backend_buffer_type_t) usize;
pub extern fn ggml_backend_buft_get_max_size(buft: ggml_backend_buffer_type_t) usize;
pub extern fn ggml_backend_buft_get_alloc_size(buft: ggml_backend_buffer_type_t, tensor: [*c]const struct_ggml_tensor) usize;
pub extern fn ggml_backend_buft_is_host(buft: ggml_backend_buffer_type_t) bool;
pub extern fn ggml_backend_buft_get_device(buft: ggml_backend_buffer_type_t) ggml_backend_dev_t;
pub const GGML_BACKEND_BUFFER_USAGE_ANY: c_int = 0;
pub const GGML_BACKEND_BUFFER_USAGE_WEIGHTS: c_int = 1;
pub const GGML_BACKEND_BUFFER_USAGE_COMPUTE: c_int = 2;
pub const enum_ggml_backend_buffer_usage = c_uint;
pub extern fn ggml_backend_buffer_name(buffer: ggml_backend_buffer_t) [*c]const u8;
pub extern fn ggml_backend_buffer_free(buffer: ggml_backend_buffer_t) void;
pub extern fn ggml_backend_buffer_get_base(buffer: ggml_backend_buffer_t) ?*anyopaque;
pub extern fn ggml_backend_buffer_get_size(buffer: ggml_backend_buffer_t) usize;
pub extern fn ggml_backend_buffer_init_tensor(buffer: ggml_backend_buffer_t, tensor: [*c]struct_ggml_tensor) enum_ggml_status;
pub extern fn ggml_backend_buffer_get_alignment(buffer: ggml_backend_buffer_t) usize;
pub extern fn ggml_backend_buffer_get_max_size(buffer: ggml_backend_buffer_t) usize;
pub extern fn ggml_backend_buffer_get_alloc_size(buffer: ggml_backend_buffer_t, tensor: [*c]const struct_ggml_tensor) usize;
pub extern fn ggml_backend_buffer_clear(buffer: ggml_backend_buffer_t, value: u8) void;
pub extern fn ggml_backend_buffer_is_host(buffer: ggml_backend_buffer_t) bool;
pub extern fn ggml_backend_buffer_set_usage(buffer: ggml_backend_buffer_t, usage: enum_ggml_backend_buffer_usage) void;
pub extern fn ggml_backend_buffer_get_usage(buffer: ggml_backend_buffer_t) enum_ggml_backend_buffer_usage;
pub extern fn ggml_backend_buffer_get_type(buffer: ggml_backend_buffer_t) ggml_backend_buffer_type_t;
pub extern fn ggml_backend_buffer_reset(buffer: ggml_backend_buffer_t) void;
pub extern fn ggml_backend_tensor_copy(src: [*c]struct_ggml_tensor, dst: [*c]struct_ggml_tensor) void;
pub extern fn ggml_backend_guid(backend: ggml_backend_t) ggml_guid_t;
pub extern fn ggml_backend_name(backend: ggml_backend_t) [*c]const u8;
pub extern fn ggml_backend_free(backend: ggml_backend_t) void;
pub extern fn ggml_backend_get_default_buffer_type(backend: ggml_backend_t) ggml_backend_buffer_type_t;
pub extern fn ggml_backend_alloc_buffer(backend: ggml_backend_t, size: usize) ggml_backend_buffer_t;
pub extern fn ggml_backend_get_alignment(backend: ggml_backend_t) usize;
pub extern fn ggml_backend_get_max_size(backend: ggml_backend_t) usize;
pub extern fn ggml_backend_tensor_set_async(backend: ggml_backend_t, tensor: [*c]struct_ggml_tensor, data: ?*const anyopaque, offset: usize, size: usize) void;
pub extern fn ggml_backend_tensor_get_async(backend: ggml_backend_t, tensor: [*c]const struct_ggml_tensor, data: ?*anyopaque, offset: usize, size: usize) void;
pub extern fn ggml_backend_tensor_set(tensor: [*c]struct_ggml_tensor, data: ?*const anyopaque, offset: usize, size: usize) void;
pub extern fn ggml_backend_tensor_get(tensor: [*c]const struct_ggml_tensor, data: ?*anyopaque, offset: usize, size: usize) void;
pub extern fn ggml_backend_tensor_memset(tensor: [*c]struct_ggml_tensor, value: u8, offset: usize, size: usize) void;
pub extern fn ggml_backend_synchronize(backend: ggml_backend_t) void;
pub extern fn ggml_backend_graph_plan_create(backend: ggml_backend_t, cgraph: ?*struct_ggml_cgraph) ggml_backend_graph_plan_t;
pub extern fn ggml_backend_graph_plan_free(backend: ggml_backend_t, plan: ggml_backend_graph_plan_t) void;
pub extern fn ggml_backend_graph_plan_compute(backend: ggml_backend_t, plan: ggml_backend_graph_plan_t) enum_ggml_status;
pub extern fn ggml_backend_graph_compute(backend: ggml_backend_t, cgraph: ?*struct_ggml_cgraph) enum_ggml_status;
pub extern fn ggml_backend_graph_compute_async(backend: ggml_backend_t, cgraph: ?*struct_ggml_cgraph) enum_ggml_status;
pub extern fn ggml_backend_supports_op(backend: ggml_backend_t, op: [*c]const struct_ggml_tensor) bool;
pub extern fn ggml_backend_supports_buft(backend: ggml_backend_t, buft: ggml_backend_buffer_type_t) bool;
pub extern fn ggml_backend_offload_op(backend: ggml_backend_t, op: [*c]const struct_ggml_tensor) bool;
pub extern fn ggml_backend_tensor_copy_async(backend_src: ggml_backend_t, backend_dst: ggml_backend_t, src: [*c]struct_ggml_tensor, dst: [*c]struct_ggml_tensor) void;
pub extern fn ggml_backend_get_device(backend: ggml_backend_t) ggml_backend_dev_t;
pub extern fn ggml_backend_event_new(device: ggml_backend_dev_t) ggml_backend_event_t;
pub extern fn ggml_backend_event_free(event: ggml_backend_event_t) void;
pub extern fn ggml_backend_event_record(event: ggml_backend_event_t, backend: ggml_backend_t) void;
pub extern fn ggml_backend_event_synchronize(event: ggml_backend_event_t) void;
pub extern fn ggml_backend_event_wait(backend: ggml_backend_t, event: ggml_backend_event_t) void;
pub const GGML_BACKEND_DEVICE_TYPE_CPU: c_int = 0;
pub const GGML_BACKEND_DEVICE_TYPE_GPU: c_int = 1;
pub const GGML_BACKEND_DEVICE_TYPE_ACCEL: c_int = 2;
pub const enum_ggml_backend_dev_type = c_uint;
pub const struct_ggml_backend_dev_caps = extern struct {
    @"async": bool = @import("std").mem.zeroes(bool),
    host_buffer: bool = @import("std").mem.zeroes(bool),
    buffer_from_host_ptr: bool = @import("std").mem.zeroes(bool),
    events: bool = @import("std").mem.zeroes(bool),
};
pub const struct_ggml_backend_dev_props = extern struct {
    name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    description: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    memory_free: usize = @import("std").mem.zeroes(usize),
    memory_total: usize = @import("std").mem.zeroes(usize),
    type: enum_ggml_backend_dev_type = @import("std").mem.zeroes(enum_ggml_backend_dev_type),
    caps: struct_ggml_backend_dev_caps = @import("std").mem.zeroes(struct_ggml_backend_dev_caps),
};
pub extern fn ggml_backend_dev_name(device: ggml_backend_dev_t) [*c]const u8;
pub extern fn ggml_backend_dev_description(device: ggml_backend_dev_t) [*c]const u8;
pub extern fn ggml_backend_dev_memory(device: ggml_backend_dev_t, free: [*c]usize, total: [*c]usize) void;
pub extern fn ggml_backend_dev_type(device: ggml_backend_dev_t) enum_ggml_backend_dev_type;
pub extern fn ggml_backend_dev_get_props(device: ggml_backend_dev_t, props: [*c]struct_ggml_backend_dev_props) void;
pub extern fn ggml_backend_dev_backend_reg(device: ggml_backend_dev_t) ggml_backend_reg_t;
pub extern fn ggml_backend_dev_init(device: ggml_backend_dev_t, params: [*c]const u8) ggml_backend_t;
pub extern fn ggml_backend_dev_buffer_type(device: ggml_backend_dev_t) ggml_backend_buffer_type_t;
pub extern fn ggml_backend_dev_host_buffer_type(device: ggml_backend_dev_t) ggml_backend_buffer_type_t;
pub extern fn ggml_backend_dev_buffer_from_host_ptr(device: ggml_backend_dev_t, ptr: ?*anyopaque, size: usize, max_tensor_size: usize) ggml_backend_buffer_t;
pub extern fn ggml_backend_dev_supports_op(device: ggml_backend_dev_t, op: [*c]const struct_ggml_tensor) bool;
pub extern fn ggml_backend_dev_supports_buft(device: ggml_backend_dev_t, buft: ggml_backend_buffer_type_t) bool;
pub extern fn ggml_backend_dev_offload_op(device: ggml_backend_dev_t, op: [*c]const struct_ggml_tensor) bool;
pub extern fn ggml_backend_reg_name(reg: ggml_backend_reg_t) [*c]const u8;
pub extern fn ggml_backend_reg_dev_count(reg: ggml_backend_reg_t) usize;
pub extern fn ggml_backend_reg_dev_get(reg: ggml_backend_reg_t, index: usize) ggml_backend_dev_t;
pub extern fn ggml_backend_reg_get_proc_address(reg: ggml_backend_reg_t, name: [*c]const u8) ?*anyopaque;
pub const ggml_backend_split_buffer_type_t = ?*const fn (c_int, [*c]const f32) callconv(.c) ggml_backend_buffer_type_t;
pub const ggml_backend_set_n_threads_t = ?*const fn (ggml_backend_t, c_int) callconv(.c) void;
pub const ggml_backend_dev_get_extra_bufts_t = ?*const fn (ggml_backend_dev_t) callconv(.c) [*c]ggml_backend_buffer_type_t;
pub const ggml_backend_set_abort_callback_t = ?*const fn (ggml_backend_t, ggml_abort_callback, ?*anyopaque) callconv(.c) void;
pub const struct_ggml_backend_feature = extern struct {
    name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    value: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
};
pub const ggml_backend_get_features_t = ?*const fn (ggml_backend_reg_t) callconv(.c) [*c]struct_ggml_backend_feature;
pub extern fn ggml_backend_device_register(device: ggml_backend_dev_t) void;
pub extern fn ggml_backend_reg_count() usize;
pub extern fn ggml_backend_reg_get(index: usize) ggml_backend_reg_t;
pub extern fn ggml_backend_reg_by_name(name: [*c]const u8) ggml_backend_reg_t;
pub extern fn ggml_backend_dev_count() usize;
pub extern fn ggml_backend_dev_get(index: usize) ggml_backend_dev_t;
pub extern fn ggml_backend_dev_by_name(name: [*c]const u8) ggml_backend_dev_t;
pub extern fn ggml_backend_dev_by_type(@"type": enum_ggml_backend_dev_type) ggml_backend_dev_t;
pub extern fn ggml_backend_init_by_name(name: [*c]const u8, params: [*c]const u8) ggml_backend_t;
pub extern fn ggml_backend_init_by_type(@"type": enum_ggml_backend_dev_type, params: [*c]const u8) ggml_backend_t;
pub extern fn ggml_backend_init_best() ggml_backend_t;
pub extern fn ggml_backend_load(path: [*c]const u8) ggml_backend_reg_t;
pub extern fn ggml_backend_unload(reg: ggml_backend_reg_t) void;
pub extern fn ggml_backend_load_all() void;
pub extern fn ggml_backend_load_all_from_path(dir_path: [*c]const u8) void;
pub const struct_ggml_backend_sched = opaque {};
pub const ggml_backend_sched_t = ?*struct_ggml_backend_sched;
pub const ggml_backend_sched_eval_callback = ?*const fn ([*c]struct_ggml_tensor, bool, ?*anyopaque) callconv(.c) bool;
pub extern fn ggml_backend_sched_new(backends: [*c]ggml_backend_t, bufts: [*c]ggml_backend_buffer_type_t, n_backends: c_int, graph_size: usize, parallel: bool, op_offload: bool) ggml_backend_sched_t;
pub extern fn ggml_backend_sched_free(sched: ggml_backend_sched_t) void;
pub extern fn ggml_backend_sched_reserve(sched: ggml_backend_sched_t, measure_graph: ?*struct_ggml_cgraph) bool;
pub extern fn ggml_backend_sched_get_n_backends(sched: ggml_backend_sched_t) c_int;
pub extern fn ggml_backend_sched_get_backend(sched: ggml_backend_sched_t, i: c_int) ggml_backend_t;
pub extern fn ggml_backend_sched_get_n_splits(sched: ggml_backend_sched_t) c_int;
pub extern fn ggml_backend_sched_get_n_copies(sched: ggml_backend_sched_t) c_int;
pub extern fn ggml_backend_sched_get_buffer_size(sched: ggml_backend_sched_t, backend: ggml_backend_t) usize;
pub extern fn ggml_backend_sched_set_tensor_backend(sched: ggml_backend_sched_t, node: [*c]struct_ggml_tensor, backend: ggml_backend_t) void;
pub extern fn ggml_backend_sched_get_tensor_backend(sched: ggml_backend_sched_t, node: [*c]struct_ggml_tensor) ggml_backend_t;
pub extern fn ggml_backend_sched_alloc_graph(sched: ggml_backend_sched_t, graph: ?*struct_ggml_cgraph) bool;
pub extern fn ggml_backend_sched_graph_compute(sched: ggml_backend_sched_t, graph: ?*struct_ggml_cgraph) enum_ggml_status;
pub extern fn ggml_backend_sched_graph_compute_async(sched: ggml_backend_sched_t, graph: ?*struct_ggml_cgraph) enum_ggml_status;
pub extern fn ggml_backend_sched_synchronize(sched: ggml_backend_sched_t) void;
pub extern fn ggml_backend_sched_reset(sched: ggml_backend_sched_t) void;
pub extern fn ggml_backend_sched_set_eval_callback(sched: ggml_backend_sched_t, callback: ggml_backend_sched_eval_callback, user_data: ?*anyopaque) void;
pub const struct_ggml_backend_graph_copy = extern struct {
    buffer: ggml_backend_buffer_t = @import("std").mem.zeroes(ggml_backend_buffer_t),
    ctx_allocated: ?*struct_ggml_context = @import("std").mem.zeroes(?*struct_ggml_context),
    ctx_unallocated: ?*struct_ggml_context = @import("std").mem.zeroes(?*struct_ggml_context),
    graph: ?*struct_ggml_cgraph = @import("std").mem.zeroes(?*struct_ggml_cgraph),
};
pub extern fn ggml_backend_graph_copy(backend: ggml_backend_t, graph: ?*struct_ggml_cgraph) struct_ggml_backend_graph_copy;
pub extern fn ggml_backend_graph_copy_free(copy: struct_ggml_backend_graph_copy) void;
pub const ggml_backend_eval_callback = ?*const fn (c_int, [*c]struct_ggml_tensor, [*c]struct_ggml_tensor, ?*anyopaque) callconv(.c) bool;
pub extern fn ggml_backend_compare_graph_backend(backend1: ggml_backend_t, backend2: ggml_backend_t, graph: ?*struct_ggml_cgraph, callback: ggml_backend_eval_callback, user_data: ?*anyopaque, test_node: [*c]struct_ggml_tensor) bool;
pub extern fn ggml_backend_tensor_alloc(buffer: ggml_backend_buffer_t, tensor: [*c]struct_ggml_tensor, addr: ?*anyopaque) enum_ggml_status;
pub extern fn ggml_backend_view_init(tensor: [*c]struct_ggml_tensor) enum_ggml_status;
pub extern fn ggml_backend_cpu_buffer_from_ptr(ptr: ?*anyopaque, size: usize) ggml_backend_buffer_t;
pub extern fn ggml_backend_cpu_buffer_type() ggml_backend_buffer_type_t;
pub const struct_ggml_cplan = extern struct {
    work_size: usize = @import("std").mem.zeroes(usize),
    work_data: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    n_threads: c_int = @import("std").mem.zeroes(c_int),
    threadpool: ?*struct_ggml_threadpool = @import("std").mem.zeroes(?*struct_ggml_threadpool),
    abort_callback: ggml_abort_callback = @import("std").mem.zeroes(ggml_abort_callback),
    abort_callback_data: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const GGML_NUMA_STRATEGY_DISABLED: c_int = 0;
pub const GGML_NUMA_STRATEGY_DISTRIBUTE: c_int = 1;
pub const GGML_NUMA_STRATEGY_ISOLATE: c_int = 2;
pub const GGML_NUMA_STRATEGY_NUMACTL: c_int = 3;
pub const GGML_NUMA_STRATEGY_MIRROR: c_int = 4;
pub const GGML_NUMA_STRATEGY_COUNT: c_int = 5;
pub const enum_ggml_numa_strategy = c_uint;
pub extern fn ggml_numa_init(numa: enum_ggml_numa_strategy) void;
pub extern fn ggml_is_numa() bool;
pub extern fn ggml_new_i32(ctx: ?*struct_ggml_context, value: i32) [*c]struct_ggml_tensor;
pub extern fn ggml_new_f32(ctx: ?*struct_ggml_context, value: f32) [*c]struct_ggml_tensor;
pub extern fn ggml_set_i32(tensor: [*c]struct_ggml_tensor, value: i32) [*c]struct_ggml_tensor;
pub extern fn ggml_set_f32(tensor: [*c]struct_ggml_tensor, value: f32) [*c]struct_ggml_tensor;
pub extern fn ggml_get_i32_1d(tensor: [*c]const struct_ggml_tensor, i: c_int) i32;
pub extern fn ggml_set_i32_1d(tensor: [*c]const struct_ggml_tensor, i: c_int, value: i32) void;
pub extern fn ggml_get_i32_nd(tensor: [*c]const struct_ggml_tensor, @"i0": c_int, @"i1": c_int, @"i2": c_int, @"i3": c_int) i32;
pub extern fn ggml_set_i32_nd(tensor: [*c]const struct_ggml_tensor, @"i0": c_int, @"i1": c_int, @"i2": c_int, @"i3": c_int, value: i32) void;
pub extern fn ggml_get_f32_1d(tensor: [*c]const struct_ggml_tensor, i: c_int) f32;
pub extern fn ggml_set_f32_1d(tensor: [*c]const struct_ggml_tensor, i: c_int, value: f32) void;
pub extern fn ggml_get_f32_nd(tensor: [*c]const struct_ggml_tensor, @"i0": c_int, @"i1": c_int, @"i2": c_int, @"i3": c_int) f32;
pub extern fn ggml_set_f32_nd(tensor: [*c]const struct_ggml_tensor, @"i0": c_int, @"i1": c_int, @"i2": c_int, @"i3": c_int, value: f32) void;
pub extern fn ggml_threadpool_new(params: [*c]struct_ggml_threadpool_params) ?*struct_ggml_threadpool;
pub extern fn ggml_threadpool_free(threadpool: ?*struct_ggml_threadpool) void;
pub extern fn ggml_threadpool_get_n_threads(threadpool: ?*struct_ggml_threadpool) c_int;
pub extern fn ggml_threadpool_pause(threadpool: ?*struct_ggml_threadpool) void;
pub extern fn ggml_threadpool_resume(threadpool: ?*struct_ggml_threadpool) void;
pub extern fn ggml_graph_plan(cgraph: ?*const struct_ggml_cgraph, n_threads: c_int, threadpool: ?*struct_ggml_threadpool) struct_ggml_cplan;
pub extern fn ggml_graph_compute(cgraph: ?*struct_ggml_cgraph, cplan: [*c]struct_ggml_cplan) enum_ggml_status;
pub extern fn ggml_graph_compute_with_ctx(ctx: ?*struct_ggml_context, cgraph: ?*struct_ggml_cgraph, n_threads: c_int) enum_ggml_status;
pub extern fn ggml_cpu_has_sse3() c_int;
pub extern fn ggml_cpu_has_ssse3() c_int;
pub extern fn ggml_cpu_has_avx() c_int;
pub extern fn ggml_cpu_has_avx_vnni() c_int;
pub extern fn ggml_cpu_has_avx2() c_int;
pub extern fn ggml_cpu_has_bmi2() c_int;
pub extern fn ggml_cpu_has_f16c() c_int;
pub extern fn ggml_cpu_has_fma() c_int;
pub extern fn ggml_cpu_has_avx512() c_int;
pub extern fn ggml_cpu_has_avx512_vbmi() c_int;
pub extern fn ggml_cpu_has_avx512_vnni() c_int;
pub extern fn ggml_cpu_has_avx512_bf16() c_int;
pub extern fn ggml_cpu_has_amx_int8() c_int;
pub extern fn ggml_cpu_has_neon() c_int;
pub extern fn ggml_cpu_has_arm_fma() c_int;
pub extern fn ggml_cpu_has_fp16_va() c_int;
pub extern fn ggml_cpu_has_dotprod() c_int;
pub extern fn ggml_cpu_has_matmul_int8() c_int;
pub extern fn ggml_cpu_has_sve() c_int;
pub extern fn ggml_cpu_get_sve_cnt() c_int;
pub extern fn ggml_cpu_has_sme() c_int;
pub extern fn ggml_cpu_has_riscv_v() c_int;
pub extern fn ggml_cpu_has_vsx() c_int;
pub extern fn ggml_cpu_has_vxe() c_int;
pub extern fn ggml_cpu_has_nnpa() c_int;
pub extern fn ggml_cpu_has_wasm_simd() c_int;
pub extern fn ggml_cpu_has_llamafile() c_int;
pub const ggml_vec_dot_t = ?*const fn (c_int, noalias [*c]f32, usize, noalias ?*const anyopaque, usize, noalias ?*const anyopaque, usize, c_int) callconv(.c) void;
pub const struct_ggml_type_traits_cpu = extern struct {
    from_float: ggml_from_float_t = @import("std").mem.zeroes(ggml_from_float_t),
    vec_dot: ggml_vec_dot_t = @import("std").mem.zeroes(ggml_vec_dot_t),
    vec_dot_type: enum_ggml_type = @import("std").mem.zeroes(enum_ggml_type),
    nrows: i64 = @import("std").mem.zeroes(i64),
};
pub extern fn ggml_get_type_traits_cpu(@"type": enum_ggml_type) [*c]const struct_ggml_type_traits_cpu;
pub extern fn ggml_cpu_init() void;
pub extern fn ggml_backend_cpu_init() ggml_backend_t;
pub extern fn ggml_backend_is_cpu(backend: ggml_backend_t) bool;
pub extern fn ggml_backend_cpu_set_n_threads(backend_cpu: ggml_backend_t, n_threads: c_int) void;
pub extern fn ggml_backend_cpu_set_threadpool(backend_cpu: ggml_backend_t, threadpool: ggml_threadpool_t) void;
pub extern fn ggml_backend_cpu_set_abort_callback(backend_cpu: ggml_backend_t, abort_callback: ggml_abort_callback, abort_callback_data: ?*anyopaque) void;
pub extern fn ggml_backend_cpu_reg() ggml_backend_reg_t;
pub extern fn ggml_cpu_fp32_to_fp32([*c]const f32, [*c]f32, i64) void;
pub extern fn ggml_cpu_fp32_to_fp16([*c]const f32, [*c]ggml_fp16_t, i64) void;
pub extern fn ggml_cpu_fp16_to_fp32([*c]const ggml_fp16_t, [*c]f32, i64) void;
pub extern fn ggml_cpu_fp32_to_bf16([*c]const f32, [*c]ggml_bf16_t, i64) void;
pub extern fn ggml_cpu_bf16_to_fp32([*c]const ggml_bf16_t, [*c]f32, i64) void;
pub const struct_whisper_context = opaque {};
pub const struct_whisper_state = opaque {};
pub const WHISPER_SAMPLING_GREEDY: c_int = 0;
pub const WHISPER_SAMPLING_BEAM_SEARCH: c_int = 1;
pub const enum_whisper_sampling_strategy = c_uint;
pub const whisper_token = i32;
const struct_unnamed_4 = extern struct {
    best_of: c_int = @import("std").mem.zeroes(c_int),
};
const struct_unnamed_5 = extern struct {
    beam_size: c_int = @import("std").mem.zeroes(c_int),
    patience: f32 = @import("std").mem.zeroes(f32),
};
pub const whisper_new_segment_callback = ?*const fn (?*struct_whisper_context, ?*struct_whisper_state, c_int, ?*anyopaque) callconv(.c) void;
pub const whisper_progress_callback = ?*const fn (?*struct_whisper_context, ?*struct_whisper_state, c_int, ?*anyopaque) callconv(.c) void;
pub const whisper_encoder_begin_callback = ?*const fn (?*struct_whisper_context, ?*struct_whisper_state, ?*anyopaque) callconv(.c) bool;
pub const struct_whisper_token_data = extern struct {
    id: whisper_token = @import("std").mem.zeroes(whisper_token),
    tid: whisper_token = @import("std").mem.zeroes(whisper_token),
    p: f32 = @import("std").mem.zeroes(f32),
    plog: f32 = @import("std").mem.zeroes(f32),
    pt: f32 = @import("std").mem.zeroes(f32),
    ptsum: f32 = @import("std").mem.zeroes(f32),
    t0: i64 = @import("std").mem.zeroes(i64),
    t1: i64 = @import("std").mem.zeroes(i64),
    t_dtw: i64 = @import("std").mem.zeroes(i64),
    vlen: f32 = @import("std").mem.zeroes(f32),
};
pub const whisper_token_data = struct_whisper_token_data;
pub const whisper_logits_filter_callback = ?*const fn (?*struct_whisper_context, ?*struct_whisper_state, [*c]const whisper_token_data, c_int, [*c]f32, ?*anyopaque) callconv(.c) void;
pub const WHISPER_GRETYPE_END: c_int = 0;
pub const WHISPER_GRETYPE_ALT: c_int = 1;
pub const WHISPER_GRETYPE_RULE_REF: c_int = 2;
pub const WHISPER_GRETYPE_CHAR: c_int = 3;
pub const WHISPER_GRETYPE_CHAR_NOT: c_int = 4;
pub const WHISPER_GRETYPE_CHAR_RNG_UPPER: c_int = 5;
pub const WHISPER_GRETYPE_CHAR_ALT: c_int = 6;
pub const enum_whisper_gretype = c_uint;
pub const struct_whisper_grammar_element = extern struct {
    type: enum_whisper_gretype = @import("std").mem.zeroes(enum_whisper_gretype),
    value: u32 = @import("std").mem.zeroes(u32),
};
pub const whisper_grammar_element = struct_whisper_grammar_element;
pub const struct_whisper_vad_params = extern struct {
    threshold: f32 = @import("std").mem.zeroes(f32),
    min_speech_duration_ms: c_int = @import("std").mem.zeroes(c_int),
    min_silence_duration_ms: c_int = @import("std").mem.zeroes(c_int),
    max_speech_duration_s: f32 = @import("std").mem.zeroes(f32),
    speech_pad_ms: c_int = @import("std").mem.zeroes(c_int),
    samples_overlap: f32 = @import("std").mem.zeroes(f32),
};
pub const whisper_vad_params = struct_whisper_vad_params;
pub const struct_whisper_full_params = extern struct {
    strategy: enum_whisper_sampling_strategy = @import("std").mem.zeroes(enum_whisper_sampling_strategy),
    n_threads: c_int = @import("std").mem.zeroes(c_int),
    n_max_text_ctx: c_int = @import("std").mem.zeroes(c_int),
    offset_ms: c_int = @import("std").mem.zeroes(c_int),
    duration_ms: c_int = @import("std").mem.zeroes(c_int),
    translate: bool = @import("std").mem.zeroes(bool),
    no_context: bool = @import("std").mem.zeroes(bool),
    no_timestamps: bool = @import("std").mem.zeroes(bool),
    single_segment: bool = @import("std").mem.zeroes(bool),
    print_special: bool = @import("std").mem.zeroes(bool),
    print_progress: bool = @import("std").mem.zeroes(bool),
    print_realtime: bool = @import("std").mem.zeroes(bool),
    print_timestamps: bool = @import("std").mem.zeroes(bool),
    token_timestamps: bool = @import("std").mem.zeroes(bool),
    thold_pt: f32 = @import("std").mem.zeroes(f32),
    thold_ptsum: f32 = @import("std").mem.zeroes(f32),
    max_len: c_int = @import("std").mem.zeroes(c_int),
    split_on_word: bool = @import("std").mem.zeroes(bool),
    max_tokens: c_int = @import("std").mem.zeroes(c_int),
    debug_mode: bool = @import("std").mem.zeroes(bool),
    audio_ctx: c_int = @import("std").mem.zeroes(c_int),
    tdrz_enable: bool = @import("std").mem.zeroes(bool),
    suppress_regex: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    initial_prompt: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    prompt_tokens: [*c]const whisper_token = @import("std").mem.zeroes([*c]const whisper_token),
    prompt_n_tokens: c_int = @import("std").mem.zeroes(c_int),
    language: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    detect_language: bool = @import("std").mem.zeroes(bool),
    suppress_blank: bool = @import("std").mem.zeroes(bool),
    suppress_nst: bool = @import("std").mem.zeroes(bool),
    temperature: f32 = @import("std").mem.zeroes(f32),
    max_initial_ts: f32 = @import("std").mem.zeroes(f32),
    length_penalty: f32 = @import("std").mem.zeroes(f32),
    temperature_inc: f32 = @import("std").mem.zeroes(f32),
    entropy_thold: f32 = @import("std").mem.zeroes(f32),
    logprob_thold: f32 = @import("std").mem.zeroes(f32),
    no_speech_thold: f32 = @import("std").mem.zeroes(f32),
    greedy: struct_unnamed_4 = @import("std").mem.zeroes(struct_unnamed_4),
    beam_search: struct_unnamed_5 = @import("std").mem.zeroes(struct_unnamed_5),
    new_segment_callback: whisper_new_segment_callback = @import("std").mem.zeroes(whisper_new_segment_callback),
    new_segment_callback_user_data: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    progress_callback: whisper_progress_callback = @import("std").mem.zeroes(whisper_progress_callback),
    progress_callback_user_data: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    encoder_begin_callback: whisper_encoder_begin_callback = @import("std").mem.zeroes(whisper_encoder_begin_callback),
    encoder_begin_callback_user_data: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    abort_callback: ggml_abort_callback = @import("std").mem.zeroes(ggml_abort_callback),
    abort_callback_user_data: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    logits_filter_callback: whisper_logits_filter_callback = @import("std").mem.zeroes(whisper_logits_filter_callback),
    logits_filter_callback_user_data: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    grammar_rules: [*c][*c]const whisper_grammar_element = @import("std").mem.zeroes([*c][*c]const whisper_grammar_element),
    n_grammar_rules: usize = @import("std").mem.zeroes(usize),
    i_start_rule: usize = @import("std").mem.zeroes(usize),
    grammar_penalty: f32 = @import("std").mem.zeroes(f32),
    vad: bool = @import("std").mem.zeroes(bool),
    vad_model_path: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    vad_params: whisper_vad_params = @import("std").mem.zeroes(whisper_vad_params),
};
pub const whisper_pos = i32;
pub const whisper_seq_id = i32;
pub const WHISPER_AHEADS_NONE: c_int = 0;
pub const WHISPER_AHEADS_N_TOP_MOST: c_int = 1;
pub const WHISPER_AHEADS_CUSTOM: c_int = 2;
pub const WHISPER_AHEADS_TINY_EN: c_int = 3;
pub const WHISPER_AHEADS_TINY: c_int = 4;
pub const WHISPER_AHEADS_BASE_EN: c_int = 5;
pub const WHISPER_AHEADS_BASE: c_int = 6;
pub const WHISPER_AHEADS_SMALL_EN: c_int = 7;
pub const WHISPER_AHEADS_SMALL: c_int = 8;
pub const WHISPER_AHEADS_MEDIUM_EN: c_int = 9;
pub const WHISPER_AHEADS_MEDIUM: c_int = 10;
pub const WHISPER_AHEADS_LARGE_V1: c_int = 11;
pub const WHISPER_AHEADS_LARGE_V2: c_int = 12;
pub const WHISPER_AHEADS_LARGE_V3: c_int = 13;
pub const WHISPER_AHEADS_LARGE_V3_TURBO: c_int = 14;
pub const enum_whisper_alignment_heads_preset = c_uint;
pub const struct_whisper_ahead = extern struct {
    n_text_layer: c_int = @import("std").mem.zeroes(c_int),
    n_head: c_int = @import("std").mem.zeroes(c_int),
};
pub const whisper_ahead = struct_whisper_ahead;
pub const struct_whisper_aheads = extern struct {
    n_heads: usize = @import("std").mem.zeroes(usize),
    heads: [*c]const whisper_ahead = @import("std").mem.zeroes([*c]const whisper_ahead),
};
pub const whisper_aheads = struct_whisper_aheads;
pub const struct_whisper_context_params = extern struct {
    use_gpu: bool = @import("std").mem.zeroes(bool),
    flash_attn: bool = @import("std").mem.zeroes(bool),
    gpu_device: c_int = @import("std").mem.zeroes(c_int),
    dtw_token_timestamps: bool = @import("std").mem.zeroes(bool),
    dtw_aheads_preset: enum_whisper_alignment_heads_preset = @import("std").mem.zeroes(enum_whisper_alignment_heads_preset),
    dtw_n_top: c_int = @import("std").mem.zeroes(c_int),
    dtw_aheads: struct_whisper_aheads = @import("std").mem.zeroes(struct_whisper_aheads),
    dtw_mem_size: usize = @import("std").mem.zeroes(usize),
};
pub const struct_whisper_model_loader = extern struct {
    context: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    read: ?*const fn (?*anyopaque, ?*anyopaque, usize) callconv(.c) usize = @import("std").mem.zeroes(?*const fn (?*anyopaque, ?*anyopaque, usize) callconv(.c) usize),
    eof: ?*const fn (?*anyopaque) callconv(.c) bool = @import("std").mem.zeroes(?*const fn (?*anyopaque) callconv(.c) bool),
    close: ?*const fn (?*anyopaque) callconv(.c) void = @import("std").mem.zeroes(?*const fn (?*anyopaque) callconv(.c) void),
};
pub const whisper_model_loader = struct_whisper_model_loader;
pub extern fn whisper_version() [*c]const u8;
pub extern fn whisper_init_from_file_with_params(path_model: [*c]const u8, params: struct_whisper_context_params) ?*struct_whisper_context;
pub extern fn whisper_init_from_buffer_with_params(buffer: ?*anyopaque, buffer_size: usize, params: struct_whisper_context_params) ?*struct_whisper_context;
pub extern fn whisper_init_with_params(loader: [*c]struct_whisper_model_loader, params: struct_whisper_context_params) ?*struct_whisper_context;
pub extern fn whisper_init_from_file_with_params_no_state(path_model: [*c]const u8, params: struct_whisper_context_params) ?*struct_whisper_context;
pub extern fn whisper_init_from_buffer_with_params_no_state(buffer: ?*anyopaque, buffer_size: usize, params: struct_whisper_context_params) ?*struct_whisper_context;
pub extern fn whisper_init_with_params_no_state(loader: [*c]struct_whisper_model_loader, params: struct_whisper_context_params) ?*struct_whisper_context;
pub extern fn whisper_init_from_file(path_model: [*c]const u8) ?*struct_whisper_context;
pub extern fn whisper_init_from_buffer(buffer: ?*anyopaque, buffer_size: usize) ?*struct_whisper_context;
pub extern fn whisper_init(loader: [*c]struct_whisper_model_loader) ?*struct_whisper_context;
pub extern fn whisper_init_from_file_no_state(path_model: [*c]const u8) ?*struct_whisper_context;
pub extern fn whisper_init_from_buffer_no_state(buffer: ?*anyopaque, buffer_size: usize) ?*struct_whisper_context;
pub extern fn whisper_init_no_state(loader: [*c]struct_whisper_model_loader) ?*struct_whisper_context;
pub extern fn whisper_init_state(ctx: ?*struct_whisper_context) ?*struct_whisper_state;
pub extern fn whisper_ctx_init_openvino_encoder_with_state(ctx: ?*struct_whisper_context, state: ?*struct_whisper_state, model_path: [*c]const u8, device: [*c]const u8, cache_dir: [*c]const u8) c_int;
pub extern fn whisper_ctx_init_openvino_encoder(ctx: ?*struct_whisper_context, model_path: [*c]const u8, device: [*c]const u8, cache_dir: [*c]const u8) c_int;
pub extern fn whisper_free(ctx: ?*struct_whisper_context) void;
pub extern fn whisper_free_state(state: ?*struct_whisper_state) void;
pub extern fn whisper_free_params(params: [*c]struct_whisper_full_params) void;
pub extern fn whisper_free_context_params(params: [*c]struct_whisper_context_params) void;
pub extern fn whisper_pcm_to_mel(ctx: ?*struct_whisper_context, samples: [*c]const f32, n_samples: c_int, n_threads: c_int) c_int;
pub extern fn whisper_pcm_to_mel_with_state(ctx: ?*struct_whisper_context, state: ?*struct_whisper_state, samples: [*c]const f32, n_samples: c_int, n_threads: c_int) c_int;
pub extern fn whisper_set_mel(ctx: ?*struct_whisper_context, data: [*c]const f32, n_len: c_int, n_mel: c_int) c_int;
pub extern fn whisper_set_mel_with_state(ctx: ?*struct_whisper_context, state: ?*struct_whisper_state, data: [*c]const f32, n_len: c_int, n_mel: c_int) c_int;
pub extern fn whisper_encode(ctx: ?*struct_whisper_context, offset: c_int, n_threads: c_int) c_int;
pub extern fn whisper_encode_with_state(ctx: ?*struct_whisper_context, state: ?*struct_whisper_state, offset: c_int, n_threads: c_int) c_int;
pub extern fn whisper_decode(ctx: ?*struct_whisper_context, tokens: [*c]const whisper_token, n_tokens: c_int, n_past: c_int, n_threads: c_int) c_int;
pub extern fn whisper_decode_with_state(ctx: ?*struct_whisper_context, state: ?*struct_whisper_state, tokens: [*c]const whisper_token, n_tokens: c_int, n_past: c_int, n_threads: c_int) c_int;
pub extern fn whisper_tokenize(ctx: ?*struct_whisper_context, text: [*c]const u8, tokens: [*c]whisper_token, n_max_tokens: c_int) c_int;
pub extern fn whisper_token_count(ctx: ?*struct_whisper_context, text: [*c]const u8) c_int;
pub extern fn whisper_lang_max_id() c_int;
pub extern fn whisper_lang_id(lang: [*c]const u8) c_int;
pub extern fn whisper_lang_str(id: c_int) [*c]const u8;
pub extern fn whisper_lang_str_full(id: c_int) [*c]const u8;
pub extern fn whisper_lang_auto_detect(ctx: ?*struct_whisper_context, offset_ms: c_int, n_threads: c_int, lang_probs: [*c]f32) c_int;
pub extern fn whisper_lang_auto_detect_with_state(ctx: ?*struct_whisper_context, state: ?*struct_whisper_state, offset_ms: c_int, n_threads: c_int, lang_probs: [*c]f32) c_int;
pub extern fn whisper_n_len(ctx: ?*struct_whisper_context) c_int;
pub extern fn whisper_n_len_from_state(state: ?*struct_whisper_state) c_int;
pub extern fn whisper_n_vocab(ctx: ?*struct_whisper_context) c_int;
pub extern fn whisper_n_text_ctx(ctx: ?*struct_whisper_context) c_int;
pub extern fn whisper_n_audio_ctx(ctx: ?*struct_whisper_context) c_int;
pub extern fn whisper_is_multilingual(ctx: ?*struct_whisper_context) c_int;
pub extern fn whisper_model_n_vocab(ctx: ?*struct_whisper_context) c_int;
pub extern fn whisper_model_n_audio_ctx(ctx: ?*struct_whisper_context) c_int;
pub extern fn whisper_model_n_audio_state(ctx: ?*struct_whisper_context) c_int;
pub extern fn whisper_model_n_audio_head(ctx: ?*struct_whisper_context) c_int;
pub extern fn whisper_model_n_audio_layer(ctx: ?*struct_whisper_context) c_int;
pub extern fn whisper_model_n_text_ctx(ctx: ?*struct_whisper_context) c_int;
pub extern fn whisper_model_n_text_state(ctx: ?*struct_whisper_context) c_int;
pub extern fn whisper_model_n_text_head(ctx: ?*struct_whisper_context) c_int;
pub extern fn whisper_model_n_text_layer(ctx: ?*struct_whisper_context) c_int;
pub extern fn whisper_model_n_mels(ctx: ?*struct_whisper_context) c_int;
pub extern fn whisper_model_ftype(ctx: ?*struct_whisper_context) c_int;
pub extern fn whisper_model_type(ctx: ?*struct_whisper_context) c_int;
pub extern fn whisper_get_logits(ctx: ?*struct_whisper_context) [*c]f32;
pub extern fn whisper_get_logits_from_state(state: ?*struct_whisper_state) [*c]f32;
pub extern fn whisper_token_to_str(ctx: ?*struct_whisper_context, token: whisper_token) [*c]const u8;
pub extern fn whisper_model_type_readable(ctx: ?*struct_whisper_context) [*c]const u8;
pub extern fn whisper_token_eot(ctx: ?*struct_whisper_context) whisper_token;
pub extern fn whisper_token_sot(ctx: ?*struct_whisper_context) whisper_token;
pub extern fn whisper_token_solm(ctx: ?*struct_whisper_context) whisper_token;
pub extern fn whisper_token_prev(ctx: ?*struct_whisper_context) whisper_token;
pub extern fn whisper_token_nosp(ctx: ?*struct_whisper_context) whisper_token;
pub extern fn whisper_token_not(ctx: ?*struct_whisper_context) whisper_token;
pub extern fn whisper_token_beg(ctx: ?*struct_whisper_context) whisper_token;
pub extern fn whisper_token_lang(ctx: ?*struct_whisper_context, lang_id: c_int) whisper_token;
pub extern fn whisper_token_translate(ctx: ?*struct_whisper_context) whisper_token;
pub extern fn whisper_token_transcribe(ctx: ?*struct_whisper_context) whisper_token;
pub const struct_whisper_timings = extern struct {
    sample_ms: f32 = @import("std").mem.zeroes(f32),
    encode_ms: f32 = @import("std").mem.zeroes(f32),
    decode_ms: f32 = @import("std").mem.zeroes(f32),
    batchd_ms: f32 = @import("std").mem.zeroes(f32),
    prompt_ms: f32 = @import("std").mem.zeroes(f32),
};
pub extern fn whisper_get_timings(ctx: ?*struct_whisper_context) [*c]struct_whisper_timings;
pub extern fn whisper_print_timings(ctx: ?*struct_whisper_context) void;
pub extern fn whisper_reset_timings(ctx: ?*struct_whisper_context) void;
pub extern fn whisper_print_system_info() [*c]const u8;
pub extern fn whisper_context_default_params_by_ref() [*c]struct_whisper_context_params;
pub extern fn whisper_context_default_params() struct_whisper_context_params;
pub extern fn whisper_full_default_params_by_ref(strategy: enum_whisper_sampling_strategy) [*c]struct_whisper_full_params;
pub extern fn whisper_full_default_params(strategy: enum_whisper_sampling_strategy) struct_whisper_full_params;
pub extern fn whisper_full(ctx: ?*struct_whisper_context, params: struct_whisper_full_params, samples: [*c]const f32, n_samples: c_int) c_int;
pub extern fn whisper_full_with_state(ctx: ?*struct_whisper_context, state: ?*struct_whisper_state, params: struct_whisper_full_params, samples: [*c]const f32, n_samples: c_int) c_int;
pub extern fn whisper_full_parallel(ctx: ?*struct_whisper_context, params: struct_whisper_full_params, samples: [*c]const f32, n_samples: c_int, n_processors: c_int) c_int;
pub extern fn whisper_full_n_segments(ctx: ?*struct_whisper_context) c_int;
pub extern fn whisper_full_n_segments_from_state(state: ?*struct_whisper_state) c_int;
pub extern fn whisper_full_lang_id(ctx: ?*struct_whisper_context) c_int;
pub extern fn whisper_full_lang_id_from_state(state: ?*struct_whisper_state) c_int;
pub extern fn whisper_full_get_segment_t0(ctx: ?*struct_whisper_context, i_segment: c_int) i64;
pub extern fn whisper_full_get_segment_t0_from_state(state: ?*struct_whisper_state, i_segment: c_int) i64;
pub extern fn whisper_full_get_segment_t1(ctx: ?*struct_whisper_context, i_segment: c_int) i64;
pub extern fn whisper_full_get_segment_t1_from_state(state: ?*struct_whisper_state, i_segment: c_int) i64;
pub extern fn whisper_full_get_segment_speaker_turn_next(ctx: ?*struct_whisper_context, i_segment: c_int) bool;
pub extern fn whisper_full_get_segment_speaker_turn_next_from_state(state: ?*struct_whisper_state, i_segment: c_int) bool;
pub extern fn whisper_full_get_segment_text(ctx: ?*struct_whisper_context, i_segment: c_int) [*c]const u8;
pub extern fn whisper_full_get_segment_text_from_state(state: ?*struct_whisper_state, i_segment: c_int) [*c]const u8;
pub extern fn whisper_full_n_tokens(ctx: ?*struct_whisper_context, i_segment: c_int) c_int;
pub extern fn whisper_full_n_tokens_from_state(state: ?*struct_whisper_state, i_segment: c_int) c_int;
pub extern fn whisper_full_get_token_text(ctx: ?*struct_whisper_context, i_segment: c_int, i_token: c_int) [*c]const u8;
pub extern fn whisper_full_get_token_text_from_state(ctx: ?*struct_whisper_context, state: ?*struct_whisper_state, i_segment: c_int, i_token: c_int) [*c]const u8;
pub extern fn whisper_full_get_token_id(ctx: ?*struct_whisper_context, i_segment: c_int, i_token: c_int) whisper_token;
pub extern fn whisper_full_get_token_id_from_state(state: ?*struct_whisper_state, i_segment: c_int, i_token: c_int) whisper_token;
pub extern fn whisper_full_get_token_data(ctx: ?*struct_whisper_context, i_segment: c_int, i_token: c_int) whisper_token_data;
pub extern fn whisper_full_get_token_data_from_state(state: ?*struct_whisper_state, i_segment: c_int, i_token: c_int) whisper_token_data;
pub extern fn whisper_full_get_token_p(ctx: ?*struct_whisper_context, i_segment: c_int, i_token: c_int) f32;
pub extern fn whisper_full_get_token_p_from_state(state: ?*struct_whisper_state, i_segment: c_int, i_token: c_int) f32;
pub const struct_whisper_vad_context = opaque {};
pub extern fn whisper_vad_default_params() struct_whisper_vad_params;
pub const struct_whisper_vad_context_params = extern struct {
    n_threads: c_int = @import("std").mem.zeroes(c_int),
    use_gpu: bool = @import("std").mem.zeroes(bool),
    gpu_device: c_int = @import("std").mem.zeroes(c_int),
};
pub extern fn whisper_vad_default_context_params() struct_whisper_vad_context_params;
pub extern fn whisper_vad_init_from_file_with_params(path_model: [*c]const u8, params: struct_whisper_vad_context_params) ?*struct_whisper_vad_context;
pub extern fn whisper_vad_init_with_params(loader: [*c]struct_whisper_model_loader, params: struct_whisper_vad_context_params) ?*struct_whisper_vad_context;
pub extern fn whisper_vad_detect_speech(vctx: ?*struct_whisper_vad_context, samples: [*c]const f32, n_samples: c_int) bool;
pub extern fn whisper_vad_n_probs(vctx: ?*struct_whisper_vad_context) c_int;
pub extern fn whisper_vad_probs(vctx: ?*struct_whisper_vad_context) [*c]f32;
pub const struct_whisper_vad_segments = opaque {};
pub extern fn whisper_vad_segments_from_probs(vctx: ?*struct_whisper_vad_context, params: struct_whisper_vad_params) ?*struct_whisper_vad_segments;
pub extern fn whisper_vad_segments_from_samples(vctx: ?*struct_whisper_vad_context, params: struct_whisper_vad_params, samples: [*c]const f32, n_samples: c_int) ?*struct_whisper_vad_segments;
pub extern fn whisper_vad_segments_n_segments(segments: ?*struct_whisper_vad_segments) c_int;
pub extern fn whisper_vad_segments_get_segment_t0(segments: ?*struct_whisper_vad_segments, i_segment: c_int) f32;
pub extern fn whisper_vad_segments_get_segment_t1(segments: ?*struct_whisper_vad_segments, i_segment: c_int) f32;
pub extern fn whisper_vad_free_segments(segments: ?*struct_whisper_vad_segments) void;
pub extern fn whisper_vad_free(ctx: ?*struct_whisper_vad_context) void;
pub extern fn whisper_bench_memcpy(n_threads: c_int) c_int;
pub extern fn whisper_bench_memcpy_str(n_threads: c_int) [*c]const u8;
pub extern fn whisper_bench_ggml_mul_mat(n_threads: c_int) c_int;
pub extern fn whisper_bench_ggml_mul_mat_str(n_threads: c_int) [*c]const u8;
pub extern fn whisper_log_set(log_callback: ggml_log_callback, user_data: ?*anyopaque) void;
pub extern fn whisper_full_get_segment_no_speech_prob(ctx: ?*struct_whisper_context, i_segment: c_int) f32;
pub extern fn whisper_full_get_segment_no_speech_prob_from_state(state: ?*struct_whisper_state, i_segment: c_int) f32;
pub const __llvm__ = @as(c_int, 1);
pub const __clang__ = @as(c_int, 1);
pub const __clang_major__ = @as(c_int, 19);
pub const __clang_minor__ = @as(c_int, 1);
pub const __clang_patchlevel__ = @as(c_int, 7);
pub const __clang_version__ = "19.1.7 ";
pub const __GNUC__ = @as(c_int, 4);
pub const __GNUC_MINOR__ = @as(c_int, 2);
pub const __GNUC_PATCHLEVEL__ = @as(c_int, 1);
pub const __GXX_ABI_VERSION = @as(c_int, 1002);
pub const __ATOMIC_RELAXED = @as(c_int, 0);
pub const __ATOMIC_CONSUME = @as(c_int, 1);
pub const __ATOMIC_ACQUIRE = @as(c_int, 2);
pub const __ATOMIC_RELEASE = @as(c_int, 3);
pub const __ATOMIC_ACQ_REL = @as(c_int, 4);
pub const __ATOMIC_SEQ_CST = @as(c_int, 5);
pub const __MEMORY_SCOPE_SYSTEM = @as(c_int, 0);
pub const __MEMORY_SCOPE_DEVICE = @as(c_int, 1);
pub const __MEMORY_SCOPE_WRKGRP = @as(c_int, 2);
pub const __MEMORY_SCOPE_WVFRNT = @as(c_int, 3);
pub const __MEMORY_SCOPE_SINGLE = @as(c_int, 4);
pub const __OPENCL_MEMORY_SCOPE_WORK_ITEM = @as(c_int, 0);
pub const __OPENCL_MEMORY_SCOPE_WORK_GROUP = @as(c_int, 1);
pub const __OPENCL_MEMORY_SCOPE_DEVICE = @as(c_int, 2);
pub const __OPENCL_MEMORY_SCOPE_ALL_SVM_DEVICES = @as(c_int, 3);
pub const __OPENCL_MEMORY_SCOPE_SUB_GROUP = @as(c_int, 4);
pub const __FPCLASS_SNAN = @as(c_int, 0x0001);
pub const __FPCLASS_QNAN = @as(c_int, 0x0002);
pub const __FPCLASS_NEGINF = @as(c_int, 0x0004);
pub const __FPCLASS_NEGNORMAL = @as(c_int, 0x0008);
pub const __FPCLASS_NEGSUBNORMAL = @as(c_int, 0x0010);
pub const __FPCLASS_NEGZERO = @as(c_int, 0x0020);
pub const __FPCLASS_POSZERO = @as(c_int, 0x0040);
pub const __FPCLASS_POSSUBNORMAL = @as(c_int, 0x0080);
pub const __FPCLASS_POSNORMAL = @as(c_int, 0x0100);
pub const __FPCLASS_POSINF = @as(c_int, 0x0200);
pub const __PRAGMA_REDEFINE_EXTNAME = @as(c_int, 1);
pub const __VERSION__ = "Clang 19.1.7";
pub const __OBJC_BOOL_IS_BOOL = @as(c_int, 0);
pub const __CONSTANT_CFSTRINGS__ = @as(c_int, 1);
pub const __clang_literal_encoding__ = "UTF-8";
pub const __clang_wide_literal_encoding__ = "UTF-32";
pub const __ORDER_LITTLE_ENDIAN__ = @as(c_int, 1234);
pub const __ORDER_BIG_ENDIAN__ = @as(c_int, 4321);
pub const __ORDER_PDP_ENDIAN__ = @as(c_int, 3412);
pub const __BYTE_ORDER__ = __ORDER_LITTLE_ENDIAN__;
pub const __LITTLE_ENDIAN__ = @as(c_int, 1);
pub const _LP64 = @as(c_int, 1);
pub const __LP64__ = @as(c_int, 1);
pub const __CHAR_BIT__ = @as(c_int, 8);
pub const __BOOL_WIDTH__ = @as(c_int, 8);
pub const __SHRT_WIDTH__ = @as(c_int, 16);
pub const __INT_WIDTH__ = @as(c_int, 32);
pub const __LONG_WIDTH__ = @as(c_int, 64);
pub const __LLONG_WIDTH__ = @as(c_int, 64);
pub const __BITINT_MAXWIDTH__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 8388608, .decimal);
pub const __SCHAR_MAX__ = @as(c_int, 127);
pub const __SHRT_MAX__ = @as(c_int, 32767);
pub const __INT_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __LONG_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __LONG_LONG_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __WCHAR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __WCHAR_WIDTH__ = @as(c_int, 32);
pub const __WINT_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __WINT_WIDTH__ = @as(c_int, 32);
pub const __INTMAX_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INTMAX_WIDTH__ = @as(c_int, 64);
pub const __SIZE_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __SIZE_WIDTH__ = @as(c_int, 64);
pub const __UINTMAX_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINTMAX_WIDTH__ = @as(c_int, 64);
pub const __PTRDIFF_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __PTRDIFF_WIDTH__ = @as(c_int, 64);
pub const __INTPTR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INTPTR_WIDTH__ = @as(c_int, 64);
pub const __UINTPTR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINTPTR_WIDTH__ = @as(c_int, 64);
pub const __SIZEOF_DOUBLE__ = @as(c_int, 8);
pub const __SIZEOF_FLOAT__ = @as(c_int, 4);
pub const __SIZEOF_INT__ = @as(c_int, 4);
pub const __SIZEOF_LONG__ = @as(c_int, 8);
pub const __SIZEOF_LONG_DOUBLE__ = @as(c_int, 16);
pub const __SIZEOF_LONG_LONG__ = @as(c_int, 8);
pub const __SIZEOF_POINTER__ = @as(c_int, 8);
pub const __SIZEOF_SHORT__ = @as(c_int, 2);
pub const __SIZEOF_PTRDIFF_T__ = @as(c_int, 8);
pub const __SIZEOF_SIZE_T__ = @as(c_int, 8);
pub const __SIZEOF_WCHAR_T__ = @as(c_int, 4);
pub const __SIZEOF_WINT_T__ = @as(c_int, 4);
pub const __SIZEOF_INT128__ = @as(c_int, 16);
pub const __INTMAX_TYPE__ = c_long;
pub const __INTMAX_FMTd__ = "ld";
pub const __INTMAX_FMTi__ = "li";
pub const __INTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `L`");
// (no file):95:9
pub const __UINTMAX_TYPE__ = c_ulong;
pub const __UINTMAX_FMTo__ = "lo";
pub const __UINTMAX_FMTu__ = "lu";
pub const __UINTMAX_FMTx__ = "lx";
pub const __UINTMAX_FMTX__ = "lX";
pub const __UINTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `UL`");
// (no file):101:9
pub const __PTRDIFF_TYPE__ = c_long;
pub const __PTRDIFF_FMTd__ = "ld";
pub const __PTRDIFF_FMTi__ = "li";
pub const __INTPTR_TYPE__ = c_long;
pub const __INTPTR_FMTd__ = "ld";
pub const __INTPTR_FMTi__ = "li";
pub const __SIZE_TYPE__ = c_ulong;
pub const __SIZE_FMTo__ = "lo";
pub const __SIZE_FMTu__ = "lu";
pub const __SIZE_FMTx__ = "lx";
pub const __SIZE_FMTX__ = "lX";
pub const __WCHAR_TYPE__ = c_int;
pub const __WINT_TYPE__ = c_uint;
pub const __SIG_ATOMIC_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __SIG_ATOMIC_WIDTH__ = @as(c_int, 32);
pub const __CHAR16_TYPE__ = c_ushort;
pub const __CHAR32_TYPE__ = c_uint;
pub const __UINTPTR_TYPE__ = c_ulong;
pub const __UINTPTR_FMTo__ = "lo";
pub const __UINTPTR_FMTu__ = "lu";
pub const __UINTPTR_FMTx__ = "lx";
pub const __UINTPTR_FMTX__ = "lX";
pub const __FLT16_DENORM_MIN__ = @as(f16, 5.9604644775390625e-8);
pub const __FLT16_NORM_MAX__ = @as(f16, 6.5504e+4);
pub const __FLT16_HAS_DENORM__ = @as(c_int, 1);
pub const __FLT16_DIG__ = @as(c_int, 3);
pub const __FLT16_DECIMAL_DIG__ = @as(c_int, 5);
pub const __FLT16_EPSILON__ = @as(f16, 9.765625e-4);
pub const __FLT16_HAS_INFINITY__ = @as(c_int, 1);
pub const __FLT16_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __FLT16_MANT_DIG__ = @as(c_int, 11);
pub const __FLT16_MAX_10_EXP__ = @as(c_int, 4);
pub const __FLT16_MAX_EXP__ = @as(c_int, 16);
pub const __FLT16_MAX__ = @as(f16, 6.5504e+4);
pub const __FLT16_MIN_10_EXP__ = -@as(c_int, 4);
pub const __FLT16_MIN_EXP__ = -@as(c_int, 13);
pub const __FLT16_MIN__ = @as(f16, 6.103515625e-5);
pub const __FLT_DENORM_MIN__ = @as(f32, 1.40129846e-45);
pub const __FLT_NORM_MAX__ = @as(f32, 3.40282347e+38);
pub const __FLT_HAS_DENORM__ = @as(c_int, 1);
pub const __FLT_DIG__ = @as(c_int, 6);
pub const __FLT_DECIMAL_DIG__ = @as(c_int, 9);
pub const __FLT_EPSILON__ = @as(f32, 1.19209290e-7);
pub const __FLT_HAS_INFINITY__ = @as(c_int, 1);
pub const __FLT_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __FLT_MANT_DIG__ = @as(c_int, 24);
pub const __FLT_MAX_10_EXP__ = @as(c_int, 38);
pub const __FLT_MAX_EXP__ = @as(c_int, 128);
pub const __FLT_MAX__ = @as(f32, 3.40282347e+38);
pub const __FLT_MIN_10_EXP__ = -@as(c_int, 37);
pub const __FLT_MIN_EXP__ = -@as(c_int, 125);
pub const __FLT_MIN__ = @as(f32, 1.17549435e-38);
pub const __DBL_DENORM_MIN__ = @as(f64, 4.9406564584124654e-324);
pub const __DBL_NORM_MAX__ = @as(f64, 1.7976931348623157e+308);
pub const __DBL_HAS_DENORM__ = @as(c_int, 1);
pub const __DBL_DIG__ = @as(c_int, 15);
pub const __DBL_DECIMAL_DIG__ = @as(c_int, 17);
pub const __DBL_EPSILON__ = @as(f64, 2.2204460492503131e-16);
pub const __DBL_HAS_INFINITY__ = @as(c_int, 1);
pub const __DBL_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __DBL_MANT_DIG__ = @as(c_int, 53);
pub const __DBL_MAX_10_EXP__ = @as(c_int, 308);
pub const __DBL_MAX_EXP__ = @as(c_int, 1024);
pub const __DBL_MAX__ = @as(f64, 1.7976931348623157e+308);
pub const __DBL_MIN_10_EXP__ = -@as(c_int, 307);
pub const __DBL_MIN_EXP__ = -@as(c_int, 1021);
pub const __DBL_MIN__ = @as(f64, 2.2250738585072014e-308);
pub const __LDBL_DENORM_MIN__ = @as(c_longdouble, 3.64519953188247460253e-4951);
pub const __LDBL_NORM_MAX__ = @as(c_longdouble, 1.18973149535723176502e+4932);
pub const __LDBL_HAS_DENORM__ = @as(c_int, 1);
pub const __LDBL_DIG__ = @as(c_int, 18);
pub const __LDBL_DECIMAL_DIG__ = @as(c_int, 21);
pub const __LDBL_EPSILON__ = @as(c_longdouble, 1.08420217248550443401e-19);
pub const __LDBL_HAS_INFINITY__ = @as(c_int, 1);
pub const __LDBL_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __LDBL_MANT_DIG__ = @as(c_int, 64);
pub const __LDBL_MAX_10_EXP__ = @as(c_int, 4932);
pub const __LDBL_MAX_EXP__ = @as(c_int, 16384);
pub const __LDBL_MAX__ = @as(c_longdouble, 1.18973149535723176502e+4932);
pub const __LDBL_MIN_10_EXP__ = -@as(c_int, 4931);
pub const __LDBL_MIN_EXP__ = -@as(c_int, 16381);
pub const __LDBL_MIN__ = @as(c_longdouble, 3.36210314311209350626e-4932);
pub const __POINTER_WIDTH__ = @as(c_int, 64);
pub const __BIGGEST_ALIGNMENT__ = @as(c_int, 16);
pub const __WINT_UNSIGNED__ = @as(c_int, 1);
pub const __INT8_TYPE__ = i8;
pub const __INT8_FMTd__ = "hhd";
pub const __INT8_FMTi__ = "hhi";
pub const __INT8_C_SUFFIX__ = "";
pub const __INT16_TYPE__ = c_short;
pub const __INT16_FMTd__ = "hd";
pub const __INT16_FMTi__ = "hi";
pub const __INT16_C_SUFFIX__ = "";
pub const __INT32_TYPE__ = c_int;
pub const __INT32_FMTd__ = "d";
pub const __INT32_FMTi__ = "i";
pub const __INT32_C_SUFFIX__ = "";
pub const __INT64_TYPE__ = c_long;
pub const __INT64_FMTd__ = "ld";
pub const __INT64_FMTi__ = "li";
pub const __INT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `L`");
// (no file):202:9
pub const __UINT8_TYPE__ = u8;
pub const __UINT8_FMTo__ = "hho";
pub const __UINT8_FMTu__ = "hhu";
pub const __UINT8_FMTx__ = "hhx";
pub const __UINT8_FMTX__ = "hhX";
pub const __UINT8_C_SUFFIX__ = "";
pub const __UINT8_MAX__ = @as(c_int, 255);
pub const __INT8_MAX__ = @as(c_int, 127);
pub const __UINT16_TYPE__ = c_ushort;
pub const __UINT16_FMTo__ = "ho";
pub const __UINT16_FMTu__ = "hu";
pub const __UINT16_FMTx__ = "hx";
pub const __UINT16_FMTX__ = "hX";
pub const __UINT16_C_SUFFIX__ = "";
pub const __UINT16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __INT16_MAX__ = @as(c_int, 32767);
pub const __UINT32_TYPE__ = c_uint;
pub const __UINT32_FMTo__ = "o";
pub const __UINT32_FMTu__ = "u";
pub const __UINT32_FMTx__ = "x";
pub const __UINT32_FMTX__ = "X";
pub const __UINT32_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `U`");
// (no file):224:9
pub const __UINT32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __INT32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __UINT64_TYPE__ = c_ulong;
pub const __UINT64_FMTo__ = "lo";
pub const __UINT64_FMTu__ = "lu";
pub const __UINT64_FMTx__ = "lx";
pub const __UINT64_FMTX__ = "lX";
pub const __UINT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `UL`");
// (no file):232:9
pub const __UINT64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __INT64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INT_LEAST8_TYPE__ = i8;
pub const __INT_LEAST8_MAX__ = @as(c_int, 127);
pub const __INT_LEAST8_WIDTH__ = @as(c_int, 8);
pub const __INT_LEAST8_FMTd__ = "hhd";
pub const __INT_LEAST8_FMTi__ = "hhi";
pub const __UINT_LEAST8_TYPE__ = u8;
pub const __UINT_LEAST8_MAX__ = @as(c_int, 255);
pub const __UINT_LEAST8_FMTo__ = "hho";
pub const __UINT_LEAST8_FMTu__ = "hhu";
pub const __UINT_LEAST8_FMTx__ = "hhx";
pub const __UINT_LEAST8_FMTX__ = "hhX";
pub const __INT_LEAST16_TYPE__ = c_short;
pub const __INT_LEAST16_MAX__ = @as(c_int, 32767);
pub const __INT_LEAST16_WIDTH__ = @as(c_int, 16);
pub const __INT_LEAST16_FMTd__ = "hd";
pub const __INT_LEAST16_FMTi__ = "hi";
pub const __UINT_LEAST16_TYPE__ = c_ushort;
pub const __UINT_LEAST16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __UINT_LEAST16_FMTo__ = "ho";
pub const __UINT_LEAST16_FMTu__ = "hu";
pub const __UINT_LEAST16_FMTx__ = "hx";
pub const __UINT_LEAST16_FMTX__ = "hX";
pub const __INT_LEAST32_TYPE__ = c_int;
pub const __INT_LEAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_LEAST32_WIDTH__ = @as(c_int, 32);
pub const __INT_LEAST32_FMTd__ = "d";
pub const __INT_LEAST32_FMTi__ = "i";
pub const __UINT_LEAST32_TYPE__ = c_uint;
pub const __UINT_LEAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __UINT_LEAST32_FMTo__ = "o";
pub const __UINT_LEAST32_FMTu__ = "u";
pub const __UINT_LEAST32_FMTx__ = "x";
pub const __UINT_LEAST32_FMTX__ = "X";
pub const __INT_LEAST64_TYPE__ = c_long;
pub const __INT_LEAST64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INT_LEAST64_WIDTH__ = @as(c_int, 64);
pub const __INT_LEAST64_FMTd__ = "ld";
pub const __INT_LEAST64_FMTi__ = "li";
pub const __UINT_LEAST64_TYPE__ = c_ulong;
pub const __UINT_LEAST64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINT_LEAST64_FMTo__ = "lo";
pub const __UINT_LEAST64_FMTu__ = "lu";
pub const __UINT_LEAST64_FMTx__ = "lx";
pub const __UINT_LEAST64_FMTX__ = "lX";
pub const __INT_FAST8_TYPE__ = i8;
pub const __INT_FAST8_MAX__ = @as(c_int, 127);
pub const __INT_FAST8_WIDTH__ = @as(c_int, 8);
pub const __INT_FAST8_FMTd__ = "hhd";
pub const __INT_FAST8_FMTi__ = "hhi";
pub const __UINT_FAST8_TYPE__ = u8;
pub const __UINT_FAST8_MAX__ = @as(c_int, 255);
pub const __UINT_FAST8_FMTo__ = "hho";
pub const __UINT_FAST8_FMTu__ = "hhu";
pub const __UINT_FAST8_FMTx__ = "hhx";
pub const __UINT_FAST8_FMTX__ = "hhX";
pub const __INT_FAST16_TYPE__ = c_short;
pub const __INT_FAST16_MAX__ = @as(c_int, 32767);
pub const __INT_FAST16_WIDTH__ = @as(c_int, 16);
pub const __INT_FAST16_FMTd__ = "hd";
pub const __INT_FAST16_FMTi__ = "hi";
pub const __UINT_FAST16_TYPE__ = c_ushort;
pub const __UINT_FAST16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __UINT_FAST16_FMTo__ = "ho";
pub const __UINT_FAST16_FMTu__ = "hu";
pub const __UINT_FAST16_FMTx__ = "hx";
pub const __UINT_FAST16_FMTX__ = "hX";
pub const __INT_FAST32_TYPE__ = c_int;
pub const __INT_FAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_FAST32_WIDTH__ = @as(c_int, 32);
pub const __INT_FAST32_FMTd__ = "d";
pub const __INT_FAST32_FMTi__ = "i";
pub const __UINT_FAST32_TYPE__ = c_uint;
pub const __UINT_FAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __UINT_FAST32_FMTo__ = "o";
pub const __UINT_FAST32_FMTu__ = "u";
pub const __UINT_FAST32_FMTx__ = "x";
pub const __UINT_FAST32_FMTX__ = "X";
pub const __INT_FAST64_TYPE__ = c_long;
pub const __INT_FAST64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INT_FAST64_WIDTH__ = @as(c_int, 64);
pub const __INT_FAST64_FMTd__ = "ld";
pub const __INT_FAST64_FMTi__ = "li";
pub const __UINT_FAST64_TYPE__ = c_ulong;
pub const __UINT_FAST64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINT_FAST64_FMTo__ = "lo";
pub const __UINT_FAST64_FMTu__ = "lu";
pub const __UINT_FAST64_FMTx__ = "lx";
pub const __UINT_FAST64_FMTX__ = "lX";
pub const __USER_LABEL_PREFIX__ = "";
pub const __FINITE_MATH_ONLY__ = @as(c_int, 0);
pub const __GNUC_STDC_INLINE__ = @as(c_int, 1);
pub const __GCC_ATOMIC_TEST_AND_SET_TRUEVAL = @as(c_int, 1);
pub const __GCC_DESTRUCTIVE_SIZE = @as(c_int, 64);
pub const __GCC_CONSTRUCTIVE_SIZE = @as(c_int, 64);
pub const __CLANG_ATOMIC_BOOL_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR16_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR32_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_WCHAR_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_SHORT_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_INT_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_LONG_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_LLONG_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_POINTER_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_BOOL_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR16_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR32_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_WCHAR_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_SHORT_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_INT_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_LONG_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_LLONG_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_POINTER_LOCK_FREE = @as(c_int, 2);
pub const __NO_INLINE__ = @as(c_int, 1);
pub const __PIC__ = @as(c_int, 2);
pub const __pic__ = @as(c_int, 2);
pub const __FLT_RADIX__ = @as(c_int, 2);
pub const __DECIMAL_DIG__ = __LDBL_DECIMAL_DIG__;
pub const __SSP_STRONG__ = @as(c_int, 2);
pub const __ELF__ = @as(c_int, 1);
pub const __GCC_ASM_FLAG_OUTPUTS__ = @as(c_int, 1);
pub const __code_model_small__ = @as(c_int, 1);
pub const __amd64__ = @as(c_int, 1);
pub const __amd64 = @as(c_int, 1);
pub const __x86_64 = @as(c_int, 1);
pub const __x86_64__ = @as(c_int, 1);
pub const __SEG_GS = @as(c_int, 1);
pub const __SEG_FS = @as(c_int, 1);
pub const __seg_gs = @compileError("unable to translate macro: undefined identifier `address_space`");
// (no file):366:9
pub const __seg_fs = @compileError("unable to translate macro: undefined identifier `address_space`");
// (no file):367:9
pub const __znver5 = @as(c_int, 1);
pub const __znver5__ = @as(c_int, 1);
pub const __tune_znver5__ = @as(c_int, 1);
pub const __REGISTER_PREFIX__ = "";
pub const __NO_MATH_INLINES = @as(c_int, 1);
pub const __AES__ = @as(c_int, 1);
pub const __VAES__ = @as(c_int, 1);
pub const __PCLMUL__ = @as(c_int, 1);
pub const __VPCLMULQDQ__ = @as(c_int, 1);
pub const __LAHF_SAHF__ = @as(c_int, 1);
pub const __LZCNT__ = @as(c_int, 1);
pub const __RDRND__ = @as(c_int, 1);
pub const __FSGSBASE__ = @as(c_int, 1);
pub const __BMI__ = @as(c_int, 1);
pub const __BMI2__ = @as(c_int, 1);
pub const __POPCNT__ = @as(c_int, 1);
pub const __PRFCHW__ = @as(c_int, 1);
pub const __RDSEED__ = @as(c_int, 1);
pub const __ADX__ = @as(c_int, 1);
pub const __MWAITX__ = @as(c_int, 1);
pub const __MOVBE__ = @as(c_int, 1);
pub const __SSE4A__ = @as(c_int, 1);
pub const __FMA__ = @as(c_int, 1);
pub const __F16C__ = @as(c_int, 1);
pub const __GFNI__ = @as(c_int, 1);
pub const __EVEX512__ = @as(c_int, 1);
pub const __AVX512CD__ = @as(c_int, 1);
pub const __AVX512VPOPCNTDQ__ = @as(c_int, 1);
pub const __AVX512VNNI__ = @as(c_int, 1);
pub const __AVX512BF16__ = @as(c_int, 1);
pub const __AVX512DQ__ = @as(c_int, 1);
pub const __AVX512BITALG__ = @as(c_int, 1);
pub const __AVX512BW__ = @as(c_int, 1);
pub const __AVX512VL__ = @as(c_int, 1);
pub const __EVEX256__ = @as(c_int, 1);
pub const __AVX512VBMI__ = @as(c_int, 1);
pub const __AVX512VBMI2__ = @as(c_int, 1);
pub const __AVX512IFMA__ = @as(c_int, 1);
pub const __AVX512VP2INTERSECT__ = @as(c_int, 1);
pub const __SHA__ = @as(c_int, 1);
pub const __FXSR__ = @as(c_int, 1);
pub const __XSAVE__ = @as(c_int, 1);
pub const __XSAVEOPT__ = @as(c_int, 1);
pub const __XSAVEC__ = @as(c_int, 1);
pub const __XSAVES__ = @as(c_int, 1);
pub const __PKU__ = @as(c_int, 1);
pub const __CLFLUSHOPT__ = @as(c_int, 1);
pub const __CLWB__ = @as(c_int, 1);
pub const __WBNOINVD__ = @as(c_int, 1);
pub const __SHSTK__ = @as(c_int, 1);
pub const __CLZERO__ = @as(c_int, 1);
pub const __RDPID__ = @as(c_int, 1);
pub const __RDPRU__ = @as(c_int, 1);
pub const __MOVDIRI__ = @as(c_int, 1);
pub const __MOVDIR64B__ = @as(c_int, 1);
pub const __INVPCID__ = @as(c_int, 1);
pub const __AVXVNNI__ = @as(c_int, 1);
pub const __CRC32__ = @as(c_int, 1);
pub const __AVX512F__ = @as(c_int, 1);
pub const __AVX2__ = @as(c_int, 1);
pub const __AVX__ = @as(c_int, 1);
pub const __SSE4_2__ = @as(c_int, 1);
pub const __SSE4_1__ = @as(c_int, 1);
pub const __SSSE3__ = @as(c_int, 1);
pub const __SSE3__ = @as(c_int, 1);
pub const __SSE2__ = @as(c_int, 1);
pub const __SSE2_MATH__ = @as(c_int, 1);
pub const __SSE__ = @as(c_int, 1);
pub const __SSE_MATH__ = @as(c_int, 1);
pub const __MMX__ = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_16 = @as(c_int, 1);
pub const __SIZEOF_FLOAT128__ = @as(c_int, 16);
pub const unix = @as(c_int, 1);
pub const __unix = @as(c_int, 1);
pub const __unix__ = @as(c_int, 1);
pub const linux = @as(c_int, 1);
pub const __linux = @as(c_int, 1);
pub const __linux__ = @as(c_int, 1);
pub const __gnu_linux__ = @as(c_int, 1);
pub const __FLOAT128__ = @as(c_int, 1);
pub const __STDC__ = @as(c_int, 1);
pub const __STDC_HOSTED__ = @as(c_int, 1);
pub const __STDC_VERSION__ = @as(c_long, 201710);
pub const __STDC_UTF_16__ = @as(c_int, 1);
pub const __STDC_UTF_32__ = @as(c_int, 1);
pub const __STDC_EMBED_NOT_FOUND__ = @as(c_int, 0);
pub const __STDC_EMBED_FOUND__ = @as(c_int, 1);
pub const __STDC_EMBED_EMPTY__ = @as(c_int, 2);
pub const _DEBUG = @as(c_int, 1);
pub const __GLIBC_MINOR__ = @as(c_int, 42);
pub const _LIBCPP_DISABLE_VISIBILITY_ANNOTATIONS = @as(c_int, 1);
pub const _LIBCPP_HAS_NO_VENDOR_AVAILABILITY_ANNOTATIONS = @as(c_int, 1);
pub const _LIBCXXABI_DISABLE_VISIBILITY_ANNOTATIONS = @as(c_int, 1);
pub const _LIBCPP_PSTL_BACKEND_SERIAL = @as(c_int, 1);
pub const _LIBCPP_ABI_VERSION = @as(c_int, 1);
pub const _LIBCPP_ABI_NAMESPACE = @compileError("unable to translate macro: undefined identifier `__1`");
// (no file):468:9
pub const _LIBCPP_HARDENING_MODE = @compileError("unable to translate macro: undefined identifier `_LIBCPP_HARDENING_MODE_DEBUG`");
// (no file):469:9
pub const __GCC_HAVE_DWARF2_CFI_ASM = @as(c_int, 1);
pub const WHISPER_H = "";
pub const GGML_API = @compileError("unable to translate C expr: unexpected token 'extern'");
// /home/swiecki/Coding/omawisp/omawisp/third_party/whisper.cpp/ggml/include/ggml.h:187:13
pub const GGML_DEPRECATED = @compileError("unable to translate macro: undefined identifier `deprecated`");
// /home/swiecki/Coding/omawisp/omawisp/third_party/whisper.cpp/ggml/include/ggml.h:192:13
pub const GGML_ATTRIBUTE_FORMAT = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/swiecki/Coding/omawisp/omawisp/third_party/whisper.cpp/ggml/include/ggml.h:204:13
pub const _LIBCPP_STDBOOL_H = "";
pub const _LIBCPP___CONFIG = "";
pub const _LIBCPP___CONFIGURATION_ABI_H = "";
pub const _LIBCPP___CONFIGURATION_COMPILER_H = "";
pub const _LIBCPP_COMPILER_CLANG_BASED = "";
pub const _LIBCPP_CLANG_VER = (__clang_major__ * @as(c_int, 100)) + __clang_minor__;
pub const _LIBCPP___CONFIGURATION_PLATFORM_H = "";
pub const _LIBCPP_OBJECT_FORMAT_ELF = @as(c_int, 1);
pub const _FEATURES_H = @as(c_int, 1);
pub const __KERNEL_STRICT_NAMES = "";
pub inline fn __GNUC_PREREQ(maj: anytype, min: anytype) @TypeOf(((__GNUC__ << @as(c_int, 16)) + __GNUC_MINOR__) >= ((maj << @as(c_int, 16)) + min)) {
    _ = &maj;
    _ = &min;
    return ((__GNUC__ << @as(c_int, 16)) + __GNUC_MINOR__) >= ((maj << @as(c_int, 16)) + min);
}
pub inline fn __glibc_clang_prereq(maj: anytype, min: anytype) @TypeOf(((__clang_major__ << @as(c_int, 16)) + __clang_minor__) >= ((maj << @as(c_int, 16)) + min)) {
    _ = &maj;
    _ = &min;
    return ((__clang_major__ << @as(c_int, 16)) + __clang_minor__) >= ((maj << @as(c_int, 16)) + min);
}
pub const __GLIBC_USE = @compileError("unable to translate macro: undefined identifier `__GLIBC_USE_`");
// /usr/include/features.h:191:9
pub const _DEFAULT_SOURCE = @as(c_int, 1);
pub const __GLIBC_USE_ISOC2Y = @as(c_int, 0);
pub const __GLIBC_USE_ISOC23 = @as(c_int, 0);
pub const __USE_ISOC11 = @as(c_int, 1);
pub const __USE_ISOC99 = @as(c_int, 1);
pub const __USE_ISOC95 = @as(c_int, 1);
pub const __USE_POSIX_IMPLICITLY = @as(c_int, 1);
pub const _POSIX_SOURCE = @as(c_int, 1);
pub const _POSIX_C_SOURCE = @as(c_long, 200809);
pub const __USE_POSIX = @as(c_int, 1);
pub const __USE_POSIX2 = @as(c_int, 1);
pub const __USE_POSIX199309 = @as(c_int, 1);
pub const __USE_POSIX199506 = @as(c_int, 1);
pub const __USE_XOPEN2K = @as(c_int, 1);
pub const __USE_XOPEN2K8 = @as(c_int, 1);
pub const _ATFILE_SOURCE = @as(c_int, 1);
pub const __WORDSIZE = @as(c_int, 64);
pub const __WORDSIZE_TIME64_COMPAT32 = @as(c_int, 1);
pub const __SYSCALL_WORDSIZE = @as(c_int, 64);
pub const __TIMESIZE = __WORDSIZE;
pub const __USE_TIME_BITS64 = @as(c_int, 1);
pub const __USE_MISC = @as(c_int, 1);
pub const __USE_ATFILE = @as(c_int, 1);
pub const __USE_FORTIFY_LEVEL = @as(c_int, 0);
pub const __GLIBC_USE_DEPRECATED_GETS = @as(c_int, 0);
pub const __GLIBC_USE_DEPRECATED_SCANF = @as(c_int, 0);
pub const __GLIBC_USE_C23_STRTOL = @as(c_int, 0);
pub const _STDC_PREDEF_H = @as(c_int, 1);
pub const __STDC_IEC_559__ = @as(c_int, 1);
pub const __STDC_IEC_60559_BFP__ = @as(c_long, 201404);
pub const __STDC_IEC_559_COMPLEX__ = @as(c_int, 1);
pub const __STDC_IEC_60559_COMPLEX__ = @as(c_long, 201404);
pub const __STDC_ISO_10646__ = @as(c_long, 201706);
pub const __GNU_LIBRARY__ = @as(c_int, 6);
pub const __GLIBC__ = @as(c_int, 2);
pub inline fn __GLIBC_PREREQ(maj: anytype, min: anytype) @TypeOf(((__GLIBC__ << @as(c_int, 16)) + __GLIBC_MINOR__) >= ((maj << @as(c_int, 16)) + min)) {
    _ = &maj;
    _ = &min;
    return ((__GLIBC__ << @as(c_int, 16)) + __GLIBC_MINOR__) >= ((maj << @as(c_int, 16)) + min);
}
pub const _SYS_CDEFS_H = @as(c_int, 1);
pub const __glibc_has_attribute = @compileError("unable to translate macro: undefined identifier `__has_attribute`");
// /usr/include/sys/cdefs.h:45:10
pub inline fn __glibc_has_builtin(name: anytype) @TypeOf(__has_builtin(name)) {
    _ = &name;
    return __has_builtin(name);
}
pub const __glibc_has_extension = @compileError("unable to translate macro: undefined identifier `__has_extension`");
// /usr/include/sys/cdefs.h:55:10
pub const __LEAF = "";
pub const __LEAF_ATTR = "";
pub const __THROW = @compileError("unable to translate macro: undefined identifier `__nothrow__`");
// /usr/include/sys/cdefs.h:79:11
pub const __THROWNL = @compileError("unable to translate macro: undefined identifier `__nothrow__`");
// /usr/include/sys/cdefs.h:80:11
pub const __NTH = @compileError("unable to translate macro: undefined identifier `__nothrow__`");
// /usr/include/sys/cdefs.h:81:11
pub const __NTHNL = @compileError("unable to translate macro: undefined identifier `__nothrow__`");
// /usr/include/sys/cdefs.h:82:11
pub const __COLD = @compileError("unable to translate macro: undefined identifier `__cold__`");
// /usr/include/sys/cdefs.h:102:11
pub inline fn __P(args: anytype) @TypeOf(args) {
    _ = &args;
    return args;
}
pub inline fn __PMT(args: anytype) @TypeOf(args) {
    _ = &args;
    return args;
}
pub const __CONCAT = @compileError("unable to translate C expr: unexpected token '##'");
// /usr/include/sys/cdefs.h:131:9
pub const __STRING = @compileError("unable to translate C expr: unexpected token '#'");
// /usr/include/sys/cdefs.h:132:9
pub const __ptr_t = ?*anyopaque;
pub const __BEGIN_DECLS = "";
pub const __END_DECLS = "";
pub const __attribute_overloadable__ = @compileError("unable to translate macro: undefined identifier `__overloadable__`");
// /usr/include/sys/cdefs.h:151:10
pub inline fn __bos(ptr: anytype) @TypeOf(__builtin_object_size(ptr, __USE_FORTIFY_LEVEL > @as(c_int, 1))) {
    _ = &ptr;
    return __builtin_object_size(ptr, __USE_FORTIFY_LEVEL > @as(c_int, 1));
}
pub inline fn __bos0(ptr: anytype) @TypeOf(__builtin_object_size(ptr, @as(c_int, 0))) {
    _ = &ptr;
    return __builtin_object_size(ptr, @as(c_int, 0));
}
pub inline fn __glibc_objsize0(__o: anytype) @TypeOf(__bos0(__o)) {
    _ = &__o;
    return __bos0(__o);
}
pub inline fn __glibc_objsize(__o: anytype) @TypeOf(__bos(__o)) {
    _ = &__o;
    return __bos(__o);
}
pub const __warnattr = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/sys/cdefs.h:370:10
pub const __errordecl = @compileError("unable to translate C expr: unexpected token 'extern'");
// /usr/include/sys/cdefs.h:371:10
pub const __flexarr = @compileError("unable to translate C expr: unexpected token '['");
// /usr/include/sys/cdefs.h:379:10
pub const __glibc_c99_flexarr_available = @as(c_int, 1);
pub const __REDIRECT = @compileError("unable to translate C expr: unexpected token '__asm__'");
// /usr/include/sys/cdefs.h:410:10
pub const __REDIRECT_NTH = @compileError("unable to translate C expr: unexpected token '__asm__'");
// /usr/include/sys/cdefs.h:417:11
pub const __REDIRECT_NTHNL = @compileError("unable to translate C expr: unexpected token '__asm__'");
// /usr/include/sys/cdefs.h:419:11
pub const __ASMNAME = @compileError("unable to translate C expr: unexpected token ','");
// /usr/include/sys/cdefs.h:422:10
pub inline fn __ASMNAME2(prefix: anytype, cname: anytype) @TypeOf(__STRING(prefix) ++ cname) {
    _ = &prefix;
    _ = &cname;
    return __STRING(prefix) ++ cname;
}
pub const __REDIRECT_FORTIFY = __REDIRECT;
pub const __REDIRECT_FORTIFY_NTH = __REDIRECT_NTH;
pub const __attribute_malloc__ = @compileError("unable to translate macro: undefined identifier `__malloc__`");
// /usr/include/sys/cdefs.h:452:10
pub const __attribute_alloc_size__ = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/sys/cdefs.h:463:10
pub const __attribute_alloc_align__ = @compileError("unable to translate macro: undefined identifier `__alloc_align__`");
// /usr/include/sys/cdefs.h:469:10
pub const __attribute_pure__ = @compileError("unable to translate macro: undefined identifier `__pure__`");
// /usr/include/sys/cdefs.h:479:10
pub const __attribute_const__ = @compileError("unable to translate C expr: unexpected token '__attribute__'");
// /usr/include/sys/cdefs.h:486:10
pub const __attribute_maybe_unused__ = @compileError("unable to translate macro: undefined identifier `__unused__`");
// /usr/include/sys/cdefs.h:492:10
pub const __attribute_used__ = @compileError("unable to translate macro: undefined identifier `__used__`");
// /usr/include/sys/cdefs.h:501:10
pub const __attribute_noinline__ = @compileError("unable to translate macro: undefined identifier `__noinline__`");
// /usr/include/sys/cdefs.h:502:10
pub const __attribute_deprecated__ = @compileError("unable to translate macro: undefined identifier `__deprecated__`");
// /usr/include/sys/cdefs.h:510:10
pub const __attribute_deprecated_msg__ = @compileError("unable to translate macro: undefined identifier `__deprecated__`");
// /usr/include/sys/cdefs.h:520:10
pub const __attribute_format_arg__ = @compileError("unable to translate macro: undefined identifier `__format_arg__`");
// /usr/include/sys/cdefs.h:533:10
pub const __attribute_format_strfmon__ = @compileError("unable to translate macro: undefined identifier `__format__`");
// /usr/include/sys/cdefs.h:543:10
pub const __attribute_nonnull__ = @compileError("unable to translate macro: undefined identifier `__nonnull__`");
// /usr/include/sys/cdefs.h:555:11
pub inline fn __nonnull(params: anytype) @TypeOf(__attribute_nonnull__(params)) {
    _ = &params;
    return __attribute_nonnull__(params);
}
pub const __returns_nonnull = @compileError("unable to translate macro: undefined identifier `__returns_nonnull__`");
// /usr/include/sys/cdefs.h:568:10
pub const __attribute_warn_unused_result__ = @compileError("unable to translate macro: undefined identifier `__warn_unused_result__`");
// /usr/include/sys/cdefs.h:577:10
pub const __wur = "";
pub const __always_inline = @compileError("unable to translate macro: undefined identifier `__always_inline__`");
// /usr/include/sys/cdefs.h:595:10
pub const __attribute_artificial__ = @compileError("unable to translate macro: undefined identifier `__artificial__`");
// /usr/include/sys/cdefs.h:604:10
pub const __extern_inline = @compileError("unable to translate macro: undefined identifier `__gnu_inline__`");
// /usr/include/sys/cdefs.h:622:11
pub const __extern_always_inline = @compileError("unable to translate macro: undefined identifier `__gnu_inline__`");
// /usr/include/sys/cdefs.h:623:11
pub const __fortify_function = __extern_always_inline ++ __attribute_artificial__;
pub const __restrict_arr = @compileError("unable to translate C expr: unexpected token '__restrict'");
// /usr/include/sys/cdefs.h:666:10
pub inline fn __glibc_unlikely(cond: anytype) @TypeOf(__builtin_expect(cond, @as(c_int, 0))) {
    _ = &cond;
    return __builtin_expect(cond, @as(c_int, 0));
}
pub inline fn __glibc_likely(cond: anytype) @TypeOf(__builtin_expect(cond, @as(c_int, 1))) {
    _ = &cond;
    return __builtin_expect(cond, @as(c_int, 1));
}
pub const __attribute_nonstring__ = "";
pub const __attribute_copy__ = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/sys/cdefs.h:715:10
pub const __LDOUBLE_REDIRECTS_TO_FLOAT128_ABI = @as(c_int, 0);
pub inline fn __LDBL_REDIR1(name: anytype, proto: anytype, alias: anytype) @TypeOf(name ++ proto) {
    _ = &name;
    _ = &proto;
    _ = &alias;
    return name ++ proto;
}
pub inline fn __LDBL_REDIR(name: anytype, proto: anytype) @TypeOf(name ++ proto) {
    _ = &name;
    _ = &proto;
    return name ++ proto;
}
pub inline fn __LDBL_REDIR1_NTH(name: anytype, proto: anytype, alias: anytype) @TypeOf(name ++ proto ++ __THROW) {
    _ = &name;
    _ = &proto;
    _ = &alias;
    return name ++ proto ++ __THROW;
}
pub inline fn __LDBL_REDIR_NTH(name: anytype, proto: anytype) @TypeOf(name ++ proto ++ __THROW) {
    _ = &name;
    _ = &proto;
    return name ++ proto ++ __THROW;
}
pub const __LDBL_REDIR2_DECL = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/sys/cdefs.h:792:10
pub const __LDBL_REDIR_DECL = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/sys/cdefs.h:793:10
pub inline fn __REDIRECT_LDBL(name: anytype, proto: anytype, alias: anytype) @TypeOf(__REDIRECT(name, proto, alias)) {
    _ = &name;
    _ = &proto;
    _ = &alias;
    return __REDIRECT(name, proto, alias);
}
pub inline fn __REDIRECT_NTH_LDBL(name: anytype, proto: anytype, alias: anytype) @TypeOf(__REDIRECT_NTH(name, proto, alias)) {
    _ = &name;
    _ = &proto;
    _ = &alias;
    return __REDIRECT_NTH(name, proto, alias);
}
pub const __glibc_macro_warning1 = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /usr/include/sys/cdefs.h:807:10
pub const __glibc_macro_warning = @compileError("unable to translate macro: undefined identifier `GCC`");
// /usr/include/sys/cdefs.h:808:10
pub const __HAVE_GENERIC_SELECTION = @as(c_int, 1);
pub const __fortified_attr_access = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/sys/cdefs.h:853:11
pub const __attr_access = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/sys/cdefs.h:854:11
pub const __attr_access_none = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/sys/cdefs.h:855:11
pub const __attr_dealloc = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/sys/cdefs.h:865:10
pub const __attr_dealloc_free = "";
pub const __attribute_returns_twice__ = @compileError("unable to translate macro: undefined identifier `__returns_twice__`");
// /usr/include/sys/cdefs.h:872:10
pub const __attribute_struct_may_alias__ = @compileError("unable to translate macro: undefined identifier `__may_alias__`");
// /usr/include/sys/cdefs.h:881:10
pub const __stub___compat_bdflush = "";
pub const __stub_chflags = "";
pub const __stub_fchflags = "";
pub const __stub_gtty = "";
pub const __stub_revoke = "";
pub const __stub_setlogin = "";
pub const __stub_sigreturn = "";
pub const __stub_stty = "";
pub inline fn _LIBCPP_GLIBC_PREREQ(a: anytype, b: anytype) @TypeOf(__GLIBC_PREREQ(a, b)) {
    _ = &a;
    _ = &b;
    return __GLIBC_PREREQ(a, b);
}
pub const _LIBCPP_LITTLE_ENDIAN = "";
pub const _LIBCPP_DEPRECATED_ABI_LEGACY_LIBRARY_DEFINITIONS_FOR_INLINE_FUNCTIONS = "";
pub const _LIBCPP_ABI_LLVM18_NO_UNIQUE_ADDRESS = @compileError("unable to translate macro: undefined identifier `__abi_tag__`");
// /usr/lib/zig/libcxx/include/__configuration/abi.h:132:9
pub const _LIBCPP___CONFIGURATION_AVAILABILITY_H = "";
pub const _LIBCPP___CONFIGURATION_LANGUAGE_H = "";
pub const _LIBCPP_HAS_NO_RTTI = "";
pub const _LIBCPP_HAS_NO_EXCEPTIONS = "";
pub const _LIBCPP_INTRODUCED_IN_LLVM_19 = @as(c_int, 1);
pub const _LIBCPP_INTRODUCED_IN_LLVM_19_ATTRIBUTE = "";
pub const _LIBCPP_INTRODUCED_IN_LLVM_18 = @as(c_int, 1);
pub const _LIBCPP_INTRODUCED_IN_LLVM_18_ATTRIBUTE = "";
pub const _LIBCPP_INTRODUCED_IN_LLVM_17 = @as(c_int, 1);
pub const _LIBCPP_INTRODUCED_IN_LLVM_17_ATTRIBUTE = "";
pub const _LIBCPP_INTRODUCED_IN_LLVM_16 = @as(c_int, 1);
pub const _LIBCPP_INTRODUCED_IN_LLVM_16_ATTRIBUTE = "";
pub const _LIBCPP_INTRODUCED_IN_LLVM_15 = @as(c_int, 1);
pub const _LIBCPP_INTRODUCED_IN_LLVM_15_ATTRIBUTE = "";
pub const _LIBCPP_INTRODUCED_IN_LLVM_14 = @as(c_int, 1);
pub const _LIBCPP_INTRODUCED_IN_LLVM_14_ATTRIBUTE = "";
pub const _LIBCPP_INTRODUCED_IN_LLVM_13 = @as(c_int, 1);
pub const _LIBCPP_INTRODUCED_IN_LLVM_13_ATTRIBUTE = "";
pub const _LIBCPP_INTRODUCED_IN_LLVM_12 = @as(c_int, 1);
pub const _LIBCPP_INTRODUCED_IN_LLVM_12_ATTRIBUTE = "";
pub const _LIBCPP_INTRODUCED_IN_LLVM_11 = @as(c_int, 1);
pub const _LIBCPP_INTRODUCED_IN_LLVM_11_ATTRIBUTE = "";
pub const _LIBCPP_INTRODUCED_IN_LLVM_10 = @as(c_int, 1);
pub const _LIBCPP_INTRODUCED_IN_LLVM_10_ATTRIBUTE = "";
pub const _LIBCPP_INTRODUCED_IN_LLVM_9 = @as(c_int, 1);
pub const _LIBCPP_INTRODUCED_IN_LLVM_9_ATTRIBUTE = "";
pub const _LIBCPP_INTRODUCED_IN_LLVM_9_ATTRIBUTE_PUSH = "";
pub const _LIBCPP_INTRODUCED_IN_LLVM_9_ATTRIBUTE_POP = "";
pub const _LIBCPP_INTRODUCED_IN_LLVM_8 = @as(c_int, 1);
pub const _LIBCPP_INTRODUCED_IN_LLVM_8_ATTRIBUTE = "";
pub const _LIBCPP_INTRODUCED_IN_LLVM_4 = @as(c_int, 1);
pub const _LIBCPP_INTRODUCED_IN_LLVM_4_ATTRIBUTE = "";
pub const _LIBCPP_AVAILABILITY_HAS_BAD_OPTIONAL_ACCESS = _LIBCPP_INTRODUCED_IN_LLVM_4;
pub const _LIBCPP_AVAILABILITY_BAD_OPTIONAL_ACCESS = "";
pub const _LIBCPP_AVAILABILITY_HAS_BAD_VARIANT_ACCESS = _LIBCPP_INTRODUCED_IN_LLVM_4;
pub const _LIBCPP_AVAILABILITY_BAD_VARIANT_ACCESS = "";
pub const _LIBCPP_AVAILABILITY_HAS_BAD_ANY_CAST = _LIBCPP_INTRODUCED_IN_LLVM_4;
pub const _LIBCPP_AVAILABILITY_BAD_ANY_CAST = "";
pub const _LIBCPP_AVAILABILITY_HAS_FILESYSTEM_LIBRARY = _LIBCPP_INTRODUCED_IN_LLVM_9;
pub const _LIBCPP_AVAILABILITY_FILESYSTEM_LIBRARY = "";
pub const _LIBCPP_AVAILABILITY_FILESYSTEM_LIBRARY_PUSH = "";
pub const _LIBCPP_AVAILABILITY_FILESYSTEM_LIBRARY_POP = "";
pub const _LIBCPP_AVAILABILITY_HAS_SYNC = _LIBCPP_INTRODUCED_IN_LLVM_11;
pub const _LIBCPP_AVAILABILITY_SYNC = "";
pub const _LIBCPP_AVAILABILITY_HAS_ADDITIONAL_IOSTREAM_EXPLICIT_INSTANTIATIONS_1 = _LIBCPP_INTRODUCED_IN_LLVM_12;
pub const _LIBCPP_AVAILABILITY_HAS_TO_CHARS_FLOATING_POINT = _LIBCPP_INTRODUCED_IN_LLVM_14;
pub const _LIBCPP_AVAILABILITY_TO_CHARS_FLOATING_POINT = "";
pub const _LIBCPP_AVAILABILITY_HAS_VERBOSE_ABORT = _LIBCPP_INTRODUCED_IN_LLVM_15;
pub const _LIBCPP_AVAILABILITY_VERBOSE_ABORT = "";
pub const _LIBCPP_AVAILABILITY_HAS_PMR = _LIBCPP_INTRODUCED_IN_LLVM_16;
pub const _LIBCPP_AVAILABILITY_PMR = "";
pub const _LIBCPP_AVAILABILITY_HAS_INIT_PRIMARY_EXCEPTION = _LIBCPP_INTRODUCED_IN_LLVM_18;
pub const _LIBCPP_AVAILABILITY_INIT_PRIMARY_EXCEPTION = "";
pub const _LIBCPP_AVAILABILITY_HAS_PRINT = _LIBCPP_INTRODUCED_IN_LLVM_18;
pub const _LIBCPP_AVAILABILITY_PRINT = "";
pub const _LIBCPP_AVAILABILITY_HAS_TZDB = _LIBCPP_INTRODUCED_IN_LLVM_19;
pub const _LIBCPP_AVAILABILITY_TZDB = "";
pub const _LIBCPP_AVAILABILITY_HAS_BAD_FUNCTION_CALL_KEY_FUNCTION = _LIBCPP_INTRODUCED_IN_LLVM_19;
pub const _LIBCPP_AVAILABILITY_BAD_FUNCTION_CALL_KEY_FUNCTION = "";
pub const _LIBCPP_AVAILABILITY_HAS_BAD_EXPECTED_ACCESS_KEY_FUNCTION = _LIBCPP_INTRODUCED_IN_LLVM_19;
pub const _LIBCPP_AVAILABILITY_BAD_EXPECTED_ACCESS_KEY_FUNCTION = "";
pub const _LIBCPP_AVAILABILITY_THROW_BAD_ANY_CAST = "";
pub const _LIBCPP_AVAILABILITY_THROW_BAD_OPTIONAL_ACCESS = "";
pub const _LIBCPP_AVAILABILITY_THROW_BAD_VARIANT_ACCESS = "";
pub const __STDBOOL_H = "";
pub const __bool_true_false_are_defined = @as(c_int, 1);
pub const @"bool" = bool;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const __need_ptrdiff_t = "";
pub const __need_size_t = "";
pub const __need_wchar_t = "";
pub const __need_NULL = "";
pub const __need_max_align_t = "";
pub const __need_offsetof = "";
pub const __STDDEF_H = "";
pub const _PTRDIFF_T = "";
pub const _SIZE_T = "";
pub const _WCHAR_T = "";
pub const NULL = @import("std").zig.c_translation.cast(?*anyopaque, @as(c_int, 0));
pub const __CLANG_MAX_ALIGN_T_DEFINED = "";
pub const offsetof = @compileError("unable to translate C expr: unexpected token 'an identifier'");
// /usr/lib/zig/include/__stddef_offsetof.h:16:9
pub const _LIBCPP_STDDEF_H = "";
pub const _LIBCPP_STDINT_H = "";
pub const __CLANG_STDINT_H = "";
pub const _STDINT_H = @as(c_int, 1);
pub const __GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION = "";
pub const __GLIBC_USE_LIB_EXT2 = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_BFP_EXT = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_BFP_EXT_C23 = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_EXT = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_FUNCS_EXT = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_FUNCS_EXT_C23 = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_TYPES_EXT = @as(c_int, 0);
pub const _BITS_TYPES_H = @as(c_int, 1);
pub const __S16_TYPE = c_short;
pub const __U16_TYPE = c_ushort;
pub const __S32_TYPE = c_int;
pub const __U32_TYPE = c_uint;
pub const __SLONGWORD_TYPE = c_long;
pub const __ULONGWORD_TYPE = c_ulong;
pub const __SQUAD_TYPE = c_long;
pub const __UQUAD_TYPE = c_ulong;
pub const __SWORD_TYPE = c_long;
pub const __UWORD_TYPE = c_ulong;
pub const __SLONG32_TYPE = c_int;
pub const __ULONG32_TYPE = c_uint;
pub const __S64_TYPE = c_long;
pub const __U64_TYPE = c_ulong;
pub const __STD_TYPE = @compileError("unable to translate C expr: unexpected token 'typedef'");
// /usr/include/bits/types.h:137:10
pub const _BITS_TYPESIZES_H = @as(c_int, 1);
pub const __SYSCALL_SLONG_TYPE = __SLONGWORD_TYPE;
pub const __SYSCALL_ULONG_TYPE = __ULONGWORD_TYPE;
pub const __DEV_T_TYPE = __UQUAD_TYPE;
pub const __UID_T_TYPE = __U32_TYPE;
pub const __GID_T_TYPE = __U32_TYPE;
pub const __INO_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __INO64_T_TYPE = __UQUAD_TYPE;
pub const __MODE_T_TYPE = __U32_TYPE;
pub const __NLINK_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __FSWORD_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __OFF_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __OFF64_T_TYPE = __SQUAD_TYPE;
pub const __PID_T_TYPE = __S32_TYPE;
pub const __RLIM_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __RLIM64_T_TYPE = __UQUAD_TYPE;
pub const __BLKCNT_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __BLKCNT64_T_TYPE = __SQUAD_TYPE;
pub const __FSBLKCNT_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __FSBLKCNT64_T_TYPE = __UQUAD_TYPE;
pub const __FSFILCNT_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __FSFILCNT64_T_TYPE = __UQUAD_TYPE;
pub const __ID_T_TYPE = __U32_TYPE;
pub const __CLOCK_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __TIME_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __USECONDS_T_TYPE = __U32_TYPE;
pub const __SUSECONDS_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __SUSECONDS64_T_TYPE = __SQUAD_TYPE;
pub const __DADDR_T_TYPE = __S32_TYPE;
pub const __KEY_T_TYPE = __S32_TYPE;
pub const __CLOCKID_T_TYPE = __S32_TYPE;
pub const __TIMER_T_TYPE = ?*anyopaque;
pub const __BLKSIZE_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __FSID_T_TYPE = @compileError("unable to translate macro: undefined identifier `__val`");
// /usr/include/bits/typesizes.h:73:9
pub const __SSIZE_T_TYPE = __SWORD_TYPE;
pub const __CPU_MASK_TYPE = __SYSCALL_ULONG_TYPE;
pub const __OFF_T_MATCHES_OFF64_T = @as(c_int, 1);
pub const __INO_T_MATCHES_INO64_T = @as(c_int, 1);
pub const __RLIM_T_MATCHES_RLIM64_T = @as(c_int, 1);
pub const __STATFS_MATCHES_STATFS64 = @as(c_int, 1);
pub const __KERNEL_OLD_TIMEVAL_MATCHES_TIMEVAL64 = @as(c_int, 1);
pub const __FD_SETSIZE = @as(c_int, 1024);
pub const _BITS_TIME64_H = @as(c_int, 1);
pub const __TIME64_T_TYPE = __TIME_T_TYPE;
pub const _BITS_WCHAR_H = @as(c_int, 1);
pub const __WCHAR_MAX = __WCHAR_MAX__;
pub const __WCHAR_MIN = -__WCHAR_MAX - @as(c_int, 1);
pub const _BITS_STDINT_INTN_H = @as(c_int, 1);
pub const _BITS_STDINT_UINTN_H = @as(c_int, 1);
pub const _BITS_STDINT_LEAST_H = @as(c_int, 1);
pub const __intptr_t_defined = "";
pub const __INT64_C = @import("std").zig.c_translation.Macros.L_SUFFIX;
pub const __UINT64_C = @import("std").zig.c_translation.Macros.UL_SUFFIX;
pub const INT8_MIN = -@as(c_int, 128);
pub const INT16_MIN = -@as(c_int, 32767) - @as(c_int, 1);
pub const INT32_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal) - @as(c_int, 1);
pub const INT64_MIN = -__INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal)) - @as(c_int, 1);
pub const INT8_MAX = @as(c_int, 127);
pub const INT16_MAX = @as(c_int, 32767);
pub const INT32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const INT64_MAX = __INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal));
pub const UINT8_MAX = @as(c_int, 255);
pub const UINT16_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const UINT32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const UINT64_MAX = __UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 18446744073709551615, .decimal));
pub const INT_LEAST8_MIN = -@as(c_int, 128);
pub const INT_LEAST16_MIN = -@as(c_int, 32767) - @as(c_int, 1);
pub const INT_LEAST32_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal) - @as(c_int, 1);
pub const INT_LEAST64_MIN = -__INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal)) - @as(c_int, 1);
pub const INT_LEAST8_MAX = @as(c_int, 127);
pub const INT_LEAST16_MAX = @as(c_int, 32767);
pub const INT_LEAST32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const INT_LEAST64_MAX = __INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal));
pub const UINT_LEAST8_MAX = @as(c_int, 255);
pub const UINT_LEAST16_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const UINT_LEAST32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const UINT_LEAST64_MAX = __UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 18446744073709551615, .decimal));
pub const INT_FAST8_MIN = -@as(c_int, 128);
pub const INT_FAST16_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal) - @as(c_int, 1);
pub const INT_FAST32_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal) - @as(c_int, 1);
pub const INT_FAST64_MIN = -__INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal)) - @as(c_int, 1);
pub const INT_FAST8_MAX = @as(c_int, 127);
pub const INT_FAST16_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const INT_FAST32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const INT_FAST64_MAX = __INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal));
pub const UINT_FAST8_MAX = @as(c_int, 255);
pub const UINT_FAST16_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const UINT_FAST32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const UINT_FAST64_MAX = __UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 18446744073709551615, .decimal));
pub const INTPTR_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal) - @as(c_int, 1);
pub const INTPTR_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const UINTPTR_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const INTMAX_MIN = -__INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal)) - @as(c_int, 1);
pub const INTMAX_MAX = __INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal));
pub const UINTMAX_MAX = __UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 18446744073709551615, .decimal));
pub const PTRDIFF_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal) - @as(c_int, 1);
pub const PTRDIFF_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const SIG_ATOMIC_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal) - @as(c_int, 1);
pub const SIG_ATOMIC_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const SIZE_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const WCHAR_MIN = __WCHAR_MIN;
pub const WCHAR_MAX = __WCHAR_MAX;
pub const WINT_MIN = @as(c_uint, 0);
pub const WINT_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub inline fn INT8_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub inline fn INT16_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub inline fn INT32_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const INT64_C = @import("std").zig.c_translation.Macros.L_SUFFIX;
pub inline fn UINT8_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub inline fn UINT16_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const UINT32_C = @import("std").zig.c_translation.Macros.U_SUFFIX;
pub const UINT64_C = @import("std").zig.c_translation.Macros.UL_SUFFIX;
pub const INTMAX_C = @import("std").zig.c_translation.Macros.L_SUFFIX;
pub const UINTMAX_C = @import("std").zig.c_translation.Macros.UL_SUFFIX;
pub const _LIBCPP_STDIO_H = "";
pub const _STDIO_H = @as(c_int, 1);
pub const __need___va_list = "";
pub const __GNUC_VA_LIST = "";
pub const _____fpos_t_defined = @as(c_int, 1);
pub const ____mbstate_t_defined = @as(c_int, 1);
pub const _____fpos64_t_defined = @as(c_int, 1);
pub const ____FILE_defined = @as(c_int, 1);
pub const __FILE_defined = @as(c_int, 1);
pub const __struct_FILE_defined = @as(c_int, 1);
pub const __getc_unlocked_body = @compileError("TODO postfix inc/dec expr");
// /usr/include/bits/types/struct_FILE.h:113:9
pub const __putc_unlocked_body = @compileError("TODO postfix inc/dec expr");
// /usr/include/bits/types/struct_FILE.h:117:9
pub const _IO_EOF_SEEN = @as(c_int, 0x0010);
pub inline fn __feof_unlocked_body(_fp: anytype) @TypeOf((_fp.*._flags & _IO_EOF_SEEN) != @as(c_int, 0)) {
    _ = &_fp;
    return (_fp.*._flags & _IO_EOF_SEEN) != @as(c_int, 0);
}
pub const _IO_ERR_SEEN = @as(c_int, 0x0020);
pub inline fn __ferror_unlocked_body(_fp: anytype) @TypeOf((_fp.*._flags & _IO_ERR_SEEN) != @as(c_int, 0)) {
    _ = &_fp;
    return (_fp.*._flags & _IO_ERR_SEEN) != @as(c_int, 0);
}
pub const _IO_USER_LOCK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8000, .hex);
pub const __cookie_io_functions_t_defined = @as(c_int, 1);
pub const _VA_LIST_DEFINED = "";
pub const __off_t_defined = "";
pub const __ssize_t_defined = "";
pub const _IOFBF = @as(c_int, 0);
pub const _IOLBF = @as(c_int, 1);
pub const _IONBF = @as(c_int, 2);
pub const BUFSIZ = @as(c_int, 8192);
pub const EOF = -@as(c_int, 1);
pub const SEEK_SET = @as(c_int, 0);
pub const SEEK_CUR = @as(c_int, 1);
pub const SEEK_END = @as(c_int, 2);
pub const P_tmpdir = "/tmp";
pub const L_tmpnam = @as(c_int, 20);
pub const TMP_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 238328, .decimal);
pub const _BITS_STDIO_LIM_H = @as(c_int, 1);
pub const FILENAME_MAX = @as(c_int, 4096);
pub const L_ctermid = @as(c_int, 9);
pub const FOPEN_MAX = @as(c_int, 16);
pub const __attr_dealloc_fclose = __attr_dealloc(fclose, @as(c_int, 1));
pub const _BITS_FLOATN_H = "";
pub const __HAVE_FLOAT128 = @as(c_int, 1);
pub const __HAVE_DISTINCT_FLOAT128 = @as(c_int, 1);
pub const __HAVE_FLOAT64X = @as(c_int, 1);
pub const __HAVE_FLOAT64X_LONG_DOUBLE = @as(c_int, 1);
pub const __f128 = @compileError("unable to translate macro: undefined identifier `q`");
// /usr/include/bits/floatn.h:70:12
pub const __CFLOAT128 = __cfloat128;
pub const __builtin_signbitf128 = @compileError("unable to translate macro: undefined identifier `__signbitf128`");
// /usr/include/bits/floatn.h:124:12
pub const _BITS_FLOATN_COMMON_H = "";
pub const __HAVE_FLOAT16 = @as(c_int, 0);
pub const __HAVE_FLOAT32 = @as(c_int, 1);
pub const __HAVE_FLOAT64 = @as(c_int, 1);
pub const __HAVE_FLOAT32X = @as(c_int, 1);
pub const __HAVE_FLOAT128X = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT16 = __HAVE_FLOAT16;
pub const __HAVE_DISTINCT_FLOAT32 = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT64 = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT32X = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT64X = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT128X = __HAVE_FLOAT128X;
pub const __HAVE_FLOAT128_UNLIKE_LDBL = (__HAVE_DISTINCT_FLOAT128 != 0) and (__LDBL_MANT_DIG__ != @as(c_int, 113));
pub const __HAVE_FLOATN_NOT_TYPEDEF = @as(c_int, 0);
pub const __f32 = @import("std").zig.c_translation.Macros.F_SUFFIX;
pub inline fn __f64(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __f32x(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub const __f64x = @import("std").zig.c_translation.Macros.L_SUFFIX;
pub const __CFLOAT32 = @compileError("unable to translate: TODO _Complex");
// /usr/include/bits/floatn-common.h:149:12
pub const __CFLOAT64 = @compileError("unable to translate: TODO _Complex");
// /usr/include/bits/floatn-common.h:160:13
pub const __CFLOAT32X = @compileError("unable to translate: TODO _Complex");
// /usr/include/bits/floatn-common.h:169:12
pub const __CFLOAT64X = @compileError("unable to translate: TODO _Complex");
// /usr/include/bits/floatn-common.h:178:13
pub inline fn __builtin_huge_valf32() @TypeOf(__builtin_huge_valf()) {
    return __builtin_huge_valf();
}
pub inline fn __builtin_inff32() @TypeOf(__builtin_inff()) {
    return __builtin_inff();
}
pub inline fn __builtin_nanf32(x: anytype) @TypeOf(__builtin_nanf(x)) {
    _ = &x;
    return __builtin_nanf(x);
}
pub const __builtin_nansf32 = @compileError("unable to translate macro: undefined identifier `__builtin_nansf`");
// /usr/include/bits/floatn-common.h:221:12
pub const __builtin_huge_valf64 = @compileError("unable to translate macro: undefined identifier `__builtin_huge_val`");
// /usr/include/bits/floatn-common.h:255:13
pub const __builtin_inff64 = @compileError("unable to translate macro: undefined identifier `__builtin_inf`");
// /usr/include/bits/floatn-common.h:256:13
pub const __builtin_nanf64 = @compileError("unable to translate macro: undefined identifier `__builtin_nan`");
// /usr/include/bits/floatn-common.h:257:13
pub const __builtin_nansf64 = @compileError("unable to translate macro: undefined identifier `__builtin_nans`");
// /usr/include/bits/floatn-common.h:258:13
pub const __builtin_huge_valf32x = @compileError("unable to translate macro: undefined identifier `__builtin_huge_val`");
// /usr/include/bits/floatn-common.h:272:12
pub const __builtin_inff32x = @compileError("unable to translate macro: undefined identifier `__builtin_inf`");
// /usr/include/bits/floatn-common.h:273:12
pub const __builtin_nanf32x = @compileError("unable to translate macro: undefined identifier `__builtin_nan`");
// /usr/include/bits/floatn-common.h:274:12
pub const __builtin_nansf32x = @compileError("unable to translate macro: undefined identifier `__builtin_nans`");
// /usr/include/bits/floatn-common.h:275:12
pub const __builtin_huge_valf64x = @compileError("unable to translate macro: undefined identifier `__builtin_huge_vall`");
// /usr/include/bits/floatn-common.h:289:13
pub const __builtin_inff64x = @compileError("unable to translate macro: undefined identifier `__builtin_infl`");
// /usr/include/bits/floatn-common.h:290:13
pub const __builtin_nanf64x = @compileError("unable to translate macro: undefined identifier `__builtin_nanl`");
// /usr/include/bits/floatn-common.h:291:13
pub const __builtin_nansf64x = @compileError("unable to translate macro: undefined identifier `__builtin_nansl`");
// /usr/include/bits/floatn-common.h:292:13
pub const GGML_FILE_MAGIC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x67676d6c, .hex);
pub const GGML_FILE_VERSION = @as(c_int, 2);
pub const GGML_QNT_VERSION = @as(c_int, 2);
pub const GGML_QNT_VERSION_FACTOR = @as(c_int, 1000);
pub const GGML_MAX_DIMS = @as(c_int, 4);
pub const GGML_MAX_PARAMS = @as(c_int, 2048);
pub const GGML_MAX_SRC = @as(c_int, 10);
pub const GGML_MAX_N_THREADS = @as(c_int, 512);
pub const GGML_MAX_OP_PARAMS = @as(c_int, 64);
pub const GGML_MAX_NAME = @as(c_int, 64);
pub const GGML_DEFAULT_N_THREADS = @as(c_int, 4);
pub const GGML_DEFAULT_GRAPH_SIZE = @as(c_int, 2048);
pub const GGML_MEM_ALIGN = @as(c_int, 16);
pub const GGML_EXIT_SUCCESS = @as(c_int, 0);
pub const GGML_EXIT_ABORTED = @as(c_int, 1);
pub const GGML_ROPE_TYPE_NEOX = @as(c_int, 2);
pub const GGML_ROPE_TYPE_MROPE = @as(c_int, 8);
pub const GGML_ROPE_TYPE_VISION = @as(c_int, 24);
pub const GGML_MROPE_SECTIONS = @as(c_int, 4);
pub const GGML_UNUSED = @import("std").zig.c_translation.Macros.DISCARD;
pub inline fn GGML_PAD(x: anytype, n: anytype) @TypeOf(((x + n) - @as(c_int, 1)) & ~(n - @as(c_int, 1))) {
    _ = &x;
    _ = &n;
    return ((x + n) - @as(c_int, 1)) & ~(n - @as(c_int, 1));
}
pub const GGML_UNREACHABLE = @compileError("unable to translate macro: undefined identifier `abort`");
// /home/swiecki/Coding/omawisp/omawisp/third_party/whisper.cpp/ggml/include/ggml.h:251:12
pub const GGML_NORETURN = @compileError("unable to translate C expr: unexpected token '_Noreturn'");
// /home/swiecki/Coding/omawisp/omawisp/third_party/whisper.cpp/ggml/include/ggml.h:265:12
pub const GGML_ABORT = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/swiecki/Coding/omawisp/omawisp/third_party/whisper.cpp/ggml/include/ggml.h:268:9
pub const GGML_ASSERT = @compileError("unable to translate C expr: unexpected token 'if'");
// /home/swiecki/Coding/omawisp/omawisp/third_party/whisper.cpp/ggml/include/ggml.h:269:9
pub const GGML_TENSOR_LOCALS_1 = @compileError("unable to translate C expr: unexpected token 'const'");
// /home/swiecki/Coding/omawisp/omawisp/third_party/whisper.cpp/ggml/include/ggml.h:279:9
pub const GGML_TENSOR_LOCALS_2 = @compileError("unable to translate C expr: unexpected token 'const'");
// /home/swiecki/Coding/omawisp/omawisp/third_party/whisper.cpp/ggml/include/ggml.h:282:9
pub const GGML_TENSOR_LOCALS_3 = @compileError("unable to translate C expr: unexpected token 'const'");
// /home/swiecki/Coding/omawisp/omawisp/third_party/whisper.cpp/ggml/include/ggml.h:286:9
pub const GGML_TENSOR_LOCALS = @compileError("unable to translate C expr: unexpected token 'const'");
// /home/swiecki/Coding/omawisp/omawisp/third_party/whisper.cpp/ggml/include/ggml.h:290:9
pub const GGML_TENSOR_UNARY_OP_LOCALS = @compileError("unable to translate macro: undefined identifier `ne0`");
// /home/swiecki/Coding/omawisp/omawisp/third_party/whisper.cpp/ggml/include/ggml.h:295:9
pub const GGML_TENSOR_BINARY_OP_LOCALS = @compileError("unable to translate macro: undefined identifier `ne0`");
// /home/swiecki/Coding/omawisp/omawisp/third_party/whisper.cpp/ggml/include/ggml.h:301:9
pub const GGML_TENSOR_TERNARY_OP_LOCALS = @compileError("unable to translate macro: undefined identifier `ne0`");
// /home/swiecki/Coding/omawisp/omawisp/third_party/whisper.cpp/ggml/include/ggml.h:309:9
pub const GGML_TENSOR_BINARY_OP_LOCALS01 = @compileError("unable to translate macro: undefined identifier `ne0`");
// /home/swiecki/Coding/omawisp/omawisp/third_party/whisper.cpp/ggml/include/ggml.h:319:9
pub const GGML_KQ_MASK_PAD = @as(c_int, 64);
pub const GGML_N_TASKS_MAX = -@as(c_int, 1);
pub const GGML_RESTRICT = @compileError("unable to translate C expr: unexpected token 'restrict'");
// /home/swiecki/Coding/omawisp/omawisp/third_party/whisper.cpp/ggml/include/ggml.h:2415:17
pub const GGML_BACKEND_API = @compileError("unable to translate C expr: unexpected token 'extern'");
// /home/swiecki/Coding/omawisp/omawisp/third_party/whisper.cpp/ggml/include/ggml-backend.h:17:13
pub const WHISPER_DEPRECATED = @compileError("unable to translate macro: undefined identifier `deprecated`");
// /home/swiecki/Coding/omawisp/omawisp/third_party/whisper.cpp/include/whisper.h:12:13
pub const WHISPER_API = "";
pub const WHISPER_SAMPLE_RATE = @as(c_int, 16000);
pub const WHISPER_N_FFT = @as(c_int, 400);
pub const WHISPER_HOP_LENGTH = @as(c_int, 160);
pub const WHISPER_CHUNK_SIZE = @as(c_int, 30);
pub const _G_fpos_t = struct__G_fpos_t;
pub const _G_fpos64_t = struct__G_fpos64_t;
pub const _IO_marker = struct__IO_marker;
pub const _IO_FILE = struct__IO_FILE;
pub const _IO_codecvt = struct__IO_codecvt;
pub const _IO_wide_data = struct__IO_wide_data;
pub const _IO_cookie_io_functions_t = struct__IO_cookie_io_functions_t;
pub const ggml_status = enum_ggml_status;
pub const ggml_object = struct_ggml_object;
pub const ggml_context = struct_ggml_context;
pub const ggml_cgraph = struct_ggml_cgraph;
pub const ggml_type = enum_ggml_type;
pub const ggml_prec = enum_ggml_prec;
pub const ggml_ftype = enum_ggml_ftype;
pub const ggml_op = enum_ggml_op;
pub const ggml_unary_op = enum_ggml_unary_op;
pub const ggml_glu_op = enum_ggml_glu_op;
pub const ggml_object_type = enum_ggml_object_type;
pub const ggml_log_level = enum_ggml_log_level;
pub const ggml_tensor_flag = enum_ggml_tensor_flag;
pub const ggml_init_params = struct_ggml_init_params;
pub const ggml_tensor = struct_ggml_tensor;
pub const ggml_op_pool = enum_ggml_op_pool;
pub const ggml_scale_mode = enum_ggml_scale_mode;
pub const ggml_scale_flag = enum_ggml_scale_flag;
pub const ggml_sort_order = enum_ggml_sort_order;
pub const ggml_type_traits = struct_ggml_type_traits;
pub const ggml_sched_priority = enum_ggml_sched_priority;
pub const ggml_threadpool_params = struct_ggml_threadpool_params;
pub const ggml_threadpool = struct_ggml_threadpool;
pub const ggml_backend_buffer_type = struct_ggml_backend_buffer_type;
pub const ggml_backend = struct_ggml_backend;
pub const ggml_tallocr = struct_ggml_tallocr;
pub const ggml_gallocr = struct_ggml_gallocr;
pub const ggml_backend_event = struct_ggml_backend_event;
pub const ggml_backend_reg = struct_ggml_backend_reg;
pub const ggml_backend_device = struct_ggml_backend_device;
pub const ggml_backend_buffer_usage = enum_ggml_backend_buffer_usage;
pub const ggml_backend_dev_caps = struct_ggml_backend_dev_caps;
pub const ggml_backend_dev_props = struct_ggml_backend_dev_props;
pub const ggml_backend_feature = struct_ggml_backend_feature;
pub const ggml_backend_sched = struct_ggml_backend_sched;
pub const ggml_cplan = struct_ggml_cplan;
pub const ggml_numa_strategy = enum_ggml_numa_strategy;
pub const ggml_type_traits_cpu = struct_ggml_type_traits_cpu;
pub const whisper_context = struct_whisper_context;
pub const whisper_state = struct_whisper_state;
pub const whisper_sampling_strategy = enum_whisper_sampling_strategy;
pub const whisper_gretype = enum_whisper_gretype;
pub const whisper_full_params = struct_whisper_full_params;
pub const whisper_alignment_heads_preset = enum_whisper_alignment_heads_preset;
pub const whisper_context_params = struct_whisper_context_params;
pub const whisper_timings = struct_whisper_timings;
pub const whisper_vad_context = struct_whisper_vad_context;
pub const whisper_vad_context_params = struct_whisper_vad_context_params;
pub const whisper_vad_segments = struct_whisper_vad_segments;
