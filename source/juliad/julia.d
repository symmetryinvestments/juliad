


        import core.stdc.config;
        import core.stdc.stdarg: va_list;
        static import core.simd;
        static import std.conv;

        struct Int128 { long lower; long upper; }
        struct UInt128 { ulong lower; ulong upper; }

        struct __locale_data { int dummy; }



alias _Bool = bool;
struct dpp {
    static struct Opaque(int N) {
        void[N] bytes;
    }

    static bool isEmpty(T)() {
        return T.tupleof.length == 0;
    }
    static struct Move(T) {
        T* ptr;
    }


    static auto move(T)(ref T value) {
        return Move!T(&value);
    }
    mixin template EnumD(string name, T, string prefix) if(is(T == enum)) {
        private static string _memberMixinStr(string member) {
            import std.conv: text;
            import std.array: replace;
            return text(` `, member.replace(prefix, ""), ` = `, T.stringof, `.`, member, `,`);
        }
        private static string _enumMixinStr() {
            import std.array: join;
            string[] ret;
            ret ~= "enum " ~ name ~ "{";
            static foreach(member; __traits(allMembers, T)) {
                ret ~= _memberMixinStr(member);
            }
            ret ~= "}";
            return ret.join("\n");
        }
        mixin(_enumMixinStr());
    }
}

extern(C)
{
    static int _xtest() @nogc nothrow;
    static void _xsaves64(void*, ulong) @nogc nothrow;
    static void _xrstors64(void*, ulong) @nogc nothrow;
    static void _xrstors(void*, ulong) @nogc nothrow;
    static void _xsaves(void*, ulong) @nogc nothrow;
    static void _xsaveopt64(void*, ulong) @nogc nothrow;
    static void _xsaveopt(void*, ulong) @nogc nothrow;
    static void _xrstor64(void*, ulong) @nogc nothrow;
    static void _xsave64(void*, ulong) @nogc nothrow;
    static void _xrstor(void*, ulong) @nogc nothrow;
    static void _xsave(void*, ulong) @nogc nothrow;
    static void _xsavec64(void*, ulong) @nogc nothrow;
    static void _xsavec(void*, ulong) @nogc nothrow;
    static int _mm_movemask_ps(core.simd.float4) @nogc nothrow;
    static int _mm_cvtps_pi8(core.simd.float4) @nogc nothrow;
    static int _mm_cvtps_pi16(core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_cvtpi32x2_ps(int , int ) @nogc nothrow;
    static core.simd.float4 _mm_cvtpu8_ps(int ) @nogc nothrow;
    static core.simd.float4 _mm_cvtpi8_ps(int ) @nogc nothrow;
    static core.simd.float4 _mm_cvtpu16_ps(int ) @nogc nothrow;
    static core.simd.float4 _mm_cvtpi16_ps(int ) @nogc nothrow;
    static core.simd.float4 _mm_movelh_ps(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_movehl_ps(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_move_ss(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_unpacklo_ps(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_unpackhi_ps(core.simd.float4, core.simd.float4) @nogc nothrow;
    void _mm_setcsr(uint) @nogc nothrow;
    uint _mm_getcsr() @nogc nothrow;
    static int _mm_sad_pu8(int , int ) @nogc nothrow;
    static int _mm_avg_pu16(int , int ) @nogc nothrow;
    static int _mm_avg_pu8(int , int ) @nogc nothrow;
    static void _mm_maskmove_si64(int , int , char*) @nogc nothrow;
    static int _mm_mulhi_pu16(int , int ) @nogc nothrow;
    static int _mm_movemask_pi8(int ) @nogc nothrow;
    static int _mm_min_pu8(int , int ) @nogc nothrow;
    static int _mm_min_pi16(int , int ) @nogc nothrow;
    static int _mm_max_pu8(int , int ) @nogc nothrow;
    static int _mm_max_pi16(int , int ) @nogc nothrow;
    void _mm_sfence() @nogc nothrow;
    static void _mm_stream_ps(float*, core.simd.float4) @nogc nothrow;
    static void _mm_stream_pi(int *, int ) @nogc nothrow;
    static void _mm_storer_ps(float*, core.simd.float4) @nogc nothrow;
    static void _mm_store_ps1(float*, core.simd.float4) @nogc nothrow;
    static void _mm_store1_ps(float*, core.simd.float4) @nogc nothrow;
    static void _mm_store_ps(float*, core.simd.float4) @nogc nothrow;
    static void _mm_storeu_ps(float*, core.simd.float4) @nogc nothrow;
    static void _mm_store_ss(float*, core.simd.float4) @nogc nothrow;
    static void _mm_storel_pi(int *, core.simd.float4) @nogc nothrow;
    static void _mm_storeh_pi(int *, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_setzero_ps() @nogc nothrow;
    static core.simd.float4 _mm_setr_ps(float, float, float, float) @nogc nothrow;
    static core.simd.float4 _mm_set_ps(float, float, float, float) @nogc nothrow;
    static core.simd.float4 _mm_set_ps1(float) @nogc nothrow;
    static core.simd.float4 _mm_set1_ps(float) @nogc nothrow;
    static core.simd.float4 _mm_set_ss(float) @nogc nothrow;
    static core.simd.float4 _mm_undefined_ps() @nogc nothrow;
    static core.simd.float4 _mm_loadr_ps(const(float)*) @nogc nothrow;
    static core.simd.float4 _mm_loadu_ps(const(float)*) @nogc nothrow;
    static core.simd.float4 _mm_load_ps(const(float)*) @nogc nothrow;
    static core.simd.float4 _mm_load1_ps(const(float)*) @nogc nothrow;
    static core.simd.float4 _mm_load_ss(const(float)*) @nogc nothrow;
    static core.simd.float4 _mm_loadl_pi(core.simd.float4, const(int )*) @nogc nothrow;
    static core.simd.float4 _mm_loadh_pi(core.simd.float4, const(int )*) @nogc nothrow;
    static float _mm_cvtss_f32(core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_cvt_pi2ps(core.simd.float4, int ) @nogc nothrow;
    static core.simd.float4 _mm_cvtpi32_ps(core.simd.float4, int ) @nogc nothrow;
    static core.simd.float4 _mm_cvtsi64_ss(core.simd.float4, long) @nogc nothrow;
    static core.simd.float4 _mm_cvt_si2ss(core.simd.float4, int) @nogc nothrow;
    static core.simd.float4 _mm_cvtsi32_ss(core.simd.float4, int) @nogc nothrow;
    static int _mm_cvtt_ps2pi(core.simd.float4) @nogc nothrow;
    static int _mm_cvttps_pi32(core.simd.float4) @nogc nothrow;
    static long _mm_cvttss_si64(core.simd.float4) @nogc nothrow;
    static int _mm_cvtt_ss2si(core.simd.float4) @nogc nothrow;
    static int _mm_cvttss_si32(core.simd.float4) @nogc nothrow;
    static int _mm_cvt_ps2pi(core.simd.float4) @nogc nothrow;
    static int _mm_cvtps_pi32(core.simd.float4) @nogc nothrow;
    static long _mm_cvtss_si64(core.simd.float4) @nogc nothrow;
    static int _mm_cvt_ss2si(core.simd.float4) @nogc nothrow;
    static int _mm_cvtss_si32(core.simd.float4) @nogc nothrow;
    static int _mm_ucomineq_ss(core.simd.float4, core.simd.float4) @nogc nothrow;
    static int _mm_ucomige_ss(core.simd.float4, core.simd.float4) @nogc nothrow;
    static int _mm_ucomigt_ss(core.simd.float4, core.simd.float4) @nogc nothrow;
    static int _mm_ucomile_ss(core.simd.float4, core.simd.float4) @nogc nothrow;
    static int _mm_ucomilt_ss(core.simd.float4, core.simd.float4) @nogc nothrow;
    static int _mm_ucomieq_ss(core.simd.float4, core.simd.float4) @nogc nothrow;
    static int _mm_comineq_ss(core.simd.float4, core.simd.float4) @nogc nothrow;
    static int _mm_comige_ss(core.simd.float4, core.simd.float4) @nogc nothrow;
    static int _mm_comigt_ss(core.simd.float4, core.simd.float4) @nogc nothrow;
    static int _mm_comile_ss(core.simd.float4, core.simd.float4) @nogc nothrow;
    static int _mm_comilt_ss(core.simd.float4, core.simd.float4) @nogc nothrow;
    static int _mm_comieq_ss(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_cmpunord_ps(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_cmpunord_ss(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_cmpord_ps(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_cmpord_ss(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_cmpnge_ps(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_cmpnge_ss(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_cmpngt_ps(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_cmpngt_ss(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_cmpnle_ps(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_cmpnle_ss(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_cmpnlt_ps(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_cmpnlt_ss(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_cmpneq_ps(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_cmpneq_ss(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_cmpge_ps(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_cmpge_ss(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_cmpgt_ps(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_cmpgt_ss(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_cmple_ps(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_cmple_ss(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_cmplt_ps(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_cmplt_ss(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_cmpeq_ps(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_cmpeq_ss(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_xor_ps(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_or_ps(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_andnot_ps(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_and_ps(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_max_ps(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_max_ss(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_min_ps(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_min_ss(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_rsqrt_ps(core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_rsqrt_ss(core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_rcp_ps(core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_rcp_ss(core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_sqrt_ps(core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_sqrt_ss(core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_div_ps(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_div_ss(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_mul_ps(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_mul_ss(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_sub_ps(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_sub_ss(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_add_ps(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_add_ss(core.simd.float4, core.simd.float4) @nogc nothrow;
    alias __v4su = core.simd.uint4;
    alias __m128 = core.simd.float4;
    alias __v4sf = core.simd.float4;
    alias __v4si = core.simd.int4;
    static void _wbnoinvd() @nogc nothrow;
    static ubyte _tpause(uint, ulong) @nogc nothrow;
    static ubyte _umwait(uint, ulong) @nogc nothrow;
    static void _umonitor(void*) @nogc nothrow;
    static core.simd.long8 _mm512_aesdeclast_epi128(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long4 _mm256_aesdeclast_epi128(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long8 _mm512_aesenclast_epi128(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long4 _mm256_aesenclast_epi128(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long8 _mm512_aesdec_epi128(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long4 _mm256_aesdec_epi128(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long8 _mm512_aesenc_epi128(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long4 _mm256_aesenc_epi128(core.simd.long4, core.simd.long4) @nogc nothrow;
    static int _mm_sign_pi32(int , int ) @nogc nothrow;
    static int _mm_sign_pi16(int , int ) @nogc nothrow;
    static int _mm_sign_pi8(int , int ) @nogc nothrow;
    static core.simd.long2 _mm_sign_epi32(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_sign_epi16(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_sign_epi8(core.simd.long2, core.simd.long2) @nogc nothrow;
    static int _mm_shuffle_pi8(int , int ) @nogc nothrow;
    static core.simd.long2 _mm_shuffle_epi8(core.simd.long2, core.simd.long2) @nogc nothrow;
    static int _mm_mulhrs_pi16(int , int ) @nogc nothrow;
    static core.simd.long2 _mm_mulhrs_epi16(core.simd.long2, core.simd.long2) @nogc nothrow;
    static int _mm_maddubs_pi16(int , int ) @nogc nothrow;
    static core.simd.long2 _mm_maddubs_epi16(core.simd.long2, core.simd.long2) @nogc nothrow;
    static int _mm_hsubs_pi16(int , int ) @nogc nothrow;
    static core.simd.long2 _mm_hsubs_epi16(core.simd.long2, core.simd.long2) @nogc nothrow;
    void* alloca(c_ulong) @nogc nothrow;
    static int _mm_hsub_pi32(int , int ) @nogc nothrow;
    uint inet_addr(const(char)*) @nogc nothrow;
    uint inet_lnaof(in_addr) @nogc nothrow;
    in_addr inet_makeaddr(uint, uint) @nogc nothrow;
    uint inet_netof(in_addr) @nogc nothrow;
    uint inet_network(const(char)*) @nogc nothrow;
    char* inet_ntoa(in_addr) @nogc nothrow;
    int inet_pton(int, const(char)*, void*) @nogc nothrow;
    const(char)* inet_ntop(int, const(void)*, char*, uint) @nogc nothrow;
    int inet_aton(const(char)*, in_addr*) @nogc nothrow;
    char* inet_neta(uint, char*, c_ulong) @nogc nothrow;
    char* inet_net_ntop(int, const(void)*, int, char*, c_ulong) @nogc nothrow;
    int inet_net_pton(int, const(char)*, void*, c_ulong) @nogc nothrow;
    uint inet_nsap_addr(const(char)*, ubyte*, int) @nogc nothrow;
    char* inet_nsap_ntoa(int, const(ubyte)*, char*) @nogc nothrow;
    static int _mm_hsub_pi16(int , int ) @nogc nothrow;
    static core.simd.long2 _mm_hsub_epi32(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_hsub_epi16(core.simd.long2, core.simd.long2) @nogc nothrow;
    static int _mm_hadds_pi16(int , int ) @nogc nothrow;
    static core.simd.long2 _mm_hadds_epi16(core.simd.long2, core.simd.long2) @nogc nothrow;
    static int _mm_hadd_pi32(int , int ) @nogc nothrow;
    static int _mm_hadd_pi16(int , int ) @nogc nothrow;
    static core.simd.long2 _mm_hadd_epi32(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_hadd_epi16(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_abs_epi32(core.simd.long2) @nogc nothrow;
    static int _mm_abs_pi32(int ) @nogc nothrow;
    static core.simd.long2 _mm_abs_epi16(core.simd.long2) @nogc nothrow;
    static int _mm_abs_pi16(int ) @nogc nothrow;
    static core.simd.long2 _mm_abs_epi8(core.simd.long2) @nogc nothrow;
    static int _mm_abs_pi8(int ) @nogc nothrow;
    alias wchar_t = int;
    alias size_t = c_ulong;
    alias ptrdiff_t = c_long;
    alias __kernel_long_t = c_long;
    alias __kernel_ulong_t = c_ulong;
    alias __kernel_ino_t = c_ulong;
    alias __kernel_mode_t = uint;
    alias __kernel_pid_t = int;
    alias __kernel_ipc_pid_t = int;
    alias __kernel_uid_t = uint;
    alias __kernel_gid_t = uint;
    alias __kernel_suseconds_t = c_long;
    alias __kernel_daddr_t = int;
    alias __kernel_uid32_t = uint;
    alias __kernel_gid32_t = uint;
    alias __kernel_size_t = c_ulong;
    alias __kernel_ssize_t = c_long;
    alias __kernel_ptrdiff_t = c_long;
    struct __kernel_fsid_t
    {
        int[2] val;
    }
    alias __kernel_off_t = c_long;
    alias __kernel_loff_t = long;
    alias __kernel_time_t = c_long;
    alias __kernel_time64_t = long;
    alias __kernel_clock_t = c_long;
    alias __kernel_timer_t = int;
    alias __kernel_clockid_t = int;
    alias __kernel_caddr_t = char*;
    alias __kernel_uid16_t = ushort;
    alias __kernel_gid16_t = ushort;
    static ulong _mm_crc32_u64(ulong, ulong) @nogc nothrow;
    static uint _mm_crc32_u32(uint, uint) @nogc nothrow;
    static uint _mm_crc32_u16(uint, ushort) @nogc nothrow;
    static uint _mm_crc32_u8(uint, ubyte) @nogc nothrow;
    static core.simd.long2 _mm_cmpgt_epi64(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_minpos_epu16(core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_packus_epi32(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_cvtepu32_epi64(core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_cvtepu16_epi64(core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_cvtepu16_epi32(core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_cvtepu8_epi64(core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_cvtepu8_epi32(core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_cvtepu8_epi16(core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_cvtepi32_epi64(core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_cvtepi16_epi64(core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_cvtepi16_epi32(core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_cvtepi8_epi64(core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_cvtepi8_epi32(core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_cvtepi8_epi16(core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_cmpeq_epi64(core.simd.long2, core.simd.long2) @nogc nothrow;
    static int _mm_testnzc_si128(core.simd.long2, core.simd.long2) @nogc nothrow;
    static int _mm_testc_si128(core.simd.long2, core.simd.long2) @nogc nothrow;
    static int _mm_testz_si128(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_max_epu32(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_min_epu32(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_max_epi32(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_min_epi32(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_max_epu16(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_min_epu16(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_max_epi8(core.simd.long2, core.simd.long2) @nogc nothrow;
    alias __kernel_old_uid_t = ushort;
    alias __kernel_old_gid_t = ushort;
    static core.simd.long2 _mm_min_epi8(core.simd.long2, core.simd.long2) @nogc nothrow;
    alias __kernel_old_dev_t = c_ulong;
    static core.simd.long2 _mm_stream_load_si128(const(core.simd.long2)*) @nogc nothrow;
    static core.simd.long2 _mm_mul_epi32(core.simd.long2, core.simd.long2) @nogc nothrow;
    void __assert_fail(const(char)*, const(char)*, uint, const(char)*) @nogc nothrow;
    void __assert_perror_fail(int, const(char)*, uint, const(char)*) @nogc nothrow;
    void __assert(const(char)*, const(char)*, int) @nogc nothrow;
    static core.simd.long2 _mm_mullo_epi32(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_blendv_epi8(core.simd.long2, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.float4 _mm_blendv_ps(core.simd.float4, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.double2 _mm_blendv_pd(core.simd.double2, core.simd.double2, core.simd.double2) @nogc nothrow;
    static ushort __bswap_16(ushort) @nogc nothrow;
    static uint __bswap_32(uint) @nogc nothrow;
    static core.simd.long2 _mm_sha256msg2_epu32(core.simd.long2, core.simd.long2) @nogc nothrow;
    static c_ulong __bswap_64(c_ulong) @nogc nothrow;
    static core.simd.long2 _mm_sha256msg1_epu32(core.simd.long2, core.simd.long2) @nogc nothrow;
    alias __cpu_mask = c_ulong;
    static core.simd.long2 _mm_sha256rnds2_epu32(core.simd.long2, core.simd.long2, core.simd.long2) @nogc nothrow;
    struct cpu_set_t
    {
        c_ulong[16] __bits;
    }
    static core.simd.long2 _mm_sha1msg2_epu32(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_sha1msg1_epu32(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_sha1nexte_epu32(core.simd.long2, core.simd.long2) @nogc nothrow;
    static uint _enclv_u32(uint, c_ulong*) @nogc nothrow;
    int __sched_cpucount(c_ulong, const(cpu_set_t)*) @nogc nothrow;
    cpu_set_t* __sched_cpualloc(c_ulong) @nogc nothrow;
    void __sched_cpufree(cpu_set_t*) @nogc nothrow;
    struct dirent
    {
        c_ulong d_ino;
        c_long d_off;
        ushort d_reclen;
        ubyte d_type;
        char[256] d_name;
    }
    static uint _encls_u32(uint, c_ulong*) @nogc nothrow;
    static uint _enclu_u32(uint, c_ulong*) @nogc nothrow;
    static void _xend() @nogc nothrow;
    static uint _xbegin() @nogc nothrow;
    static int _rdseed64_step(ulong*) @nogc nothrow;
    static int _rdseed32_step(uint*) @nogc nothrow;
    static int _rdseed16_step(ushort*) @nogc nothrow;
    static void _ptwrite64(ulong) @nogc nothrow;
    static void _ptwrite32(uint) @nogc nothrow;
    static long _popcnt64(long) @nogc nothrow;
    static long _mm_popcnt_u64(ulong) @nogc nothrow;
    static int _popcnt32(int) @nogc nothrow;
    static int _mm_popcnt_u32(uint) @nogc nothrow;
    static void _mm_mwait(uint, uint) @nogc nothrow;
    static void _mm_monitor(const(void)*, uint, uint) @nogc nothrow;
    static core.simd.double2 _mm_movedup_pd(core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_hsub_pd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_hadd_pd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_addsub_pd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.float4 _mm_moveldup_ps(core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_movehdup_ps(core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_hsub_ps(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_hadd_ps(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_addsub_ps(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.long2 _mm_lddqu_si128(const(core.simd.long2)*) @nogc nothrow;
    static void _wrpkru(uint) @nogc nothrow;
    static uint _rdpkru_u32() @nogc nothrow;
    static uint _pconfig_u32(uint, c_ulong*) @nogc nothrow;
    static void _movdir64b(void*, const(void)*) @nogc nothrow;
    static void _directstoreu_u64(void*, c_ulong) @nogc nothrow;
    static void _directstoreu_u32(void*, uint) @nogc nothrow;
    static int _mm_setr_pi8(char, char, char, char, char, char, char, char) @nogc nothrow;
    static int _mm_setr_pi16(short, short, short, short) @nogc nothrow;
    static int _mm_setr_pi32(int, int) @nogc nothrow;
    struct flock
    {
        short l_type;
        short l_whence;
        c_long l_start;
        c_long l_len;
        int l_pid;
    }
    static int _mm_set1_pi8(char) @nogc nothrow;
    static int _mm_set1_pi16(short) @nogc nothrow;
    static int _mm_set1_pi32(int) @nogc nothrow;
    static int _mm_set_pi8(char, char, char, char, char, char, char, char) @nogc nothrow;
    static int _mm_set_pi16(short, short, short, short) @nogc nothrow;
    static int _mm_set_pi32(int, int) @nogc nothrow;
    static int _mm_setzero_si64() @nogc nothrow;
    static int _mm_cmpgt_pi32(int , int ) @nogc nothrow;
    static int _mm_cmpgt_pi16(int , int ) @nogc nothrow;
    static int _mm_cmpgt_pi8(int , int ) @nogc nothrow;
    static int _mm_cmpeq_pi32(int , int ) @nogc nothrow;
    alias _Float32 = float;
    static int _mm_cmpeq_pi16(int , int ) @nogc nothrow;
    static int _mm_cmpeq_pi8(int , int ) @nogc nothrow;
    alias _Float64 = double;
    static int _mm_xor_si64(int , int ) @nogc nothrow;
    static int _mm_or_si64(int , int ) @nogc nothrow;
    alias _Float32x = double;
    static int _mm_andnot_si64(int , int ) @nogc nothrow;
    static int _mm_and_si64(int , int ) @nogc nothrow;
    alias _Float64x = real;
    static int _mm_srli_si64(int , int) @nogc nothrow;
    static int _mm_srl_si64(int , int ) @nogc nothrow;
    static int _mm_srli_pi32(int , int) @nogc nothrow;
    static int _mm_srl_pi32(int , int ) @nogc nothrow;
    static int _mm_srli_pi16(int , int) @nogc nothrow;
    static int _mm_srl_pi16(int , int ) @nogc nothrow;
    static int _mm_srai_pi32(int , int) @nogc nothrow;
    static int _mm_sra_pi32(int , int ) @nogc nothrow;
    static int _mm_srai_pi16(int , int) @nogc nothrow;
    static int _mm_sra_pi16(int , int ) @nogc nothrow;
    static int _mm_slli_si64(int , int) @nogc nothrow;
    static int _mm_sll_si64(int , int ) @nogc nothrow;
    static int _mm_slli_pi32(int , int) @nogc nothrow;
    static int _mm_sll_pi32(int , int ) @nogc nothrow;
    static int _mm_slli_pi16(int , int) @nogc nothrow;
    static int _mm_sll_pi16(int , int ) @nogc nothrow;
    static int _mm_mullo_pi16(int , int ) @nogc nothrow;
    static int _mm_mulhi_pi16(int , int ) @nogc nothrow;
    static int _mm_madd_pi16(int , int ) @nogc nothrow;
    static int _mm_subs_pu16(int , int ) @nogc nothrow;
    static int _mm_subs_pu8(int , int ) @nogc nothrow;
    static int _mm_subs_pi16(int , int ) @nogc nothrow;
    static int _mm_subs_pi8(int , int ) @nogc nothrow;
    static int _mm_sub_pi32(int , int ) @nogc nothrow;
    static int _mm_sub_pi16(int , int ) @nogc nothrow;
    static int _mm_sub_pi8(int , int ) @nogc nothrow;
    static int _mm_adds_pu16(int , int ) @nogc nothrow;
    static int _mm_adds_pu8(int , int ) @nogc nothrow;
    static int _mm_adds_pi16(int , int ) @nogc nothrow;
    static int _mm_adds_pi8(int , int ) @nogc nothrow;
    static int _mm_add_pi32(int , int ) @nogc nothrow;
    static int _mm_add_pi16(int , int ) @nogc nothrow;
    static int _mm_add_pi8(int , int ) @nogc nothrow;
    static int _mm_unpacklo_pi32(int , int ) @nogc nothrow;
    static int _mm_unpacklo_pi16(int , int ) @nogc nothrow;
    static int _mm_unpacklo_pi8(int , int ) @nogc nothrow;
    static int _mm_unpackhi_pi32(int , int ) @nogc nothrow;
    static int _mm_unpackhi_pi16(int , int ) @nogc nothrow;
    static int _mm_unpackhi_pi8(int , int ) @nogc nothrow;
    static int _mm_packs_pu16(int , int ) @nogc nothrow;
    static int _mm_packs_pi32(int , int ) @nogc nothrow;
    static int _mm_packs_pi16(int , int ) @nogc nothrow;
    struct ip_opts
    {
        in_addr ip_dst;
        char[40] ip_opts_;
    }
    struct ip_mreqn
    {
        in_addr imr_multiaddr;
        in_addr imr_address;
        int imr_ifindex;
    }
    struct in_pktinfo
    {
        int ipi_ifindex;
        in_addr ipi_spec_dst;
        in_addr ipi_addr;
    }
    static long _mm_cvtm64_si64(int ) @nogc nothrow;
    static int _mm_cvtsi64_m64(long) @nogc nothrow;
    static int _mm_cvtsi64_si32(int ) @nogc nothrow;
    static int _mm_cvtsi32_si64(int) @nogc nothrow;
    static void _mm_empty() @nogc nothrow;
    alias __v8qi = int ;
    alias __v4hi = int ;
    alias __v2si = int ;
    alias __v1di = int ;
    alias __m64 = int ;
    static void _mm_free(void*) @nogc nothrow;
    static void* _mm_malloc(c_ulong, c_ulong) @nogc nothrow;
    static ulong _lzcnt_u64(ulong) @nogc nothrow;
    static uint _lzcnt_u32(uint) @nogc nothrow;
    static uint __lzcnt32(uint) @nogc nothrow;
    static void _invpcid(uint, void*) @nogc nothrow;
    static void _storebe_i64(void*, long) @nogc nothrow;
    static long _loadbe_i64(const(void)*) @nogc nothrow;
    static void _storebe_i32(void*, int) @nogc nothrow;
    static int _loadbe_i32(const(void)*) @nogc nothrow;
    static void _storebe_i16(void*, short) @nogc nothrow;
    static short _loadbe_i16(const(void)*) @nogc nothrow;
    static void _writegsbase_u64(ulong) @nogc nothrow;
    static void _writegsbase_u32(uint) @nogc nothrow;
    static void _writefsbase_u64(ulong) @nogc nothrow;
    static void _writefsbase_u32(uint) @nogc nothrow;
    static ulong _readgsbase_u64() @nogc nothrow;
    static uint _readgsbase_u32() @nogc nothrow;
    static ulong _readfsbase_u64() @nogc nothrow;
    static uint _readfsbase_u32() @nogc nothrow;
    static int _bit_scan_reverse(int) @nogc nothrow;
    static int _bit_scan_forward(int) @nogc nothrow;
    static int _rdrand64_step(ulong*) @nogc nothrow;
    static int _rdrand32_step(uint*) @nogc nothrow;
    static int _rdrand16_step(ushort*) @nogc nothrow;
    static uint _rdpid_u32() @nogc nothrow;
    int __fpclassifyl(real) @nogc nothrow;
    int __fpclassifyf(float) @nogc nothrow;
    int __fpclassify(double) @nogc nothrow;
    int __signbitf(float) @nogc nothrow;
    int __signbitl(real) @nogc nothrow;
    int __signbit(double) @nogc nothrow;
    int __isinf(double) @nogc nothrow;
    int __isinfl(real) @nogc nothrow;
    int __isinff(float) @nogc nothrow;
    int __finitel(real) @nogc nothrow;
    int __finitef(float) @nogc nothrow;
    int __finite(double) @nogc nothrow;
    int __isnan(double) @nogc nothrow;
    int __isnanf(float) @nogc nothrow;
    int __isnanl(real) @nogc nothrow;
    int __iseqsig(double, double) @nogc nothrow;
    int __iseqsigl(real, real) @nogc nothrow;
    int __iseqsigf(float, float) @nogc nothrow;
    int __issignaling(double) @nogc nothrow;
    int __issignalingl(real) @nogc nothrow;
    int __issignalingf(float) @nogc nothrow;
    float __acosf(float) @nogc nothrow;
    double __acos(double) @nogc nothrow;
    real acosl(real) @nogc nothrow;
    real __acosl(real) @nogc nothrow;
    float acosf(float) @nogc nothrow;
    double acos(double) @nogc nothrow;
    float asinf(float) @nogc nothrow;
    float __asinf(float) @nogc nothrow;
    real __asinl(real) @nogc nothrow;
    double __asin(double) @nogc nothrow;
    real asinl(real) @nogc nothrow;
    double asin(double) @nogc nothrow;
    float atanf(float) @nogc nothrow;
    float __atanf(float) @nogc nothrow;
    double __atan(double) @nogc nothrow;
    real atanl(real) @nogc nothrow;
    real __atanl(real) @nogc nothrow;
    double atan(double) @nogc nothrow;
    real atan2l(real, real) @nogc nothrow;
    real __atan2l(real, real) @nogc nothrow;
    double __atan2(double, double) @nogc nothrow;
    float atan2f(float, float) @nogc nothrow;
    float __atan2f(float, float) @nogc nothrow;
    double atan2(double, double) @nogc nothrow;
    real cosl(real) @nogc nothrow;
    double __cos(double) @nogc nothrow;
    float __cosf(float) @nogc nothrow;
    float cosf(float) @nogc nothrow;
    real __cosl(real) @nogc nothrow;
    double cos(double) @nogc nothrow;
    float sinf(float) @nogc nothrow;
    float __sinf(float) @nogc nothrow;
    real sinl(real) @nogc nothrow;
    real __sinl(real) @nogc nothrow;
    double __sin(double) @nogc nothrow;
    double sin(double) @nogc nothrow;
    double __tan(double) @nogc nothrow;
    float tanf(float) @nogc nothrow;
    float __tanf(float) @nogc nothrow;
    real tanl(real) @nogc nothrow;
    real __tanl(real) @nogc nothrow;
    double tan(double) @nogc nothrow;
    double __cosh(double) @nogc nothrow;
    float __coshf(float) @nogc nothrow;
    float coshf(float) @nogc nothrow;
    real coshl(real) @nogc nothrow;
    real __coshl(real) @nogc nothrow;
    double cosh(double) @nogc nothrow;
    double __sinh(double) @nogc nothrow;
    float sinhf(float) @nogc nothrow;
    real __sinhl(real) @nogc nothrow;
    real sinhl(real) @nogc nothrow;
    float __sinhf(float) @nogc nothrow;
    double sinh(double) @nogc nothrow;
    float tanhf(float) @nogc nothrow;
    real __tanhl(real) @nogc nothrow;
    real tanhl(real) @nogc nothrow;
    double __tanh(double) @nogc nothrow;
    float __tanhf(float) @nogc nothrow;
    double tanh(double) @nogc nothrow;
    real acoshl(real) @nogc nothrow;
    real __acoshl(real) @nogc nothrow;
    float acoshf(float) @nogc nothrow;
    float __acoshf(float) @nogc nothrow;
    double __acosh(double) @nogc nothrow;
    double acosh(double) @nogc nothrow;
    float __asinhf(float) @nogc nothrow;
    real asinhl(real) @nogc nothrow;
    real __asinhl(real) @nogc nothrow;
    float asinhf(float) @nogc nothrow;
    double __asinh(double) @nogc nothrow;
    double asinh(double) @nogc nothrow;
    real atanhl(real) @nogc nothrow;
    real __atanhl(real) @nogc nothrow;
    float __atanhf(float) @nogc nothrow;
    float atanhf(float) @nogc nothrow;
    double __atanh(double) @nogc nothrow;
    double atanh(double) @nogc nothrow;
    double __exp(double) @nogc nothrow;
    real __expl(real) @nogc nothrow;
    real expl(real) @nogc nothrow;
    float expf(float) @nogc nothrow;
    float __expf(float) @nogc nothrow;
    double exp(double) @nogc nothrow;
    double __frexp(double, int*) @nogc nothrow;
    float __frexpf(float, int*) @nogc nothrow;
    real __frexpl(real, int*) @nogc nothrow;
    real frexpl(real, int*) @nogc nothrow;
    float frexpf(float, int*) @nogc nothrow;
    double frexp(double, int*) @nogc nothrow;
    real ldexpl(real, int) @nogc nothrow;
    real __ldexpl(real, int) @nogc nothrow;
    double __ldexp(double, int) @nogc nothrow;
    float ldexpf(float, int) @nogc nothrow;
    float __ldexpf(float, int) @nogc nothrow;
    double ldexp(double, int) @nogc nothrow;
    double __log(double) @nogc nothrow;
    real logl(real) @nogc nothrow;
    real __logl(real) @nogc nothrow;
    float logf(float) @nogc nothrow;
    float __logf(float) @nogc nothrow;
    double log(double) @nogc nothrow;
    float log10f(float) @nogc nothrow;
    real __log10l(real) @nogc nothrow;
    real log10l(real) @nogc nothrow;
    float __log10f(float) @nogc nothrow;
    double __log10(double) @nogc nothrow;
    double log10(double) @nogc nothrow;
    float modff(float, float*) @nogc nothrow;
    float __modff(float, float*) @nogc nothrow;
    real modfl(real, real*) @nogc nothrow;
    double __modf(double, double*) @nogc nothrow;
    real __modfl(real, real*) @nogc nothrow;
    double modf(double, double*) @nogc nothrow;
    real __expm1l(real) @nogc nothrow;
    real expm1l(real) @nogc nothrow;
    float __expm1f(float) @nogc nothrow;
    double __expm1(double) @nogc nothrow;
    float expm1f(float) @nogc nothrow;
    double expm1(double) @nogc nothrow;
    float __log1pf(float) @nogc nothrow;
    float log1pf(float) @nogc nothrow;
    real __log1pl(real) @nogc nothrow;
    real log1pl(real) @nogc nothrow;
    double __log1p(double) @nogc nothrow;
    double log1p(double) @nogc nothrow;
    float __logbf(float) @nogc nothrow;
    float logbf(float) @nogc nothrow;
    real __logbl(real) @nogc nothrow;
    real logbl(real) @nogc nothrow;
    double __logb(double) @nogc nothrow;
    double logb(double) @nogc nothrow;
    float __exp2f(float) @nogc nothrow;
    double __exp2(double) @nogc nothrow;
    real exp2l(real) @nogc nothrow;
    real __exp2l(real) @nogc nothrow;
    float exp2f(float) @nogc nothrow;
    double exp2(double) @nogc nothrow;
    float log2f(float) @nogc nothrow;
    double __log2(double) @nogc nothrow;
    real __log2l(real) @nogc nothrow;
    real log2l(real) @nogc nothrow;
    float __log2f(float) @nogc nothrow;
    double log2(double) @nogc nothrow;
    real __powl(real, real) @nogc nothrow;
    real powl(real, real) @nogc nothrow;
    double __pow(double, double) @nogc nothrow;
    float __powf(float, float) @nogc nothrow;
    float powf(float, float) @nogc nothrow;
    double pow(double, double) @nogc nothrow;
    real __sqrtl(real) @nogc nothrow;
    float sqrtf(float) @nogc nothrow;
    float __sqrtf(float) @nogc nothrow;
    real sqrtl(real) @nogc nothrow;
    double __sqrt(double) @nogc nothrow;
    double sqrt(double) @nogc nothrow;
    float __hypotf(float, float) @nogc nothrow;
    real __hypotl(real, real) @nogc nothrow;
    real hypotl(real, real) @nogc nothrow;
    double __hypot(double, double) @nogc nothrow;
    float hypotf(float, float) @nogc nothrow;
    double hypot(double, double) @nogc nothrow;
    double __cbrt(double) @nogc nothrow;
    real cbrtl(real) @nogc nothrow;
    real __cbrtl(real) @nogc nothrow;
    float cbrtf(float) @nogc nothrow;
    float __cbrtf(float) @nogc nothrow;
    double cbrt(double) @nogc nothrow;
    float ceilf(float) @nogc nothrow;
    float __ceilf(float) @nogc nothrow;
    double __ceil(double) @nogc nothrow;
    real __ceill(real) @nogc nothrow;
    real ceill(real) @nogc nothrow;
    double ceil(double) @nogc nothrow;
    double __fabs(double) @nogc nothrow;
    real __fabsl(real) @nogc nothrow;
    real fabsl(real) @nogc nothrow;
    float __fabsf(float) @nogc nothrow;
    float fabsf(float) @nogc nothrow;
    double fabs(double) @nogc nothrow;
    double __floor(double) @nogc nothrow;
    float __floorf(float) @nogc nothrow;
    float floorf(float) @nogc nothrow;
    real __floorl(real) @nogc nothrow;
    real floorl(real) @nogc nothrow;
    double floor(double) @nogc nothrow;
    float __fmodf(float, float) @nogc nothrow;
    float fmodf(float, float) @nogc nothrow;
    real fmodl(real, real) @nogc nothrow;
    real __fmodl(real, real) @nogc nothrow;
    double __fmod(double, double) @nogc nothrow;
    double fmod(double, double) @nogc nothrow;
    int isinf(double) @nogc nothrow;
    int isinfl(real) @nogc nothrow;
    int isinff(float) @nogc nothrow;
    int finitel(real) @nogc nothrow;
    int finitef(float) @nogc nothrow;
    int finite(double) @nogc nothrow;
    float dremf(float, float) @nogc nothrow;
    real dreml(real, real) @nogc nothrow;
    real __dreml(real, real) @nogc nothrow;
    double drem(double, double) @nogc nothrow;
    double __drem(double, double) @nogc nothrow;
    float __dremf(float, float) @nogc nothrow;
    real __significandl(real) @nogc nothrow;
    float __significandf(float) @nogc nothrow;
    real significandl(real) @nogc nothrow;
    double significand(double) @nogc nothrow;
    double __significand(double) @nogc nothrow;
    float significandf(float) @nogc nothrow;
    double __copysign(double, double) @nogc nothrow;
    float copysignf(float, float) @nogc nothrow;
    float __copysignf(float, float) @nogc nothrow;
    real copysignl(real, real) @nogc nothrow;
    real __copysignl(real, real) @nogc nothrow;
    double copysign(double, double) @nogc nothrow;
    real __nanl(const(char)*) @nogc nothrow;
    real nanl(const(char)*) @nogc nothrow;
    float __nanf(const(char)*) @nogc nothrow;
    float nanf(const(char)*) @nogc nothrow;
    double __nan(const(char)*) @nogc nothrow;
    double nan(const(char)*) @nogc nothrow;
    int isnanl(real) @nogc nothrow;
    int isnanf(float) @nogc nothrow;
    int isnan(double) @nogc nothrow;
    double __j0(double) @nogc nothrow;
    double j0(double) @nogc nothrow;
    real j0l(real) @nogc nothrow;
    real __j0l(real) @nogc nothrow;
    float j0f(float) @nogc nothrow;
    float __j0f(float) @nogc nothrow;
    real j1l(real) @nogc nothrow;
    float __j1f(float) @nogc nothrow;
    real __j1l(real) @nogc nothrow;
    double __j1(double) @nogc nothrow;
    double j1(double) @nogc nothrow;
    float j1f(float) @nogc nothrow;
    real __jnl(int, real) @nogc nothrow;
    float jnf(int, float) @nogc nothrow;
    float __jnf(int, float) @nogc nothrow;
    real jnl(int, real) @nogc nothrow;
    double jn(int, double) @nogc nothrow;
    double __jn(int, double) @nogc nothrow;
    real y0l(real) @nogc nothrow;
    real __y0l(real) @nogc nothrow;
    float y0f(float) @nogc nothrow;
    float __y0f(float) @nogc nothrow;
    double y0(double) @nogc nothrow;
    double __y0(double) @nogc nothrow;
    float __y1f(float) @nogc nothrow;
    real y1l(real) @nogc nothrow;
    real __y1l(real) @nogc nothrow;
    float y1f(float) @nogc nothrow;
    double y1(double) @nogc nothrow;
    double __y1(double) @nogc nothrow;
    real __ynl(int, real) @nogc nothrow;
    real ynl(int, real) @nogc nothrow;
    float ynf(int, float) @nogc nothrow;
    float __ynf(int, float) @nogc nothrow;
    double yn(int, double) @nogc nothrow;
    double __yn(int, double) @nogc nothrow;
    real __erfl(real) @nogc nothrow;
    real erfl(real) @nogc nothrow;
    float erff(float) @nogc nothrow;
    double __erf(double) @nogc nothrow;
    float __erff(float) @nogc nothrow;
    double erf(double) @nogc nothrow;
    double __erfc(double) @nogc nothrow;
    float erfcf(float) @nogc nothrow;
    float __erfcf(float) @nogc nothrow;
    real __erfcl(real) @nogc nothrow;
    real erfcl(real) @nogc nothrow;
    double erfc(double) @nogc nothrow;
    real __lgammal(real) @nogc nothrow;
    float lgammaf(float) @nogc nothrow;
    float __lgammaf(float) @nogc nothrow;
    real lgammal(real) @nogc nothrow;
    double __lgamma(double) @nogc nothrow;
    double lgamma(double) @nogc nothrow;
    real tgammal(real) @nogc nothrow;
    float __tgammaf(float) @nogc nothrow;
    double __tgamma(double) @nogc nothrow;
    float tgammaf(float) @nogc nothrow;
    real __tgammal(real) @nogc nothrow;
    double tgamma(double) @nogc nothrow;
    double gamma(double) @nogc nothrow;
    real gammal(real) @nogc nothrow;
    double __gamma(double) @nogc nothrow;
    float gammaf(float) @nogc nothrow;
    float __gammaf(float) @nogc nothrow;
    real __gammal(real) @nogc nothrow;
    real __lgammal_r(real, int*) @nogc nothrow;
    double __lgamma_r(double, int*) @nogc nothrow;
    double lgamma_r(double, int*) @nogc nothrow;
    float lgammaf_r(float, int*) @nogc nothrow;
    float __lgammaf_r(float, int*) @nogc nothrow;
    real lgammal_r(real, int*) @nogc nothrow;
    float __rintf(float) @nogc nothrow;
    float rintf(float) @nogc nothrow;
    real rintl(real) @nogc nothrow;
    double __rint(double) @nogc nothrow;
    real __rintl(real) @nogc nothrow;
    double rint(double) @nogc nothrow;
    real __nextafterl(real, real) @nogc nothrow;
    real nextafterl(real, real) @nogc nothrow;
    double __nextafter(double, double) @nogc nothrow;
    float nextafterf(float, float) @nogc nothrow;
    float __nextafterf(float, float) @nogc nothrow;
    double nextafter(double, double) @nogc nothrow;
    real __nexttowardl(real, real) @nogc nothrow;
    double __nexttoward(double, real) @nogc nothrow;
    float __nexttowardf(float, real) @nogc nothrow;
    float nexttowardf(float, real) @nogc nothrow;
    real nexttowardl(real, real) @nogc nothrow;
    double nexttoward(double, real) @nogc nothrow;
    real __remainderl(real, real) @nogc nothrow;
    real remainderl(real, real) @nogc nothrow;
    float __remainderf(float, float) @nogc nothrow;
    float remainderf(float, float) @nogc nothrow;
    double __remainder(double, double) @nogc nothrow;
    double remainder(double, double) @nogc nothrow;
    real __scalbnl(real, int) @nogc nothrow;
    real scalbnl(real, int) @nogc nothrow;
    double __scalbn(double, int) @nogc nothrow;
    float __scalbnf(float, int) @nogc nothrow;
    float scalbnf(float, int) @nogc nothrow;
    double scalbn(double, int) @nogc nothrow;
    int __ilogbf(float) @nogc nothrow;
    int __ilogb(double) @nogc nothrow;
    int __ilogbl(real) @nogc nothrow;
    int ilogbl(real) @nogc nothrow;
    int ilogbf(float) @nogc nothrow;
    int ilogb(double) @nogc nothrow;
    float scalblnf(float, c_long) @nogc nothrow;
    float __scalblnf(float, c_long) @nogc nothrow;
    real scalblnl(real, c_long) @nogc nothrow;
    double __scalbln(double, c_long) @nogc nothrow;
    real __scalblnl(real, c_long) @nogc nothrow;
    double scalbln(double, c_long) @nogc nothrow;
    float __nearbyintf(float) @nogc nothrow;
    real nearbyintl(real) @nogc nothrow;
    real __nearbyintl(real) @nogc nothrow;
    double __nearbyint(double) @nogc nothrow;
    float nearbyintf(float) @nogc nothrow;
    double nearbyint(double) @nogc nothrow;
    float roundf(float) @nogc nothrow;
    float __roundf(float) @nogc nothrow;
    real roundl(real) @nogc nothrow;
    real __roundl(real) @nogc nothrow;
    double __round(double) @nogc nothrow;
    double round(double) @nogc nothrow;
    real __truncl(real) @nogc nothrow;
    real truncl(real) @nogc nothrow;
    double __trunc(double) @nogc nothrow;
    float __truncf(float) @nogc nothrow;
    float truncf(float) @nogc nothrow;
    double trunc(double) @nogc nothrow;
    double __remquo(double, double, int*) @nogc nothrow;
    float __remquof(float, float, int*) @nogc nothrow;
    float remquof(float, float, int*) @nogc nothrow;
    real __remquol(real, real, int*) @nogc nothrow;
    real remquol(real, real, int*) @nogc nothrow;
    double remquo(double, double, int*) @nogc nothrow;
    c_long lrintf(float) @nogc nothrow;
    c_long __lrintf(float) @nogc nothrow;
    c_long __lrint(double) @nogc nothrow;
    c_long lrintl(real) @nogc nothrow;
    c_long __lrintl(real) @nogc nothrow;
    c_long lrint(double) @nogc nothrow;
    long __llrint(double) @nogc nothrow;
    long __llrintf(float) @nogc nothrow;
    long __llrintl(real) @nogc nothrow;
    long llrintl(real) @nogc nothrow;
    long llrintf(float) @nogc nothrow;
    long llrint(double) @nogc nothrow;
    c_long __lround(double) @nogc nothrow;
    c_long lroundl(real) @nogc nothrow;
    c_long __lroundl(real) @nogc nothrow;
    c_long __lroundf(float) @nogc nothrow;
    c_long lroundf(float) @nogc nothrow;
    c_long lround(double) @nogc nothrow;
    long __llround(double) @nogc nothrow;
    long __llroundf(float) @nogc nothrow;
    long llroundf(float) @nogc nothrow;
    long __llroundl(real) @nogc nothrow;
    long llroundl(real) @nogc nothrow;
    long llround(double) @nogc nothrow;
    real __fdiml(real, real) @nogc nothrow;
    float fdimf(float, float) @nogc nothrow;
    float __fdimf(float, float) @nogc nothrow;
    real fdiml(real, real) @nogc nothrow;
    double __fdim(double, double) @nogc nothrow;
    double fdim(double, double) @nogc nothrow;
    float __fmaxf(float, float) @nogc nothrow;
    double __fmax(double, double) @nogc nothrow;
    float fmaxf(float, float) @nogc nothrow;
    real __fmaxl(real, real) @nogc nothrow;
    real fmaxl(real, real) @nogc nothrow;
    double fmax(double, double) @nogc nothrow;
    float fminf(float, float) @nogc nothrow;
    double __fmin(double, double) @nogc nothrow;
    real __fminl(real, real) @nogc nothrow;
    real fminl(real, real) @nogc nothrow;
    float __fminf(float, float) @nogc nothrow;
    double fmin(double, double) @nogc nothrow;
    float fmaf(float, float, float) @nogc nothrow;
    float __fmaf(float, float, float) @nogc nothrow;
    double __fma(double, double, double) @nogc nothrow;
    real __fmal(real, real, real) @nogc nothrow;
    real fmal(real, real, real) @nogc nothrow;
    double fma(double, double, double) @nogc nothrow;
    double scalb(double, double) @nogc nothrow;
    float __scalbf(float, float) @nogc nothrow;
    float scalbf(float, float) @nogc nothrow;
    double __scalb(double, double) @nogc nothrow;
    real scalbl(real, real) @nogc nothrow;
    real __scalbl(real, real) @nogc nothrow;
    struct netent
    {
        char* n_name;
        char** n_aliases;
        int n_addrtype;
        uint n_net;
    }
    static core.simd.long8 _mm512_maskz_gf2p8mul_epi8(ulong, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_gf2p8mul_epi8(core.simd.long8, ulong, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_gf2p8mul_epi8(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_gf2p8mul_epi8(uint, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_gf2p8mul_epi8(core.simd.long4, uint, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_gf2p8mul_epi8(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_gf2p8mul_epi8(ushort, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_gf2p8mul_epi8(core.simd.long2, ushort, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_gf2p8mul_epi8(core.simd.long2, core.simd.long2) @nogc nothrow;
    static void _fxrstor64(void*) @nogc nothrow;
    static void _fxsave64(void*) @nogc nothrow;
    static void _fxrstor(void*) @nogc nothrow;
    static void _fxsave(void*) @nogc nothrow;
    static core.simd.double4 _mm256_fmsubadd_pd(core.simd.double4, core.simd.double4, core.simd.double4) @nogc nothrow;
    struct __pthread_rwlock_arch_t
    {
        uint __readers;
        uint __writers;
        uint __wrphase_futex;
        uint __writers_futex;
        uint __pad3;
        uint __pad4;
        int __cur_writer;
        int __shared;
        byte __rwelision;
        ubyte[7] __pad1;
        c_ulong __pad2;
        uint __flags;
    }
    static core.simd.float8 _mm256_fmsubadd_ps(core.simd.float8, core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.double4 _mm256_fmaddsub_pd(core.simd.double4, core.simd.double4, core.simd.double4) @nogc nothrow;
    alias pthread_t = c_ulong;
    union pthread_mutexattr_t
    {
        char[4] __size;
        int __align;
    }
    union pthread_condattr_t
    {
        char[4] __size;
        int __align;
    }
    alias pthread_key_t = uint;
    alias pthread_once_t = int;
    union pthread_attr_t
    {
        char[56] __size;
        c_long __align;
    }
    union pthread_mutex_t
    {
        __pthread_mutex_s __data;
        char[40] __size;
        c_long __align;
    }
    union pthread_cond_t
    {
        __pthread_cond_s __data;
        char[48] __size;
        long __align;
    }
    union pthread_rwlock_t
    {
        __pthread_rwlock_arch_t __data;
        char[56] __size;
        c_long __align;
    }
    union pthread_rwlockattr_t
    {
        char[8] __size;
        c_long __align;
    }
    alias pthread_spinlock_t = int;
    union pthread_barrier_t
    {
        char[32] __size;
        c_long __align;
    }
    union pthread_barrierattr_t
    {
        char[4] __size;
        int __align;
    }
    static core.simd.float8 _mm256_fmaddsub_ps(core.simd.float8, core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.double4 _mm256_fnmsub_pd(core.simd.double4, core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.float8 _mm256_fnmsub_ps(core.simd.float8, core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.double4 _mm256_fnmadd_pd(core.simd.double4, core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.float8 _mm256_fnmadd_ps(core.simd.float8, core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.double4 _mm256_fmsub_pd(core.simd.double4, core.simd.double4, core.simd.double4) @nogc nothrow;
    union sem_t
    {
        char[32] __size;
        c_long __align;
    }
    alias __jmp_buf = c_long[8];
    static core.simd.float8 _mm256_fmsub_ps(core.simd.float8, core.simd.float8, core.simd.float8) @nogc nothrow;
    struct sigaction
    {
        static union _Anonymous_0
        {
            void function(int) sa_handler;
            void function(int, siginfo_t*, void*) sa_sigaction;
        }
        _Anonymous_0 __sigaction_handler;
        __sigset_t sa_mask;
        int sa_flags;
        void function() sa_restorer;
    }
    static core.simd.double4 _mm256_fmadd_pd(core.simd.double4, core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.float8 _mm256_fmadd_ps(core.simd.float8, core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.double2 _mm_fmsubadd_pd(core.simd.double2, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.float4 _mm_fmsubadd_ps(core.simd.float4, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.double2 _mm_fmaddsub_pd(core.simd.double2, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.float4 _mm_fmaddsub_ps(core.simd.float4, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.double2 _mm_fnmsub_sd(core.simd.double2, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.float4 _mm_fnmsub_ss(core.simd.float4, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.double2 _mm_fnmsub_pd(core.simd.double2, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.float4 _mm_fnmsub_ps(core.simd.float4, core.simd.float4, core.simd.float4) @nogc nothrow;
    struct _fpx_sw_bytes
    {
        uint magic1;
        uint extended_size;
        c_ulong xstate_bv;
        uint xstate_size;
        uint[7] __glibc_reserved1;
    }
    struct _fpreg
    {
        ushort[4] significand;
        ushort exponent;
    }
    struct _fpxreg
    {
        ushort[4] significand;
        ushort exponent;
        ushort[3] __glibc_reserved1;
    }
    struct _xmmreg
    {
        uint[4] element;
    }
    struct _fpstate
    {
        ushort cwd;
        ushort swd;
        ushort ftw;
        ushort fop;
        c_ulong rip;
        c_ulong rdp;
        uint mxcsr;
        uint mxcr_mask;
        _fpxreg[8] _st;
        _xmmreg[16] _xmm;
        uint[24] __glibc_reserved1;
    }
    struct sigcontext
    {
        c_ulong r8;
        c_ulong r9;
        c_ulong r10;
        c_ulong r11;
        c_ulong r12;
        c_ulong r13;
        c_ulong r14;
        c_ulong r15;
        c_ulong rdi;
        c_ulong rsi;
        c_ulong rbp;
        c_ulong rbx;
        c_ulong rdx;
        c_ulong rax;
        c_ulong rcx;
        c_ulong rsp;
        c_ulong rip;
        c_ulong eflags;
        ushort cs;
        ushort gs;
        ushort fs;
        ushort __pad0;
        c_ulong err;
        c_ulong trapno;
        c_ulong oldmask;
        c_ulong cr2;
        static union _Anonymous_1
        {
            _fpstate* fpstate;
            c_ulong __fpstate_word;
        }
        _Anonymous_1 _anonymous_2;
        auto fpstate() @property @nogc pure nothrow { return _anonymous_2.fpstate; }
        void fpstate(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_2.fpstate = val; }
        auto __fpstate_word() @property @nogc pure nothrow { return _anonymous_2.__fpstate_word; }
        void __fpstate_word(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_2.__fpstate_word = val; }
        c_ulong[8] __reserved1;
    }
    struct _xsave_hdr
    {
        c_ulong xstate_bv;
        c_ulong[2] __glibc_reserved1;
        c_ulong[5] __glibc_reserved2;
    }
    struct _ymmh_state
    {
        uint[64] ymmh_space;
    }
    struct _xstate
    {
        _fpstate fpstate;
        _xsave_hdr xstate_hdr;
        _ymmh_state ymmh;
    }
    enum _Anonymous_3
    {
        SIGEV_SIGNAL = 0,
        SIGEV_NONE = 1,
        SIGEV_THREAD = 2,
        SIGEV_THREAD_ID = 4,
    }
    enum SIGEV_SIGNAL = _Anonymous_3.SIGEV_SIGNAL;
    enum SIGEV_NONE = _Anonymous_3.SIGEV_NONE;
    enum SIGEV_THREAD = _Anonymous_3.SIGEV_THREAD;
    enum SIGEV_THREAD_ID = _Anonymous_3.SIGEV_THREAD_ID;
    static core.simd.double2 _mm_fnmadd_sd(core.simd.double2, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.float4 _mm_fnmadd_ss(core.simd.float4, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.double2 _mm_fnmadd_pd(core.simd.double2, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.float4 _mm_fnmadd_ps(core.simd.float4, core.simd.float4, core.simd.float4) @nogc nothrow;
    enum _Anonymous_4
    {
        SI_ASYNCNL = -60,
        SI_DETHREAD = -7,
        SI_TKILL = -6,
        SI_SIGIO = -5,
        SI_ASYNCIO = -4,
        SI_MESGQ = -3,
        SI_TIMER = -2,
        SI_QUEUE = -1,
        SI_USER = 0,
        SI_KERNEL = 128,
    }
    enum SI_ASYNCNL = _Anonymous_4.SI_ASYNCNL;
    enum SI_DETHREAD = _Anonymous_4.SI_DETHREAD;
    enum SI_TKILL = _Anonymous_4.SI_TKILL;
    enum SI_SIGIO = _Anonymous_4.SI_SIGIO;
    enum SI_ASYNCIO = _Anonymous_4.SI_ASYNCIO;
    enum SI_MESGQ = _Anonymous_4.SI_MESGQ;
    enum SI_TIMER = _Anonymous_4.SI_TIMER;
    enum SI_QUEUE = _Anonymous_4.SI_QUEUE;
    enum SI_USER = _Anonymous_4.SI_USER;
    enum SI_KERNEL = _Anonymous_4.SI_KERNEL;
    static core.simd.double2 _mm_fmsub_sd(core.simd.double2, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.float4 _mm_fmsub_ss(core.simd.float4, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.double2 _mm_fmsub_pd(core.simd.double2, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.float4 _mm_fmsub_ps(core.simd.float4, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.double2 _mm_fmadd_sd(core.simd.double2, core.simd.double2, core.simd.double2) @nogc nothrow;
    enum _Anonymous_5
    {
        ILL_ILLOPC = 1,
        ILL_ILLOPN = 2,
        ILL_ILLADR = 3,
        ILL_ILLTRP = 4,
        ILL_PRVOPC = 5,
        ILL_PRVREG = 6,
        ILL_COPROC = 7,
        ILL_BADSTK = 8,
        ILL_BADIADDR = 9,
    }
    enum ILL_ILLOPC = _Anonymous_5.ILL_ILLOPC;
    enum ILL_ILLOPN = _Anonymous_5.ILL_ILLOPN;
    enum ILL_ILLADR = _Anonymous_5.ILL_ILLADR;
    enum ILL_ILLTRP = _Anonymous_5.ILL_ILLTRP;
    enum ILL_PRVOPC = _Anonymous_5.ILL_PRVOPC;
    enum ILL_PRVREG = _Anonymous_5.ILL_PRVREG;
    enum ILL_COPROC = _Anonymous_5.ILL_COPROC;
    enum ILL_BADSTK = _Anonymous_5.ILL_BADSTK;
    enum ILL_BADIADDR = _Anonymous_5.ILL_BADIADDR;
    static core.simd.float4 _mm_fmadd_ss(core.simd.float4, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.double2 _mm_fmadd_pd(core.simd.double2, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.float4 _mm_fmadd_ps(core.simd.float4, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float8 _mm256_cvtph_ps(core.simd.long2) @nogc nothrow;
    enum _Anonymous_6
    {
        FPE_INTDIV = 1,
        FPE_INTOVF = 2,
        FPE_FLTDIV = 3,
        FPE_FLTOVF = 4,
        FPE_FLTUND = 5,
        FPE_FLTRES = 6,
        FPE_FLTINV = 7,
        FPE_FLTSUB = 8,
        FPE_FLTUNK = 14,
        FPE_CONDTRAP = 15,
    }
    enum FPE_INTDIV = _Anonymous_6.FPE_INTDIV;
    enum FPE_INTOVF = _Anonymous_6.FPE_INTOVF;
    enum FPE_FLTDIV = _Anonymous_6.FPE_FLTDIV;
    enum FPE_FLTOVF = _Anonymous_6.FPE_FLTOVF;
    enum FPE_FLTUND = _Anonymous_6.FPE_FLTUND;
    enum FPE_FLTRES = _Anonymous_6.FPE_FLTRES;
    enum FPE_FLTINV = _Anonymous_6.FPE_FLTINV;
    enum FPE_FLTSUB = _Anonymous_6.FPE_FLTSUB;
    enum FPE_FLTUNK = _Anonymous_6.FPE_FLTUNK;
    enum FPE_CONDTRAP = _Anonymous_6.FPE_CONDTRAP;
    static core.simd.float4 _mm_cvtph_ps(core.simd.long2) @nogc nothrow;
    static float _cvtsh_ss(ushort) @nogc nothrow;
    void _mm_pause() @nogc nothrow;
    static core.simd.double2 _mm_castsi128_pd(core.simd.long2) @nogc nothrow;
    static core.simd.float4 _mm_castsi128_ps(core.simd.long2) @nogc nothrow;
    enum _Anonymous_7
    {
        SEGV_MAPERR = 1,
        SEGV_ACCERR = 2,
        SEGV_BNDERR = 3,
        SEGV_PKUERR = 4,
        SEGV_ACCADI = 5,
        SEGV_ADIDERR = 6,
        SEGV_ADIPERR = 7,
    }
    enum SEGV_MAPERR = _Anonymous_7.SEGV_MAPERR;
    enum SEGV_ACCERR = _Anonymous_7.SEGV_ACCERR;
    enum SEGV_BNDERR = _Anonymous_7.SEGV_BNDERR;
    enum SEGV_PKUERR = _Anonymous_7.SEGV_PKUERR;
    enum SEGV_ACCADI = _Anonymous_7.SEGV_ACCADI;
    enum SEGV_ADIDERR = _Anonymous_7.SEGV_ADIDERR;
    enum SEGV_ADIPERR = _Anonymous_7.SEGV_ADIPERR;
    static core.simd.long2 _mm_castps_si128(core.simd.float4) @nogc nothrow;
    static core.simd.double2 _mm_castps_pd(core.simd.float4) @nogc nothrow;
    static core.simd.long2 _mm_castpd_si128(core.simd.double2) @nogc nothrow;
    static core.simd.float4 _mm_castpd_ps(core.simd.double2) @nogc nothrow;
    enum _Anonymous_8
    {
        BUS_ADRALN = 1,
        BUS_ADRERR = 2,
        BUS_OBJERR = 3,
        BUS_MCEERR_AR = 4,
        BUS_MCEERR_AO = 5,
    }
    enum BUS_ADRALN = _Anonymous_8.BUS_ADRALN;
    enum BUS_ADRERR = _Anonymous_8.BUS_ADRERR;
    enum BUS_OBJERR = _Anonymous_8.BUS_OBJERR;
    enum BUS_MCEERR_AR = _Anonymous_8.BUS_MCEERR_AR;
    enum BUS_MCEERR_AO = _Anonymous_8.BUS_MCEERR_AO;
    static int _mm_movemask_pd(core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_unpacklo_pd(core.simd.double2, core.simd.double2) @nogc nothrow;
    enum _Anonymous_9
    {
        CLD_EXITED = 1,
        CLD_KILLED = 2,
        CLD_DUMPED = 3,
        CLD_TRAPPED = 4,
        CLD_STOPPED = 5,
        CLD_CONTINUED = 6,
    }
    enum CLD_EXITED = _Anonymous_9.CLD_EXITED;
    enum CLD_KILLED = _Anonymous_9.CLD_KILLED;
    enum CLD_DUMPED = _Anonymous_9.CLD_DUMPED;
    enum CLD_TRAPPED = _Anonymous_9.CLD_TRAPPED;
    enum CLD_STOPPED = _Anonymous_9.CLD_STOPPED;
    enum CLD_CONTINUED = _Anonymous_9.CLD_CONTINUED;
    static core.simd.double2 _mm_unpackhi_pd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.long2 _mm_move_epi64(core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_movpi64_epi64(int ) @nogc nothrow;
    enum _Anonymous_10
    {
        POLL_IN = 1,
        POLL_OUT = 2,
        POLL_MSG = 3,
        POLL_ERR = 4,
        POLL_PRI = 5,
        POLL_HUP = 6,
    }
    enum POLL_IN = _Anonymous_10.POLL_IN;
    enum POLL_OUT = _Anonymous_10.POLL_OUT;
    enum POLL_MSG = _Anonymous_10.POLL_MSG;
    enum POLL_ERR = _Anonymous_10.POLL_ERR;
    enum POLL_PRI = _Anonymous_10.POLL_PRI;
    enum POLL_HUP = _Anonymous_10.POLL_HUP;
    static int _mm_movepi64_pi64(core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_unpacklo_epi64(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_unpacklo_epi32(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_unpacklo_epi16(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_unpacklo_epi8(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_unpackhi_epi64(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_unpackhi_epi32(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_unpackhi_epi16(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_unpackhi_epi8(core.simd.long2, core.simd.long2) @nogc nothrow;
    static int _mm_movemask_epi8(core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_packus_epi16(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_packs_epi32(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_packs_epi16(core.simd.long2, core.simd.long2) @nogc nothrow;
    void _mm_mfence() @nogc nothrow;
    void _mm_lfence() @nogc nothrow;
    void _mm_clflush(const(void)*) @nogc nothrow;
    static void _mm_stream_si64(long*, long) @nogc nothrow;
    static void _mm_stream_si32(int*, int) @nogc nothrow;
    static void _mm_stream_si128(core.simd.long2*, core.simd.long2) @nogc nothrow;
    static void _mm_stream_pd(double*, core.simd.double2) @nogc nothrow;
    static void _mm_storel_epi64(core.simd.long2*, core.simd.long2) @nogc nothrow;
    static void _mm_maskmoveu_si128(core.simd.long2, core.simd.long2, char*) @nogc nothrow;
    static void _mm_storeu_si16(const(void)*, core.simd.long2) @nogc nothrow;
    static void _mm_storeu_si32(const(void)*, core.simd.long2) @nogc nothrow;
    static void _mm_storeu_si64(const(void)*, core.simd.long2) @nogc nothrow;
    static void _mm_storeu_si128(core.simd.long2*, core.simd.long2) @nogc nothrow;
    static void _mm_store_si128(core.simd.long2*, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_setzero_si128() @nogc nothrow;
    static core.simd.long2 _mm_setr_epi8(char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char) @nogc nothrow;
    static core.simd.long2 _mm_setr_epi16(short, short, short, short, short, short, short, short) @nogc nothrow;
    static core.simd.long2 _mm_setr_epi32(int, int, int, int) @nogc nothrow;
    static core.simd.long2 _mm_setr_epi64(int , int ) @nogc nothrow;
    static core.simd.long2 _mm_set1_epi8(char) @nogc nothrow;
    static core.simd.long2 _mm_set1_epi16(short) @nogc nothrow;
    int pthread_sigmask(int, const(__sigset_t)*, __sigset_t*) @nogc nothrow;
    int pthread_kill(c_ulong, int) @nogc nothrow;
    alias sa_family_t = ushort;
    static core.simd.long2 _mm_set1_epi32(int) @nogc nothrow;
    static core.simd.long2 _mm_set1_epi64(int ) @nogc nothrow;
    static core.simd.long2 _mm_set1_epi64x(long) @nogc nothrow;
    alias socklen_t = uint;
    static core.simd.long2 _mm_set_epi8(char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char) @nogc nothrow;
    static core.simd.long2 _mm_set_epi16(short, short, short, short, short, short, short, short) @nogc nothrow;
    static core.simd.long2 _mm_set_epi32(int, int, int, int) @nogc nothrow;
    static core.simd.long2 _mm_set_epi64(int , int ) @nogc nothrow;
    static core.simd.long2 _mm_set_epi64x(long, long) @nogc nothrow;
    static core.simd.long2 _mm_undefined_si128() @nogc nothrow;
    static core.simd.long2 _mm_loadl_epi64(const(core.simd.long2)*) @nogc nothrow;
    static core.simd.long2 _mm_loadu_si128(const(core.simd.long2)*) @nogc nothrow;
    static core.simd.long2 _mm_load_si128(const(core.simd.long2)*) @nogc nothrow;
    static long _mm_cvtsi128_si64(core.simd.long2) @nogc nothrow;
    static int _mm_cvtsi128_si32(core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_cvtsi64_si128(long) @nogc nothrow;
    static core.simd.long2 _mm_cvtsi32_si128(int) @nogc nothrow;
    static core.simd.long2 _mm_cvttps_epi32(core.simd.float4) @nogc nothrow;
    static core.simd.long2 _mm_cvtps_epi32(core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_cvtepi32_ps(core.simd.long2) @nogc nothrow;
    static long _mm_cvttsd_si64(core.simd.double2) @nogc nothrow;
    static long _mm_cvtsd_si64(core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_cvtsi64_sd(core.simd.double2, long) @nogc nothrow;
    static core.simd.long2 _mm_cmplt_epi32(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_cmplt_epi16(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_cmplt_epi8(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_cmpgt_epi32(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_cmpgt_epi16(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_cmpgt_epi8(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_cmpeq_epi32(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_cmpeq_epi16(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_cmpeq_epi8(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_srl_epi64(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_srli_epi64(core.simd.long2, int) @nogc nothrow;
    static core.simd.long2 _mm_srl_epi32(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_srli_epi32(core.simd.long2, int) @nogc nothrow;
    static core.simd.long2 _mm_srl_epi16(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_srli_epi16(core.simd.long2, int) @nogc nothrow;
    static core.simd.long2 _mm_sra_epi32(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_srai_epi32(core.simd.long2, int) @nogc nothrow;
    static core.simd.long2 _mm_sra_epi16(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_srai_epi16(core.simd.long2, int) @nogc nothrow;
    static core.simd.long2 _mm_sll_epi64(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_slli_epi64(core.simd.long2, int) @nogc nothrow;
    static core.simd.long2 _mm_sll_epi32(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_slli_epi32(core.simd.long2, int) @nogc nothrow;
    static core.simd.long2 _mm_sll_epi16(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_slli_epi16(core.simd.long2, int) @nogc nothrow;
    static core.simd.long2 _mm_xor_si128(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_or_si128(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_andnot_si128(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_and_si128(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_subs_epu16(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_subs_epu8(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_subs_epi16(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_subs_epi8(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_sub_epi64(core.simd.long2, core.simd.long2) @nogc nothrow;
    static int _mm_sub_si64(int , int ) @nogc nothrow;
    static core.simd.long2 _mm_sub_epi32(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_sub_epi16(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_sub_epi8(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_sad_epu8(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mul_epu32(core.simd.long2, core.simd.long2) @nogc nothrow;
    static int _mm_mul_su32(int , int ) @nogc nothrow;
    struct sockaddr
    {
        ushort sa_family;
        char[14] sa_data;
    }
    static core.simd.long2 _mm_mullo_epi16(core.simd.long2, core.simd.long2) @nogc nothrow;
    struct sockaddr_storage
    {
        ushort ss_family;
        char[118] __ss_padding;
        c_ulong __ss_align;
    }
    enum _Anonymous_11
    {
        MSG_OOB = 1,
        MSG_PEEK = 2,
        MSG_DONTROUTE = 4,
        MSG_CTRUNC = 8,
        MSG_PROXY = 16,
        MSG_TRUNC = 32,
        MSG_DONTWAIT = 64,
        MSG_EOR = 128,
        MSG_WAITALL = 256,
        MSG_FIN = 512,
        MSG_SYN = 1024,
        MSG_CONFIRM = 2048,
        MSG_RST = 4096,
        MSG_ERRQUEUE = 8192,
        MSG_NOSIGNAL = 16384,
        MSG_MORE = 32768,
        MSG_WAITFORONE = 65536,
        MSG_BATCH = 262144,
        MSG_ZEROCOPY = 67108864,
        MSG_FASTOPEN = 536870912,
        MSG_CMSG_CLOEXEC = 1073741824,
    }
    enum MSG_OOB = _Anonymous_11.MSG_OOB;
    enum MSG_PEEK = _Anonymous_11.MSG_PEEK;
    enum MSG_DONTROUTE = _Anonymous_11.MSG_DONTROUTE;
    enum MSG_CTRUNC = _Anonymous_11.MSG_CTRUNC;
    enum MSG_PROXY = _Anonymous_11.MSG_PROXY;
    enum MSG_TRUNC = _Anonymous_11.MSG_TRUNC;
    enum MSG_DONTWAIT = _Anonymous_11.MSG_DONTWAIT;
    enum MSG_EOR = _Anonymous_11.MSG_EOR;
    enum MSG_WAITALL = _Anonymous_11.MSG_WAITALL;
    enum MSG_FIN = _Anonymous_11.MSG_FIN;
    enum MSG_SYN = _Anonymous_11.MSG_SYN;
    enum MSG_CONFIRM = _Anonymous_11.MSG_CONFIRM;
    enum MSG_RST = _Anonymous_11.MSG_RST;
    enum MSG_ERRQUEUE = _Anonymous_11.MSG_ERRQUEUE;
    enum MSG_NOSIGNAL = _Anonymous_11.MSG_NOSIGNAL;
    enum MSG_MORE = _Anonymous_11.MSG_MORE;
    enum MSG_WAITFORONE = _Anonymous_11.MSG_WAITFORONE;
    enum MSG_BATCH = _Anonymous_11.MSG_BATCH;
    enum MSG_ZEROCOPY = _Anonymous_11.MSG_ZEROCOPY;
    enum MSG_FASTOPEN = _Anonymous_11.MSG_FASTOPEN;
    enum MSG_CMSG_CLOEXEC = _Anonymous_11.MSG_CMSG_CLOEXEC;
    static core.simd.long2 _mm_mulhi_epu16(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mulhi_epi16(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_min_epu8(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_min_epi16(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_max_epu8(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_max_epi16(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_madd_epi16(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_avg_epu16(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_avg_epu8(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_adds_epu16(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_adds_epu8(core.simd.long2, core.simd.long2) @nogc nothrow;
    struct msghdr
    {
        void* msg_name;
        uint msg_namelen;
        iovec* msg_iov;
        c_ulong msg_iovlen;
        void* msg_control;
        c_ulong msg_controllen;
        int msg_flags;
    }
    struct cmsghdr
    {
        c_ulong cmsg_len;
        int cmsg_level;
        int cmsg_type;
        ubyte[0] __cmsg_data;
    }
    static core.simd.long2 _mm_adds_epi16(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_adds_epi8(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_add_epi64(core.simd.long2, core.simd.long2) @nogc nothrow;
    cmsghdr* __cmsg_nxthdr(msghdr*, cmsghdr*) @nogc nothrow;
    enum _Anonymous_12
    {
        SCM_RIGHTS = 1,
    }
    enum SCM_RIGHTS = _Anonymous_12.SCM_RIGHTS;
    static int _mm_add_si64(int , int ) @nogc nothrow;
    static core.simd.long2 _mm_add_epi32(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_add_epi16(core.simd.long2, core.simd.long2) @nogc nothrow;
    struct linger
    {
        int l_onoff;
        int l_linger;
    }
    enum __socket_type
    {
        SOCK_STREAM = 1,
        SOCK_DGRAM = 2,
        SOCK_RAW = 3,
        SOCK_RDM = 4,
        SOCK_SEQPACKET = 5,
        SOCK_DCCP = 6,
        SOCK_PACKET = 10,
        SOCK_CLOEXEC = 524288,
        SOCK_NONBLOCK = 2048,
    }
    enum SOCK_STREAM = __socket_type.SOCK_STREAM;
    enum SOCK_DGRAM = __socket_type.SOCK_DGRAM;
    enum SOCK_RAW = __socket_type.SOCK_RAW;
    enum SOCK_RDM = __socket_type.SOCK_RDM;
    enum SOCK_SEQPACKET = __socket_type.SOCK_SEQPACKET;
    enum SOCK_DCCP = __socket_type.SOCK_DCCP;
    enum SOCK_PACKET = __socket_type.SOCK_PACKET;
    enum SOCK_CLOEXEC = __socket_type.SOCK_CLOEXEC;
    enum SOCK_NONBLOCK = __socket_type.SOCK_NONBLOCK;
    static core.simd.long2 _mm_add_epi8(core.simd.long2, core.simd.long2) @nogc nothrow;
    static void _mm_storel_pd(double*, core.simd.double2) @nogc nothrow;
    static void _mm_storeh_pd(double*, core.simd.double2) @nogc nothrow;
    static void _mm_storer_pd(double*, core.simd.double2) @nogc nothrow;
    static void _mm_storeu_pd(double*, core.simd.double2) @nogc nothrow;
    enum _Anonymous_13
    {
        SS_ONSTACK = 1,
        SS_DISABLE = 2,
    }
    enum SS_ONSTACK = _Anonymous_13.SS_ONSTACK;
    enum SS_DISABLE = _Anonymous_13.SS_DISABLE;
    static void _mm_store_pd1(double*, core.simd.double2) @nogc nothrow;
    static void _mm_store1_pd(double*, core.simd.double2) @nogc nothrow;
    static void _mm_store_pd(double*, core.simd.double2) @nogc nothrow;
    struct stat
    {
        c_ulong st_dev;
        c_ulong st_ino;
        c_ulong st_nlink;
        uint st_mode;
        uint st_uid;
        uint st_gid;
        int __pad0;
        c_ulong st_rdev;
        c_long st_size;
        c_long st_blksize;
        c_long st_blocks;
        timespec st_atim;
        timespec st_mtim;
        timespec st_ctim;
        c_long[3] __glibc_reserved;
    }
    static void _mm_store_sd(double*, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_move_sd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_setzero_pd() @nogc nothrow;
    static core.simd.double2 _mm_setr_pd(double, double) @nogc nothrow;
    static core.simd.double2 _mm_set_pd(double, double) @nogc nothrow;
    static core.simd.double2 _mm_set_pd1(double) @nogc nothrow;
    static core.simd.double2 _mm_set1_pd(double) @nogc nothrow;
    static core.simd.double2 _mm_set_sd(double) @nogc nothrow;
    static core.simd.double2 _mm_undefined_pd() @nogc nothrow;
    static core.simd.double2 _mm_loadl_pd(core.simd.double2, const(double)*) @nogc nothrow;
    static core.simd.double2 _mm_loadh_pd(core.simd.double2, const(double)*) @nogc nothrow;
    static core.simd.double2 _mm_load_sd(const(double)*) @nogc nothrow;
    static core.simd.long2 _mm_loadu_si16(const(void)*) @nogc nothrow;
    alias int8_t = byte;
    alias int16_t = short;
    alias int32_t = int;
    alias int64_t = c_long;
    static core.simd.long2 _mm_loadu_si32(const(void)*) @nogc nothrow;
    alias uint8_t = ubyte;
    alias uint16_t = ushort;
    alias uint32_t = uint;
    alias uint64_t = ulong;
    static core.simd.long2 _mm_loadu_si64(const(void)*) @nogc nothrow;
    static core.simd.double2 _mm_loadu_pd(const(double)*) @nogc nothrow;
    static core.simd.double2 _mm_loadr_pd(const(double)*) @nogc nothrow;
    static core.simd.double2 _mm_load1_pd(const(double)*) @nogc nothrow;
    static core.simd.double2 _mm_load_pd(const(double)*) @nogc nothrow;
    static double _mm_cvtsd_f64(core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_cvtpi32_pd(int ) @nogc nothrow;
    static int _mm_cvttpd_pi32(core.simd.double2) @nogc nothrow;
    static int _mm_cvtpd_pi32(core.simd.double2) @nogc nothrow;
    static int _mm_cvttsd_si32(core.simd.double2) @nogc nothrow;
    static core.simd.long2 _mm_cvttpd_epi32(core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_cvtss_sd(core.simd.double2, core.simd.float4) @nogc nothrow;
    static core.simd.double2 _mm_cvtsi32_sd(core.simd.double2, int) @nogc nothrow;
    static core.simd.float4 _mm_cvtsd_ss(core.simd.float4, core.simd.double2) @nogc nothrow;
    static int _mm_cvtsd_si32(core.simd.double2) @nogc nothrow;
    static core.simd.long2 _mm_cvtpd_epi32(core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_cvtepi32_pd(core.simd.long2) @nogc nothrow;
    static core.simd.double2 _mm_cvtps_pd(core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_cvtpd_ps(core.simd.double2) @nogc nothrow;
    static int _mm_ucomineq_sd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static int _mm_ucomige_sd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static int _mm_ucomigt_sd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static int _mm_ucomile_sd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static int _mm_ucomilt_sd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static int _mm_ucomieq_sd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static int _mm_comineq_sd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static int _mm_comige_sd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static int _mm_comigt_sd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static int _mm_comile_sd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static int _mm_comilt_sd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static int _mm_comieq_sd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_cmpnge_sd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_cmpngt_sd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_cmpnle_sd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_cmpnlt_sd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_cmpneq_sd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_cmpunord_sd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_cmpord_sd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_cmpge_sd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_cmpgt_sd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_cmple_sd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_cmplt_sd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_cmpeq_sd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_cmpnge_pd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_cmpngt_pd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_cmpnle_pd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_cmpnlt_pd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_cmpneq_pd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_cmpunord_pd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_cmpord_pd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_cmpge_pd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_cmpgt_pd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_cmple_pd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_cmplt_pd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_cmpeq_pd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_xor_pd(core.simd.double2, core.simd.double2) @nogc nothrow;
    struct termios
    {
        uint c_iflag;
        uint c_oflag;
        uint c_cflag;
        uint c_lflag;
        ubyte c_line;
        ubyte[32] c_cc;
        uint c_ispeed;
        uint c_ospeed;
    }
    static core.simd.double2 _mm_or_pd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_andnot_pd(core.simd.double2, core.simd.double2) @nogc nothrow;
    alias cc_t = ubyte;
    alias speed_t = uint;
    alias tcflag_t = uint;
    static core.simd.double2 _mm_and_pd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_max_pd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_max_sd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_min_pd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_min_sd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_sqrt_pd(core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_sqrt_sd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_div_pd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_div_sd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_mul_pd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_mul_sd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_sub_pd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_sub_sd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_add_pd(core.simd.double2, core.simd.double2) @nogc nothrow;
    alias __pthread_list_t = __pthread_internal_list;
    struct __pthread_internal_list
    {
        __pthread_internal_list* __prev;
        __pthread_internal_list* __next;
    }
    static core.simd.double2 _mm_add_sd(core.simd.double2, core.simd.double2) @nogc nothrow;
    struct __pthread_mutex_s
    {
        int __lock;
        uint __count;
        int __owner;
        uint __nusers;
        int __kind;
        short __spins;
        short __elision;
        __pthread_internal_list __list;
    }
    alias __v16qs = core.simd.byte16;
    struct __pthread_cond_s
    {
        static union _Anonymous_14
        {
            ulong __wseq;
            static struct _Anonymous_15
            {
                uint __low;
                uint __high;
            }
            _Anonymous_15 __wseq32;
        }
        _Anonymous_14 _anonymous_16;
        auto __wseq() @property @nogc pure nothrow { return _anonymous_16.__wseq; }
        void __wseq(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_16.__wseq = val; }
        auto __wseq32() @property @nogc pure nothrow { return _anonymous_16.__wseq32; }
        void __wseq32(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_16.__wseq32 = val; }
        static union _Anonymous_17
        {
            ulong __g1_start;
            static struct _Anonymous_18
            {
                uint __low;
                uint __high;
            }
            _Anonymous_18 __g1_start32;
        }
        _Anonymous_17 _anonymous_19;
        auto __g1_start() @property @nogc pure nothrow { return _anonymous_19.__g1_start; }
        void __g1_start(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_19.__g1_start = val; }
        auto __g1_start32() @property @nogc pure nothrow { return _anonymous_19.__g1_start32; }
        void __g1_start32(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_19.__g1_start32 = val; }
        uint[2] __g_refs;
        uint[2] __g_size;
        uint __g1_orig_size;
        uint __wrefs;
        uint[2] __g_signals;
    }
    alias __v16qu = core.simd.ubyte16;
    alias __v8hu = core.simd.ushort8;
    alias __v2du = core.simd.ulong2;
    alias __v16qi = int ;
    alias __v8hi = core.simd.short8;
    alias __v2di = core.simd.long2;
    alias __v2df = core.simd.double2;
    alias __m128i = core.simd.long2;
    alias __m128d = core.simd.double2;
    static void _mm_clwb(const(void)*) @nogc nothrow;
    static void _mm_clflushopt(const(void)*) @nogc nothrow;
    static void _cldemote(const(void)*) @nogc nothrow;
    alias __u_char = ubyte;
    alias __u_short = ushort;
    alias __u_int = uint;
    alias __u_long = c_ulong;
    alias __int8_t = byte;
    alias __uint8_t = ubyte;
    alias __int16_t = short;
    alias __uint16_t = ushort;
    alias __int32_t = int;
    alias __uint32_t = uint;
    alias __int64_t = c_long;
    alias __uint64_t = c_ulong;
    alias __int_least8_t = byte;
    alias __uint_least8_t = ubyte;
    alias __int_least16_t = short;
    alias __uint_least16_t = ushort;
    alias __int_least32_t = int;
    alias __uint_least32_t = uint;
    alias __int_least64_t = c_long;
    alias __uint_least64_t = c_ulong;
    alias __quad_t = c_long;
    alias __u_quad_t = c_ulong;
    alias __intmax_t = c_long;
    alias __uintmax_t = c_ulong;
    static void _clrssbsy(void*) @nogc nothrow;
    static void _setssbsy() @nogc nothrow;
    static void _wrussq(ulong, void*) @nogc nothrow;
    static void _wrussd(uint, void*) @nogc nothrow;
    static void _wrssq(ulong, void*) @nogc nothrow;
    static void _wrssd(uint, void*) @nogc nothrow;
    alias __dev_t = c_ulong;
    alias __uid_t = uint;
    alias __gid_t = uint;
    alias __ino_t = c_ulong;
    alias __ino64_t = c_ulong;
    alias __mode_t = uint;
    alias __nlink_t = c_ulong;
    alias __off_t = c_long;
    alias __off64_t = c_long;
    alias __pid_t = int;
    struct __fsid_t
    {
        int[2] __val;
    }
    alias __clock_t = c_long;
    alias __rlim_t = c_ulong;
    alias __rlim64_t = c_ulong;
    alias __id_t = uint;
    alias __time_t = c_long;
    alias __useconds_t = uint;
    alias __suseconds_t = c_long;
    alias __daddr_t = int;
    alias __key_t = int;
    alias __clockid_t = int;
    alias __timer_t = void*;
    alias __blksize_t = c_long;
    alias __blkcnt_t = c_long;
    alias __blkcnt64_t = c_long;
    alias __fsblkcnt_t = c_ulong;
    alias __fsblkcnt64_t = c_ulong;
    alias __fsfilcnt_t = c_ulong;
    alias __fsfilcnt64_t = c_ulong;
    alias __fsword_t = c_long;
    alias __ssize_t = c_long;
    alias __syscall_slong_t = c_long;
    alias __syscall_ulong_t = c_ulong;
    alias __loff_t = c_long;
    alias __caddr_t = char*;
    alias __intptr_t = c_long;
    alias __socklen_t = uint;
    alias __sig_atomic_t = int;
    static void _rstorssp(void*) @nogc nothrow;
    struct _IO_FILE;
    alias FILE = _IO_FILE;
    struct __locale_struct
    {
        __locale_data*[13] __locales;
        const(ushort)* __ctype_b;
        const(int)* __ctype_tolower;
        const(int)* __ctype_toupper;
        const(char)*[13] __names;
    }
    alias __locale_t = __locale_struct*;
    static void _saveprevssp() @nogc nothrow;
    struct __sigset_t
    {
        c_ulong[16] __val;
    }
    static ulong _get_ssp() @nogc nothrow;
    union sigval
    {
        int sival_int;
        void* sival_ptr;
    }
    alias __sigval_t = sigval;
    alias clock_t = c_long;
    alias clockid_t = int;
    static ulong _rdsspq(ulong) @nogc nothrow;
    alias locale_t = __locale_struct*;
    alias sig_atomic_t = int;
    static uint _rdsspd(uint) @nogc nothrow;
    alias sigevent_t = sigevent;
    static void _inc_ssp(uint) @nogc nothrow;
    static void _incsspq(ulong) @nogc nothrow;
    static void _incsspd(int) @nogc nothrow;
    static long _mm_tzcnt_64(ulong) @nogc nothrow;
    struct siginfo_t
    {
        int si_signo;
        int si_errno;
        int si_code;
        int __pad0;
        static union _Anonymous_20
        {
            int[28] _pad;
            static struct _Anonymous_21
            {
                int si_pid;
                uint si_uid;
            }
            _Anonymous_21 _kill;
            static struct _Anonymous_22
            {
                int si_tid;
                int si_overrun;
                sigval si_sigval;
            }
            _Anonymous_22 _timer;
            static struct _Anonymous_23
            {
                int si_pid;
                uint si_uid;
                sigval si_sigval;
            }
            _Anonymous_23 _rt;
            static struct _Anonymous_24
            {
                int si_pid;
                uint si_uid;
                int si_status;
                c_long si_utime;
                c_long si_stime;
            }
            _Anonymous_24 _sigchld;
            static struct _Anonymous_25
            {
                void* si_addr;
                short si_addr_lsb;
                static union _Anonymous_26
                {
                    static struct _Anonymous_27
                    {
                        void* _lower;
                        void* _upper;
                    }
                    _Anonymous_27 _addr_bnd;
                    uint _pkey;
                }
                _Anonymous_26 _bounds;
            }
            _Anonymous_25 _sigfault;
            static struct _Anonymous_28
            {
                c_long si_band;
                int si_fd;
            }
            _Anonymous_28 _sigpoll;
            static struct _Anonymous_29
            {
                void* _call_addr;
                int _syscall;
                uint _arch;
            }
            _Anonymous_29 _sigsys;
        }
        _Anonymous_20 _sifields;
    }
    static ulong __tzcnt_u64(ulong) @nogc nothrow;
    static ulong __blsr_u64(ulong) @nogc nothrow;
    static ulong __blsmsk_u64(ulong) @nogc nothrow;
    static ulong __blsi_u64(ulong) @nogc nothrow;
    static ulong _bextr_u64(ulong, uint, uint) @nogc nothrow;
    static ulong __bextr_u64(ulong, ulong) @nogc nothrow;
    static ulong __andn_u64(ulong, ulong) @nogc nothrow;
    static int _mm_tzcnt_32(uint) @nogc nothrow;
    static uint __tzcnt_u32(uint) @nogc nothrow;
    static uint __blsr_u32(uint) @nogc nothrow;
    alias sigset_t = __sigset_t;
    static uint __blsmsk_u32(uint) @nogc nothrow;
    alias sigval_t = sigval;
    static uint __blsi_u32(uint) @nogc nothrow;
    struct stack_t
    {
        void* ss_sp;
        int ss_flags;
        c_ulong ss_size;
    }
    static uint _bextr_u32(uint, uint, uint) @nogc nothrow;
    struct iovec
    {
        void* iov_base;
        c_ulong iov_len;
    }
    struct itimerspec
    {
        timespec it_interval;
        timespec it_value;
    }
    static uint __bextr_u32(uint, uint) @nogc nothrow;
    struct osockaddr
    {
        ushort sa_family;
        ubyte[14] sa_data;
    }
    struct sched_param
    {
        int sched_priority;
    }
    static uint __andn_u32(uint, uint) @nogc nothrow;
    struct sigstack
    {
        void* ss_sp;
        int ss_onstack;
    }
    struct timespec
    {
        c_long tv_sec;
        c_long tv_nsec;
    }
    static ushort __tzcnt_u16(ushort) @nogc nothrow;
    struct timeval
    {
        c_long tv_sec;
        c_long tv_usec;
    }
    struct tm
    {
        int tm_sec;
        int tm_min;
        int tm_hour;
        int tm_mday;
        int tm_mon;
        int tm_year;
        int tm_wday;
        int tm_yday;
        int tm_isdst;
        c_long tm_gmtoff;
        const(char)* tm_zone;
    }
    alias time_t = c_long;
    static ulong _mulx_u64(ulong, ulong, ulong*) @nogc nothrow;
    alias timer_t = void*;
    static ulong _pext_u64(ulong, ulong) @nogc nothrow;
    static ulong _pdep_u64(ulong, ulong) @nogc nothrow;
    static ulong _bzhi_u64(ulong, ulong) @nogc nothrow;
    static uint _pext_u32(uint, uint) @nogc nothrow;
    static uint _pdep_u32(uint, uint) @nogc nothrow;
    static uint _bzhi_u32(uint, uint) @nogc nothrow;
    static core.simd.long4 _mm256_setr_m128i(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.double4 _mm256_setr_m128d(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.float8 _mm256_setr_m128(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.long4 _mm256_set_m128i(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.double4 _mm256_set_m128d(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.float8 _mm256_set_m128(core.simd.float4, core.simd.float4) @nogc nothrow;
    static void _mm256_storeu2_m128i(core.simd.long2*, core.simd.long2*, core.simd.long4) @nogc nothrow;
    static void _mm256_storeu2_m128d(double*, double*, core.simd.double4) @nogc nothrow;
    static void _mm256_storeu2_m128(float*, float*, core.simd.float8) @nogc nothrow;
    static core.simd.long4 _mm256_loadu2_m128i(const(core.simd.long2)*, const(core.simd.long2)*) @nogc nothrow;
    static ushort __uint16_identity(ushort) @nogc nothrow;
    static uint __uint32_identity(uint) @nogc nothrow;
    static c_ulong __uint64_identity(c_ulong) @nogc nothrow;
    static core.simd.double4 _mm256_loadu2_m128d(const(double)*, const(double)*) @nogc nothrow;
    static core.simd.float8 _mm256_loadu2_m128(const(float)*, const(float)*) @nogc nothrow;
    static core.simd.long4 _mm256_zextsi128_si256(core.simd.long2) @nogc nothrow;
    static core.simd.float8 _mm256_zextps128_ps256(core.simd.float4) @nogc nothrow;
    static core.simd.double4 _mm256_zextpd128_pd256(core.simd.double2) @nogc nothrow;
    static core.simd.long4 _mm256_castsi128_si256(core.simd.long2) @nogc nothrow;
    static core.simd.float8 _mm256_castps128_ps256(core.simd.float4) @nogc nothrow;
    static core.simd.double4 _mm256_castpd128_pd256(core.simd.double2) @nogc nothrow;
    static core.simd.long2 _mm256_castsi256_si128(core.simd.long4) @nogc nothrow;
    static core.simd.float4 _mm256_castps256_ps128(core.simd.float8) @nogc nothrow;
    static core.simd.double2 _mm256_castpd256_pd128(core.simd.double4) @nogc nothrow;
    static core.simd.double4 _mm256_castsi256_pd(core.simd.long4) @nogc nothrow;
    static core.simd.float8 _mm256_castsi256_ps(core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_castps_si256(core.simd.float8) @nogc nothrow;
    static core.simd.double4 _mm256_castps_pd(core.simd.float8) @nogc nothrow;
    static core.simd.long4 _mm256_castpd_si256(core.simd.double4) @nogc nothrow;
    static core.simd.float8 _mm256_castpd_ps(core.simd.double4) @nogc nothrow;
    static core.simd.long4 _mm256_setzero_si256() @nogc nothrow;
    static core.simd.float8 _mm256_setzero_ps() @nogc nothrow;
    static core.simd.double4 _mm256_setzero_pd() @nogc nothrow;
    static core.simd.long4 _mm256_set1_epi64x(long) @nogc nothrow;
    static core.simd.long4 _mm256_set1_epi8(char) @nogc nothrow;
    static core.simd.long4 _mm256_set1_epi16(short) @nogc nothrow;
    static core.simd.long4 _mm256_set1_epi32(int) @nogc nothrow;
    static core.simd.float8 _mm256_set1_ps(float) @nogc nothrow;
    static core.simd.double4 _mm256_set1_pd(double) @nogc nothrow;
    static core.simd.long4 _mm256_setr_epi64x(long, long, long, long) @nogc nothrow;
    static core.simd.long4 _mm256_setr_epi8(char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char) @nogc nothrow;
    static core.simd.long4 _mm256_setr_epi16(short, short, short, short, short, short, short, short, short, short, short, short, short, short, short, short) @nogc nothrow;
    static core.simd.long4 _mm256_setr_epi32(int, int, int, int, int, int, int, int) @nogc nothrow;
    enum _Anonymous_30
    {
        DT_UNKNOWN = 0,
        DT_FIFO = 1,
        DT_CHR = 2,
        DT_DIR = 4,
        DT_BLK = 6,
        DT_REG = 8,
        DT_LNK = 10,
        DT_SOCK = 12,
        DT_WHT = 14,
    }
    enum DT_UNKNOWN = _Anonymous_30.DT_UNKNOWN;
    enum DT_FIFO = _Anonymous_30.DT_FIFO;
    enum DT_CHR = _Anonymous_30.DT_CHR;
    enum DT_DIR = _Anonymous_30.DT_DIR;
    enum DT_BLK = _Anonymous_30.DT_BLK;
    enum DT_REG = _Anonymous_30.DT_REG;
    enum DT_LNK = _Anonymous_30.DT_LNK;
    enum DT_SOCK = _Anonymous_30.DT_SOCK;
    enum DT_WHT = _Anonymous_30.DT_WHT;
    static core.simd.float8 _mm256_setr_ps(float, float, float, float, float, float, float, float) @nogc nothrow;
    static core.simd.double4 _mm256_setr_pd(double, double, double, double) @nogc nothrow;
    static core.simd.long4 _mm256_set_epi64x(long, long, long, long) @nogc nothrow;
    static core.simd.long4 _mm256_set_epi8(char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char) @nogc nothrow;
    static core.simd.long4 _mm256_set_epi16(short, short, short, short, short, short, short, short, short, short, short, short, short, short, short, short) @nogc nothrow;
    alias DIR = __dirstream;
    struct __dirstream;
    __dirstream* opendir(const(char)*) @nogc nothrow;
    __dirstream* fdopendir(int) @nogc nothrow;
    int closedir(__dirstream*) @nogc nothrow;
    dirent* readdir(__dirstream*) @nogc nothrow;
    int readdir_r(__dirstream*, dirent*, dirent**) @nogc nothrow;
    void rewinddir(__dirstream*) @nogc nothrow;
    void seekdir(__dirstream*, c_long) @nogc nothrow;
    c_long telldir(__dirstream*) @nogc nothrow;
    int dirfd(__dirstream*) @nogc nothrow;
    static core.simd.long4 _mm256_set_epi32(int, int, int, int, int, int, int, int) @nogc nothrow;
    int scandir(const(char)*, dirent***, int function(const(dirent)*), int function(const(dirent)**, const(dirent)**)) @nogc nothrow;
    int alphasort(const(dirent)**, const(dirent)**) @nogc nothrow;
    c_long getdirentries(int, char*, c_ulong, c_long*) @nogc nothrow;
    static core.simd.float8 _mm256_set_ps(float, float, float, float, float, float, float, float) @nogc nothrow;
    static core.simd.double4 _mm256_set_pd(double, double, double, double) @nogc nothrow;
    static core.simd.long4 _mm256_undefined_si256() @nogc nothrow;
    static core.simd.float8 _mm256_undefined_ps() @nogc nothrow;
    static core.simd.double4 _mm256_undefined_pd() @nogc nothrow;
    static void _mm256_stream_ps(float*, core.simd.float8) @nogc nothrow;
    static void _mm256_stream_pd(double*, core.simd.double4) @nogc nothrow;
    static void _mm256_stream_si256(core.simd.long4*, core.simd.long4) @nogc nothrow;
    static void _mm_maskstore_ps(float*, core.simd.long2, core.simd.float4) @nogc nothrow;
    static void _mm256_maskstore_pd(double*, core.simd.long4, core.simd.double4) @nogc nothrow;
    static void _mm_maskstore_pd(double*, core.simd.long2, core.simd.double2) @nogc nothrow;
    static void _mm256_maskstore_ps(float*, core.simd.long4, core.simd.float8) @nogc nothrow;
    int* __errno_location() @nogc nothrow;
    static core.simd.float8 _mm256_maskload_ps(const(float)*, core.simd.long4) @nogc nothrow;
    static core.simd.float4 _mm_maskload_ps(const(float)*, core.simd.long2) @nogc nothrow;
    static core.simd.double4 _mm256_maskload_pd(const(double)*, core.simd.long4) @nogc nothrow;
    static core.simd.double2 _mm_maskload_pd(const(double)*, core.simd.long2) @nogc nothrow;
    static void _mm256_storeu_si256(core.simd.long4*, core.simd.long4) @nogc nothrow;
    static void _mm256_store_si256(core.simd.long4*, core.simd.long4) @nogc nothrow;
    static void _mm256_storeu_ps(float*, core.simd.float8) @nogc nothrow;
    static void _mm256_storeu_pd(double*, core.simd.double4) @nogc nothrow;
    static void _mm256_store_ps(float*, core.simd.float8) @nogc nothrow;
    static void _mm256_store_pd(double*, core.simd.double4) @nogc nothrow;
    static core.simd.long4 _mm256_lddqu_si256(const(core.simd.long4)*) @nogc nothrow;
    static core.simd.long4 _mm256_loadu_si256(const(core.simd.long4)*) @nogc nothrow;
    static core.simd.long4 _mm256_load_si256(const(core.simd.long4)*) @nogc nothrow;
    static core.simd.float8 _mm256_loadu_ps(const(float)*) @nogc nothrow;
    static core.simd.double4 _mm256_loadu_pd(const(double)*) @nogc nothrow;
    static core.simd.float8 _mm256_load_ps(const(float)*) @nogc nothrow;
    static core.simd.double4 _mm256_load_pd(const(double)*) @nogc nothrow;
    static core.simd.float8 _mm256_broadcast_ps(const(core.simd.float4)*) @nogc nothrow;
    static core.simd.double4 _mm256_broadcast_pd(const(core.simd.double2)*) @nogc nothrow;
    int fcntl(int, int, ...) @nogc nothrow;
    int open(const(char)*, int, ...) @nogc nothrow;
    int openat(int, const(char)*, int, ...) @nogc nothrow;
    int creat(const(char)*, uint) @nogc nothrow;
    static core.simd.float8 _mm256_broadcast_ss(const(float)*) @nogc nothrow;
    static core.simd.double4 _mm256_broadcast_sd(const(double)*) @nogc nothrow;
    int lockf(int, int, c_long) @nogc nothrow;
    int posix_fadvise(int, c_long, c_long, int) @nogc nothrow;
    int posix_fallocate(int, c_long, c_long) @nogc nothrow;
    static core.simd.float4 _mm_broadcast_ss(const(float)*) @nogc nothrow;
    static void _mm256_zeroupper() @nogc nothrow;
    static void _mm256_zeroall() @nogc nothrow;
    static int _mm256_movemask_ps(core.simd.float8) @nogc nothrow;
    static int _mm256_movemask_pd(core.simd.double4) @nogc nothrow;
    static int _mm256_testnzc_si256(core.simd.long4, core.simd.long4) @nogc nothrow;
    static int _mm256_testc_si256(core.simd.long4, core.simd.long4) @nogc nothrow;
    static int _mm256_testz_si256(core.simd.long4, core.simd.long4) @nogc nothrow;
    static int _mm256_testnzc_ps(core.simd.float8, core.simd.float8) @nogc nothrow;
    static int _mm256_testc_ps(core.simd.float8, core.simd.float8) @nogc nothrow;
    static int _mm256_testz_ps(core.simd.float8, core.simd.float8) @nogc nothrow;
    static int _mm256_testnzc_pd(core.simd.double4, core.simd.double4) @nogc nothrow;
    static int _mm256_testc_pd(core.simd.double4, core.simd.double4) @nogc nothrow;
    static int _mm256_testz_pd(core.simd.double4, core.simd.double4) @nogc nothrow;
    static int _mm_testnzc_ps(core.simd.float4, core.simd.float4) @nogc nothrow;
    static int _mm_testc_ps(core.simd.float4, core.simd.float4) @nogc nothrow;
    static int _mm_testz_ps(core.simd.float4, core.simd.float4) @nogc nothrow;
    static int _mm_testnzc_pd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static int _mm_testc_pd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static int _mm_testz_pd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.float8 _mm256_unpacklo_ps(core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.float8 _mm256_unpackhi_ps(core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.double4 _mm256_unpacklo_pd(core.simd.double4, core.simd.double4) @nogc nothrow;
    alias __gwchar_t = int;
    static core.simd.double4 _mm256_unpackhi_pd(core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.double4 _mm256_movedup_pd(core.simd.double4) @nogc nothrow;
    static core.simd.float8 _mm256_moveldup_ps(core.simd.float8) @nogc nothrow;
    static core.simd.float8 _mm256_movehdup_ps(core.simd.float8) @nogc nothrow;
    static float _mm256_cvtss_f32(core.simd.float8) @nogc nothrow;
    static int _mm256_cvtsi256_si32(core.simd.long4) @nogc nothrow;
    static double _mm256_cvtsd_f64(core.simd.double4) @nogc nothrow;
    static core.simd.long4 _mm256_cvttps_epi32(core.simd.float8) @nogc nothrow;
    static core.simd.long2 _mm256_cvtpd_epi32(core.simd.double4) @nogc nothrow;
    static core.simd.long2 _mm256_cvttpd_epi32(core.simd.double4) @nogc nothrow;
    static core.simd.double4 _mm256_cvtps_pd(core.simd.float4) @nogc nothrow;
    static core.simd.long4 _mm256_cvtps_epi32(core.simd.float8) @nogc nothrow;
    static core.simd.float4 _mm256_cvtpd_ps(core.simd.double4) @nogc nothrow;
    static core.simd.float8 _mm256_cvtepi32_ps(core.simd.long4) @nogc nothrow;
    static core.simd.double4 _mm256_cvtepi32_pd(core.simd.long2) @nogc nothrow;
    static core.simd.float8 _mm256_blendv_ps(core.simd.float8, core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.double4 _mm256_blendv_pd(core.simd.double4, core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.float8 _mm256_permutevar_ps(core.simd.float8, core.simd.long4) @nogc nothrow;
    static core.simd.float4 _mm_permutevar_ps(core.simd.float4, core.simd.long2) @nogc nothrow;
    static core.simd.double4 _mm256_permutevar_pd(core.simd.double4, core.simd.long4) @nogc nothrow;
    static core.simd.double2 _mm_permutevar_pd(core.simd.double2, core.simd.long2) @nogc nothrow;
    static core.simd.float8 _mm256_hsub_ps(core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.double4 _mm256_hsub_pd(core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.float8 _mm256_hadd_ps(core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.double4 _mm256_hadd_pd(core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.float8 _mm256_xor_ps(core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.double4 _mm256_xor_pd(core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.float8 _mm256_or_ps(core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.double4 _mm256_or_pd(core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.float8 _mm256_andnot_ps(core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.double4 _mm256_andnot_pd(core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.float8 _mm256_and_ps(core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.double4 _mm256_and_pd(core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.float8 _mm256_rcp_ps(core.simd.float8) @nogc nothrow;
    static core.simd.float8 _mm256_rsqrt_ps(core.simd.float8) @nogc nothrow;
    static core.simd.float8 _mm256_sqrt_ps(core.simd.float8) @nogc nothrow;
    static core.simd.double4 _mm256_sqrt_pd(core.simd.double4) @nogc nothrow;
    static core.simd.float8 _mm256_mul_ps(core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.double4 _mm256_mul_pd(core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.float8 _mm256_min_ps(core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.double4 _mm256_min_pd(core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.float8 _mm256_max_ps(core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.double4 _mm256_max_pd(core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.float8 _mm256_div_ps(core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.double4 _mm256_div_pd(core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.float8 _mm256_addsub_ps(core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.double4 _mm256_addsub_pd(core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.float8 _mm256_sub_ps(core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.double4 _mm256_sub_pd(core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.float8 _mm256_add_ps(core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.double4 _mm256_add_pd(core.simd.double4, core.simd.double4) @nogc nothrow;
    alias __m256i = core.simd.long4;
    alias __m256d = core.simd.double4;
    alias __m256 = core.simd.float8;
    alias __v32qs = core.simd.byte32;
    alias __v32qu = core.simd.ubyte32;
    alias __v16hu = core.simd.ushort16;
    alias __v8su = core.simd.uint8;
    alias __v4du = core.simd.ulong4;
    alias __v32qi = core.simd.char32;
    alias __v16hi = core.simd.short16;
    alias __v8si = core.simd.int8;
    alias __v4di = core.simd.long4;
    alias __v8sf = core.simd.float8;
    alias __v4df = core.simd.double4;
    static core.simd.long4 _mm256_maskz_popcnt_epi32(ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_popcnt_epi32(core.simd.long4, ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_popcnt_epi32(core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_popcnt_epi64(ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_popcnt_epi64(core.simd.long4, ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_popcnt_epi64(core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_popcnt_epi32(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_popcnt_epi32(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_popcnt_epi32(core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_popcnt_epi64(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_popcnt_epi64(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_popcnt_epi64(core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_popcnt_epi32(ushort, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_popcnt_epi32(core.simd.long8, ushort, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_popcnt_epi32(core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_popcnt_epi64(ubyte, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_popcnt_epi64(core.simd.long8, ubyte, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_popcnt_epi64(core.simd.long8) @nogc nothrow;
    struct imaxdiv_t
    {
        c_long quot;
        c_long rem;
    }
    c_long imaxabs(c_long) @nogc nothrow;
    imaxdiv_t imaxdiv(c_long, c_long) @nogc nothrow;
    c_long strtoimax(const(char)*, char**, int) @nogc nothrow;
    c_ulong strtoumax(const(char)*, char**, int) @nogc nothrow;
    c_long wcstoimax(const(int)*, int**, int) @nogc nothrow;
    c_ulong wcstoumax(const(int)*, int**, int) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_dpwssds_epi32(ushort, core.simd.long8, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_dpwssds_epi32(core.simd.long8, ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_dpwssds_epi32(core.simd.long8, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_dpwssd_epi32(ushort, core.simd.long8, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_dpwssd_epi32(core.simd.long8, ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_dpwssd_epi32(core.simd.long8, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_dpbusds_epi32(ushort, core.simd.long8, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_dpbusds_epi32(core.simd.long8, ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_dpbusds_epi32(core.simd.long8, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_dpbusd_epi32(ushort, core.simd.long8, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_dpbusd_epi32(core.simd.long8, ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_dpbusd_epi32(core.simd.long8, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long2 _mm_maskz_dpwssds_epi32(ubyte, core.simd.long2, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_dpwssds_epi32(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_dpwssds_epi32(core.simd.long2, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_dpwssd_epi32(ubyte, core.simd.long2, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_dpwssd_epi32(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_dpwssd_epi32(core.simd.long2, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_dpbusds_epi32(ubyte, core.simd.long2, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_dpbusds_epi32(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_dpbusds_epi32(core.simd.long2, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_dpbusd_epi32(ubyte, core.simd.long2, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_dpbusd_epi32(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_dpbusd_epi32(core.simd.long2, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_dpwssds_epi32(ubyte, core.simd.long4, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_dpwssds_epi32(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_dpwssds_epi32(core.simd.long4, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_dpwssd_epi32(ubyte, core.simd.long4, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_dpwssd_epi32(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_dpwssd_epi32(core.simd.long4, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_dpbusds_epi32(ubyte, core.simd.long4, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_dpbusds_epi32(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_dpbusds_epi32(core.simd.long4, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_dpbusd_epi32(ubyte, core.simd.long4, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_dpbusd_epi32(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_dpbusd_epi32(core.simd.long4, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_shrdv_epi16(ubyte, core.simd.long2, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_shrdv_epi16(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_shrdv_epi16(core.simd.long2, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_shrdv_epi16(ushort, core.simd.long4, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_shrdv_epi16(core.simd.long4, ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_shrdv_epi16(core.simd.long4, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_shrdv_epi32(ubyte, core.simd.long2, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_shrdv_epi32(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_shrdv_epi32(core.simd.long2, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_shrdv_epi32(ubyte, core.simd.long4, core.simd.long4, core.simd.long4) @nogc nothrow;
    struct arraylist_t
    {
        c_ulong len;
        c_ulong max;
        void** items;
        void*[29] _space;
    }
    arraylist_t* arraylist_new(arraylist_t*, c_ulong) @nogc nothrow;
    void arraylist_free(arraylist_t*) @nogc nothrow;
    void arraylist_push(arraylist_t*, void*) @nogc nothrow;
    void* arraylist_pop(arraylist_t*) @nogc nothrow;
    void arraylist_grow(arraylist_t*, c_ulong) @nogc nothrow;
    static core.simd.long4 _mm256_mask_shrdv_epi32(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_shrdv_epi32(core.simd.long4, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_shrdv_epi64(ubyte, core.simd.long2, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_shrdv_epi64(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_shrdv_epi64(core.simd.long2, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_shrdv_epi64(ubyte, core.simd.long4, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_shrdv_epi64(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_shrdv_epi64(core.simd.long4, core.simd.long4, core.simd.long4) @nogc nothrow;
    uint* bitvector_new(c_ulong, int) @nogc nothrow;
    uint* bitvector_resize(uint*, c_ulong, c_ulong, int) @nogc nothrow;
    c_ulong bitvector_nwords(c_ulong) @nogc nothrow;
    void bitvector_set(uint*, c_ulong, uint) @nogc nothrow;
    uint bitvector_get(uint*, c_ulong) @nogc nothrow;
    static core.simd.long2 _mm_maskz_shldv_epi16(ubyte, core.simd.long2, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_shldv_epi16(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_shldv_epi16(core.simd.long2, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_shldv_epi16(ushort, core.simd.long4, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_shldv_epi16(core.simd.long4, ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_shldv_epi16(core.simd.long4, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_shldv_epi32(ubyte, core.simd.long2, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_shldv_epi32(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    alias bool_t = int;
    alias byte_t = ubyte;
    static core.simd.long2 _mm_shldv_epi32(core.simd.long2, core.simd.long2, core.simd.long2) @nogc nothrow;
    alias uint_t = c_ulong;
    alias int_t = c_long;
    static uint next_power_of_two(uint) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_shldv_epi32(ubyte, core.simd.long4, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_shldv_epi32(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_shldv_epi32(core.simd.long4, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_shldv_epi64(ubyte, core.simd.long2, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_shldv_epi64(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_shldv_epi64(core.simd.long2, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_shldv_epi64(ubyte, core.simd.long4, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_shldv_epi64(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_shldv_epi64(core.simd.long4, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_expandloadu_epi8(uint, const(void)*) @nogc nothrow;
    static core.simd.long4 _mm256_mask_expandloadu_epi8(core.simd.long4, uint, const(void)*) @nogc nothrow;
    alias numerictype_t = _Anonymous_31;
    enum _Anonymous_31
    {
        T_INT8 = 0,
        T_UINT8 = 1,
        T_INT16 = 2,
        T_UINT16 = 3,
        T_INT32 = 4,
        T_UINT32 = 5,
        T_INT64 = 6,
        T_UINT64 = 7,
        T_FLOAT = 8,
        T_DOUBLE = 9,
    }
    enum T_INT8 = _Anonymous_31.T_INT8;
    enum T_UINT8 = _Anonymous_31.T_UINT8;
    enum T_INT16 = _Anonymous_31.T_INT16;
    enum T_UINT16 = _Anonymous_31.T_UINT16;
    enum T_INT32 = _Anonymous_31.T_INT32;
    enum T_UINT32 = _Anonymous_31.T_UINT32;
    enum T_INT64 = _Anonymous_31.T_INT64;
    enum T_UINT64 = _Anonymous_31.T_UINT64;
    enum T_FLOAT = _Anonymous_31.T_FLOAT;
    enum T_DOUBLE = _Anonymous_31.T_DOUBLE;
    static core.simd.long4 _mm256_maskz_expandloadu_epi16(ushort, const(void)*) @nogc nothrow;
    static core.simd.long4 _mm256_mask_expandloadu_epi16(core.simd.long4, ushort, const(void)*) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_expand_epi8(uint, core.simd.long4) @nogc nothrow;
    c_ulong nextipow2(c_ulong) @nogc nothrow;
    uint int32hash(uint) @nogc nothrow;
    c_ulong int64hash(c_ulong) @nogc nothrow;
    uint int64to32hash(c_ulong) @nogc nothrow;
    static core.simd.long4 _mm256_mask_expand_epi8(core.simd.long4, uint, core.simd.long4) @nogc nothrow;
    c_ulong memhash(const(char)*, c_ulong) @nogc nothrow;
    c_ulong memhash_seed(const(char)*, c_ulong, uint) @nogc nothrow;
    uint memhash32(const(char)*, c_ulong) @nogc nothrow;
    uint memhash32_seed(const(char)*, c_ulong, uint) @nogc nothrow;
    static c_ulong bitmix(c_ulong, c_ulong) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_expand_epi16(ushort, core.simd.long4) @nogc nothrow;
    struct htable_t
    {
        c_ulong size;
        void** table;
        void*[32] _space;
    }
    static core.simd.long4 _mm256_mask_expand_epi16(core.simd.long4, ushort, core.simd.long4) @nogc nothrow;
    htable_t* htable_new(htable_t*, c_ulong) @nogc nothrow;
    void htable_free(htable_t*) @nogc nothrow;
    void htable_reset(htable_t*, c_ulong) @nogc nothrow;
    static void _mm256_mask_compressstoreu_epi8(void*, uint, core.simd.long4) @nogc nothrow;
    alias bufmode_t = _Anonymous_32;
    enum _Anonymous_32
    {
        bm_none = 19,
        bm_line = 20,
        bm_block = 21,
        bm_mem = 22,
    }
    enum bm_none = _Anonymous_32.bm_none;
    enum bm_line = _Anonymous_32.bm_line;
    enum bm_block = _Anonymous_32.bm_block;
    enum bm_mem = _Anonymous_32.bm_mem;
    alias bufstate_t = _Anonymous_33;
    enum _Anonymous_33
    {
        bst_none = 0,
        bst_rd = 1,
        bst_wr = 2,
    }
    enum bst_none = _Anonymous_33.bst_none;
    enum bst_rd = _Anonymous_33.bst_rd;
    enum bst_wr = _Anonymous_33.bst_wr;
    static void _mm256_mask_compressstoreu_epi16(void*, ushort, core.simd.long4) @nogc nothrow;
    struct ios_t
    {
        import std.bitmanip: bitfields;

        align(4):
        char* buf;
        int errcode;
        int _pad_bm;
        bufmode_t bm;
        bufstate_t state;
        c_long maxsize;
        c_long size;
        c_long bpos;
        c_long ndirty;
        c_long fpos;
        c_ulong lineno;
        c_ulong u_colno;
        c_long fd;
        mixin(bitfields!(
            ubyte, "readable", 1,
            ubyte, "writable", 1,
            ubyte, "ownbuf", 1,
            ubyte, "ownfd", 1,
            ubyte, "_eof", 1,
            ubyte, "rereadable", 1,
            uint, "_padding_0", 2
        ));
        c_long userdata;
        char[54] local;
    }
    extern __gshared void function(int) ios_set_io_wait_func;
    c_ulong ios_read(ios_t*, char*, c_ulong) @nogc nothrow;
    c_ulong ios_readall(ios_t*, char*, c_ulong) @nogc nothrow;
    c_ulong ios_write(ios_t*, const(char)*, c_ulong) @nogc nothrow;
    c_long ios_seek(ios_t*, c_long) @nogc nothrow;
    c_long ios_seek_end(ios_t*) @nogc nothrow;
    c_long ios_skip(ios_t*, c_long) @nogc nothrow;
    c_long ios_pos(ios_t*) @nogc nothrow;
    int ios_trunc(ios_t*, c_ulong) @nogc nothrow;
    int ios_eof(ios_t*) @nogc nothrow;
    int ios_eof_blocking(ios_t*) @nogc nothrow;
    int ios_flush(ios_t*) @nogc nothrow;
    void ios_close(ios_t*) @nogc nothrow;
    int ios_isopen(ios_t*) @nogc nothrow;
    char* ios_take_buffer(ios_t*, c_ulong*) @nogc nothrow;
    int ios_setbuf(ios_t*, char*, c_ulong, int) @nogc nothrow;
    int ios_bufmode(ios_t*, bufmode_t) @nogc nothrow;
    int ios_get_readable(ios_t*) @nogc nothrow;
    int ios_get_writable(ios_t*) @nogc nothrow;
    void ios_set_readonly(ios_t*) @nogc nothrow;
    c_ulong ios_copy(ios_t*, ios_t*, c_ulong) @nogc nothrow;
    c_ulong ios_copyall(ios_t*, ios_t*) @nogc nothrow;
    c_ulong ios_copyuntil(ios_t*, ios_t*, char) @nogc nothrow;
    c_ulong ios_nchomp(ios_t*, c_ulong) @nogc nothrow;
    c_ulong ios_readprep(ios_t*, c_ulong) @nogc nothrow;
    ios_t* ios_file(ios_t*, const(char)*, int, int, int, int) @nogc nothrow;
    ios_t* ios_mkstemp(ios_t*, char*) @nogc nothrow;
    ios_t* ios_mem(ios_t*, c_ulong) @nogc nothrow;
    ios_t* ios_str(ios_t*, char*) @nogc nothrow;
    ios_t* ios_static_buffer(ios_t*, char*, c_ulong) @nogc nothrow;
    ios_t* ios_fd(ios_t*, c_long, int, int) @nogc nothrow;
    extern __gshared ios_t* ios_stdin;
    extern __gshared ios_t* ios_stdout;
    extern __gshared ios_t* ios_stderr;
    void ios_init_stdstreams() @nogc nothrow;
    int ios_pututf8(ios_t*, uint) @nogc nothrow;
    int ios_printf(ios_t*, const(char)*, ...) @nogc nothrow;
    int ios_vprintf(ios_t*, const(char)*, va_list*) @nogc nothrow;
    int ios_getutf8(ios_t*, uint*) @nogc nothrow;
    int ios_peekutf8(ios_t*, uint*) @nogc nothrow;
    char* ios_readline(ios_t*) @nogc nothrow;
    void ios_purge(ios_t*) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_compress_epi8(uint, core.simd.long4) @nogc nothrow;
    int ios_putc(int, ios_t*) @nogc nothrow;
    int ios_getc(ios_t*) @nogc nothrow;
    int ios_peekc(ios_t*) @nogc nothrow;
    int ios_ungetc(int, ios_t*) @nogc nothrow;
    static core.simd.long4 _mm256_mask_compress_epi8(core.simd.long4, uint, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_compress_epi16(ushort, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_compress_epi16(core.simd.long4, ushort, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_expandloadu_epi8(ushort, const(void)*) @nogc nothrow;
    static core.simd.long2 _mm_mask_expandloadu_epi8(core.simd.long2, ushort, const(void)*) @nogc nothrow;
    static core.simd.long2 _mm_maskz_expandloadu_epi16(ubyte, const(void)*) @nogc nothrow;
    alias jl_taggedvalue_t = _jl_taggedvalue_t;
    struct _jl_taggedvalue_t
    {
        static union _Anonymous_34
        {
            c_ulong header;
            _jl_taggedvalue_t* next;
            _jl_value_t* type;
            _jl_taggedvalue_bits bits;
        }
        _Anonymous_34 _anonymous_35;
        auto header() @property @nogc pure nothrow { return _anonymous_35.header; }
        void header(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_35.header = val; }
        auto next() @property @nogc pure nothrow { return _anonymous_35.next; }
        void next(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_35.next = val; }
        auto type() @property @nogc pure nothrow { return _anonymous_35.type; }
        void type(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_35.type = val; }
        auto bits() @property @nogc pure nothrow { return _anonymous_35.bits; }
        void bits(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_35.bits = val; }
    }
    alias jl_value_t = _jl_value_t;
    struct _jl_taggedvalue_bits
    {
        import std.bitmanip: bitfields;

        align(4):
        mixin(bitfields!(
            c_ulong, "gc", 2,
            uint, "_padding_0", 6
        ));
    }
    static core.simd.long2 _mm_mask_expandloadu_epi16(core.simd.long2, ubyte, const(void)*) @nogc nothrow;
    static core.simd.long2 _mm_maskz_expand_epi8(ushort, core.simd.long2) @nogc nothrow;
    static void jl_set_typeof(void*, void*) @nogc nothrow;
    alias jl_sym_t = _jl_sym_t;
    struct _jl_sym_t
    {
        _jl_sym_t* left;
        _jl_sym_t* right;
        c_ulong hash;
    }
    alias jl_ssavalue_t = _jl_ssavalue_t;
    struct _jl_ssavalue_t
    {
        c_long id;
    }
    struct jl_svec_t
    {
        c_ulong length;
    }
    struct jl_array_flags_t
    {
        import std.bitmanip: bitfields;

        align(4):
        mixin(bitfields!(
            ushort, "how", 2,
            ushort, "ndims", 10,
            ushort, "pooled", 1,
            ushort, "ptrarray", 1,
            ushort, "isshared", 1,
            ushort, "isaligned", 1,
        ));
    }
    struct jl_array_t
    {
        void* data;
        c_ulong length;
        jl_array_flags_t flags;
        ushort elsize;
        uint offset;
        c_ulong nrows;
        static union _Anonymous_36
        {
            c_ulong maxsize;
            c_ulong ncols;
        }
        _Anonymous_36 _anonymous_37;
        auto maxsize() @property @nogc pure nothrow { return _anonymous_37.maxsize; }
        void maxsize(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_37.maxsize = val; }
        auto ncols() @property @nogc pure nothrow { return _anonymous_37.ncols; }
        void ncols(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_37.ncols = val; }
    }
    static int jl_array_ndimwords(uint) @nogc nothrow;
    alias jl_tupletype_t = _jl_datatype_t;
    struct _jl_datatype_t
    {
        jl_typename_t* name;
        _jl_datatype_t* super_;
        jl_svec_t* parameters;
        jl_svec_t* types;
        jl_svec_t* names;
        _jl_value_t* instance;
        const(jl_datatype_layout_t)* layout;
        int size;
        int ninitialized;
        uint uid;
        ubyte abstract_;
        ubyte mutabl;
        ubyte hasfreetypevars;
        ubyte isconcretetype;
        ubyte isdispatchtuple;
        ubyte isbitstype;
        ubyte zeroinit;
        ubyte isinlinealloc;
        void* struct_decl;
        void* ditype;
    }
    struct _jl_method_instance_t
    {
        static union _Anonymous_38
        {
            _jl_value_t* value;
            _jl_module_t* module_;
            _jl_method_t* method;
        }
        _Anonymous_38 def;
        _jl_value_t* specTypes;
        _jl_value_t* rettype;
        jl_svec_t* sparam_vals;
        jl_array_t* backedges;
        _jl_value_t* inferred;
        _jl_value_t* inferred_const;
        c_ulong min_world;
        c_ulong max_world;
        ubyte inInference;
        ubyte compile_traced;
        _jl_value_t* function(_jl_method_instance_t*, _jl_value_t**, uint) invoke;
        jl_generic_specptr_t specptr;
        _jl_llvm_functions_t functionObjectsDecls;
    }
    alias jl_typemap_t = _jl_value_t;
    alias jl_call_t = _jl_value_t* function(_jl_method_instance_t*, _jl_value_t**, uint);
    alias jl_callptr_t = _jl_value_t* function(_jl_method_instance_t*, _jl_value_t**, uint);
    _jl_value_t* jl_fptr_trampoline(_jl_method_instance_t*, _jl_value_t**, uint) @nogc nothrow;
    _jl_value_t* jl_fptr_args(_jl_method_instance_t*, _jl_value_t**, uint) @nogc nothrow;
    alias jl_fptr_args_t = _jl_value_t* function(_jl_value_t*, _jl_value_t**, uint);
    _jl_value_t* jl_fptr_const_return(_jl_method_instance_t*, _jl_value_t**, uint) @nogc nothrow;
    _jl_value_t* jl_fptr_sparam(_jl_method_instance_t*, _jl_value_t**, uint) @nogc nothrow;
    alias jl_fptr_sparam_t = _jl_value_t* function(jl_svec_t*, _jl_value_t*, _jl_value_t**, uint);
    _jl_value_t* jl_fptr_interpret_call(_jl_method_instance_t*, _jl_value_t**, uint) @nogc nothrow;
    alias jl_fptr_interpret_t = _jl_value_t* function(_jl_method_instance_t*, _jl_value_t*, _jl_value_t**, uint, jl_svec_t*);
    union jl_generic_specptr_t
    {
        void* fptr;
        _jl_value_t* function(_jl_value_t*, _jl_value_t**, uint) fptr1;
        _jl_value_t* function(jl_svec_t*, _jl_value_t*, _jl_value_t**, uint) fptr3;
        _jl_value_t* function(_jl_method_instance_t*, _jl_value_t*, _jl_value_t**, uint, jl_svec_t*) fptr4;
    }
    alias jl_llvm_functions_t = _jl_llvm_functions_t;
    struct _jl_llvm_functions_t
    {
        const(char)* functionObject;
        const(char)* specFunctionObject;
    }
    alias jl_code_info_t = _jl_code_info_t;
    struct _jl_code_info_t
    {
        jl_array_t* code;
        _jl_value_t* codelocs;
        _jl_value_t* method_for_inference_limit_heuristics;
        _jl_value_t* ssavaluetypes;
        _jl_value_t* linetable;
        jl_array_t* ssaflags;
        jl_array_t* slotflags;
        jl_array_t* slotnames;
        ubyte inferred;
        ubyte inlineable;
        ubyte propagate_inbounds;
        ubyte pure_;
    }
    alias jl_method_t = _jl_method_t;
    struct _jl_method_t
    {
        _jl_sym_t* name;
        _jl_module_t* module_;
        _jl_sym_t* file;
        int line;
        _jl_value_t* sig;
        c_ulong min_world;
        c_ulong max_world;
        _jl_value_t* ambig;
        _jl_value_t* specializations;
        jl_svec_t* sparam_syms;
        _jl_value_t* source;
        _jl_method_instance_t* unspecialized;
        _jl_value_t* generator;
        jl_array_t* roots;
        _jl_value_t* invokes;
        int nargs;
        int called;
        int nospecialize;
        ubyte isva;
        ubyte pure_;
        ubyte traced;
        jl_mutex_t writelock;
    }
    struct _jl_module_t
    {
        _jl_sym_t* name;
        _jl_module_t* parent;
        htable_t bindings;
        arraylist_t usings;
        c_ulong build_id;
        jl_uuid_t uuid;
        c_ulong primary_world;
        uint counter;
        int nospecialize;
        ubyte istopmod;
    }
    alias jl_method_instance_t = _jl_method_instance_t;
    alias jl_function_t = _jl_value_t;
    struct jl_tvar_t
    {
        _jl_sym_t* name;
        _jl_value_t* lb;
        _jl_value_t* ub;
    }
    struct jl_unionall_t
    {
        jl_tvar_t* var;
        _jl_value_t* body_;
    }
    struct jl_typename_t
    {
        _jl_sym_t* name;
        _jl_module_t* module_;
        jl_svec_t* names;
        _jl_value_t* wrapper;
        jl_svec_t* cache;
        jl_svec_t* linearcache;
        c_long hash;
        _jl_methtable_t* mt;
    }
    struct _jl_methtable_t
    {
        _jl_sym_t* name;
        _jl_value_t* defs;
        _jl_value_t* cache;
        c_long max_args;
        _jl_value_t* kwsorter;
        _jl_module_t* module_;
        jl_array_t* backedges;
        jl_mutex_t writelock;
    }
    struct jl_uniontype_t
    {
        _jl_value_t* a;
        _jl_value_t* b;
    }
    struct jl_fielddesc8_t
    {
        import std.bitmanip: bitfields;

        align(4):
        mixin(bitfields!(
            ubyte, "isptr", 1,
            ubyte, "size", 7,
        ));
        ubyte offset;
    }
    struct jl_fielddesc16_t
    {
        import std.bitmanip: bitfields;

        align(4):
        mixin(bitfields!(
            ushort, "isptr", 1,
            ushort, "size", 15,
        ));
        ushort offset;
    }
    struct jl_fielddesc32_t
    {
        import std.bitmanip: bitfields;

        align(4):
        mixin(bitfields!(
            uint, "isptr", 1,
            uint, "size", 31,
        ));
        uint offset;
    }
    struct jl_datatype_layout_t
    {
        import std.bitmanip: bitfields;

        align(4):
        uint nfields;
        mixin(bitfields!(
            uint, "alignment", 9,
            uint, "haspadding", 1,
            uint, "npointers", 20,
            uint, "fielddesc_type", 2,
        ));
    }
    alias jl_datatype_t = _jl_datatype_t;
    struct jl_weakref_t
    {
        _jl_value_t* value;
    }
    struct jl_binding_t
    {
        import std.bitmanip: bitfields;

        align(4):
        _jl_sym_t* name;
        _jl_value_t* value;
        _jl_value_t* globalref;
        _jl_module_t* owner;
        mixin(bitfields!(
            ubyte, "constp", 1,
            ubyte, "exportp", 1,
            ubyte, "imported", 1,
            ubyte, "deprecated_", 2,
            uint, "_padding_0", 3
        ));
    }
    struct jl_uuid_t
    {
        c_ulong hi;
        c_ulong lo;
    }
    alias jl_module_t = _jl_module_t;
    alias jl_typemap_entry_t = _jl_typemap_entry_t;
    struct _jl_typemap_entry_t
    {
        _jl_typemap_entry_t* next;
        _jl_datatype_t* sig;
        _jl_datatype_t* simplesig;
        jl_svec_t* guardsigs;
        c_ulong min_world;
        c_ulong max_world;
        static union _Anonymous_39
        {
            _jl_value_t* value;
            _jl_method_instance_t* linfo;
            _jl_method_t* method;
        }
        _Anonymous_39 func;
        byte isleafsig;
        byte issimplesig;
        byte va;
    }
    struct jl_ordereddict_t
    {
        jl_array_t* indices;
        jl_array_t* values;
    }
    alias jl_typemap_level_t = _jl_typemap_level_t;
    struct _jl_typemap_level_t
    {
        jl_ordereddict_t arg1;
        jl_ordereddict_t targ;
        _jl_typemap_entry_t* linear;
        _jl_value_t* any;
        _jl_value_t* key;
    }
    alias jl_methtable_t = _jl_methtable_t;
    struct jl_expr_t
    {
        _jl_sym_t* head;
        jl_array_t* args;
    }
    extern __gshared _jl_datatype_t* jl_typeofbottom_type;
    extern __gshared _jl_datatype_t* jl_datatype_type;
    extern __gshared _jl_datatype_t* jl_uniontype_type;
    extern __gshared _jl_datatype_t* jl_unionall_type;
    extern __gshared _jl_datatype_t* jl_tvar_type;
    extern __gshared _jl_datatype_t* jl_any_type;
    extern __gshared jl_unionall_t* jl_type_type;
    extern __gshared jl_unionall_t* jl_typetype_type;
    extern __gshared _jl_datatype_t* jl_typename_type;
    extern __gshared jl_typename_t* jl_type_typename;
    extern __gshared _jl_datatype_t* jl_sym_type;
    extern __gshared _jl_datatype_t* jl_symbol_type;
    extern __gshared _jl_datatype_t* jl_ssavalue_type;
    extern __gshared _jl_datatype_t* jl_abstractslot_type;
    extern __gshared _jl_datatype_t* jl_slotnumber_type;
    extern __gshared _jl_datatype_t* jl_typedslot_type;
    extern __gshared _jl_datatype_t* jl_simplevector_type;
    extern __gshared jl_typename_t* jl_tuple_typename;
    extern __gshared jl_typename_t* jl_vecelement_typename;
    extern __gshared _jl_datatype_t* jl_anytuple_type;
    extern __gshared _jl_datatype_t* jl_emptytuple_type;
    static core.simd.long2 _mm_mask_expand_epi8(core.simd.long2, ushort, core.simd.long2) @nogc nothrow;
    extern __gshared jl_unionall_t* jl_anytuple_type_type;
    extern __gshared jl_unionall_t* jl_vararg_type;
    extern __gshared jl_typename_t* jl_vararg_typename;
    extern __gshared _jl_datatype_t* jl_task_type;
    extern __gshared _jl_datatype_t* jl_function_type;
    extern __gshared _jl_datatype_t* jl_builtin_type;
    extern __gshared _jl_value_t* jl_bottom_type;
    extern __gshared _jl_datatype_t* jl_method_instance_type;
    extern __gshared _jl_datatype_t* jl_code_info_type;
    extern __gshared _jl_datatype_t* jl_method_type;
    extern __gshared _jl_datatype_t* jl_module_type;
    extern __gshared jl_unionall_t* jl_abstractarray_type;
    extern __gshared jl_unionall_t* jl_densearray_type;
    extern __gshared jl_unionall_t* jl_array_type;
    extern __gshared jl_typename_t* jl_array_typename;
    extern __gshared _jl_datatype_t* jl_weakref_type;
    extern __gshared _jl_datatype_t* jl_abstractstring_type;
    extern __gshared _jl_datatype_t* jl_string_type;
    extern __gshared _jl_datatype_t* jl_errorexception_type;
    extern __gshared _jl_datatype_t* jl_argumenterror_type;
    extern __gshared _jl_datatype_t* jl_loaderror_type;
    extern __gshared _jl_datatype_t* jl_initerror_type;
    extern __gshared _jl_datatype_t* jl_typeerror_type;
    extern __gshared _jl_datatype_t* jl_methoderror_type;
    extern __gshared _jl_datatype_t* jl_undefvarerror_type;
    extern __gshared _jl_datatype_t* jl_lineinfonode_type;
    extern __gshared _jl_value_t* jl_stackovf_exception;
    extern __gshared _jl_value_t* jl_memory_exception;
    extern __gshared _jl_value_t* jl_readonlymemory_exception;
    extern __gshared _jl_value_t* jl_diverror_exception;
    extern __gshared _jl_value_t* jl_undefref_exception;
    extern __gshared _jl_value_t* jl_interrupt_exception;
    extern __gshared _jl_datatype_t* jl_boundserror_type;
    extern __gshared _jl_value_t* jl_an_empty_vec_any;
    extern __gshared _jl_datatype_t* jl_bool_type;
    extern __gshared _jl_datatype_t* jl_char_type;
    extern __gshared _jl_datatype_t* jl_int8_type;
    extern __gshared _jl_datatype_t* jl_uint8_type;
    extern __gshared _jl_datatype_t* jl_int16_type;
    extern __gshared _jl_datatype_t* jl_uint16_type;
    extern __gshared _jl_datatype_t* jl_int32_type;
    extern __gshared _jl_datatype_t* jl_uint32_type;
    extern __gshared _jl_datatype_t* jl_int64_type;
    extern __gshared _jl_datatype_t* jl_uint64_type;
    extern __gshared _jl_datatype_t* jl_float16_type;
    extern __gshared _jl_datatype_t* jl_float32_type;
    extern __gshared _jl_datatype_t* jl_float64_type;
    extern __gshared _jl_datatype_t* jl_floatingpoint_type;
    extern __gshared _jl_datatype_t* jl_number_type;
    extern __gshared _jl_datatype_t* jl_void_type;
    extern __gshared _jl_datatype_t* jl_signed_type;
    extern __gshared _jl_datatype_t* jl_voidpointer_type;
    extern __gshared jl_unionall_t* jl_pointer_type;
    extern __gshared jl_unionall_t* jl_ref_type;
    extern __gshared jl_typename_t* jl_pointer_typename;
    extern __gshared jl_typename_t* jl_namedtuple_typename;
    extern __gshared jl_unionall_t* jl_namedtuple_type;
    extern __gshared _jl_value_t* jl_array_uint8_type;
    extern __gshared _jl_value_t* jl_array_any_type;
    extern __gshared _jl_value_t* jl_array_symbol_type;
    extern __gshared _jl_value_t* jl_array_int32_type;
    extern __gshared _jl_datatype_t* jl_expr_type;
    extern __gshared _jl_datatype_t* jl_globalref_type;
    extern __gshared _jl_datatype_t* jl_linenumbernode_type;
    extern __gshared _jl_datatype_t* jl_gotonode_type;
    extern __gshared _jl_datatype_t* jl_phinode_type;
    extern __gshared _jl_datatype_t* jl_pinode_type;
    extern __gshared _jl_datatype_t* jl_phicnode_type;
    extern __gshared _jl_datatype_t* jl_upsilonnode_type;
    extern __gshared _jl_datatype_t* jl_quotenode_type;
    extern __gshared _jl_datatype_t* jl_newvarnode_type;
    extern __gshared _jl_datatype_t* jl_intrinsic_type;
    extern __gshared _jl_datatype_t* jl_methtable_type;
    extern __gshared _jl_datatype_t* jl_typemap_level_type;
    extern __gshared _jl_datatype_t* jl_typemap_entry_type;
    extern __gshared jl_svec_t* jl_emptysvec;
    extern __gshared _jl_value_t* jl_emptytuple;
    extern __gshared _jl_value_t* jl_true;
    extern __gshared _jl_value_t* jl_false;
    extern __gshared _jl_value_t* jl_nothing;
    extern __gshared _jl_sym_t* jl_incomplete_sym;
    alias jl_gcframe_t = _jl_gcframe_t;
    static core.simd.long2 _mm_maskz_expand_epi16(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_expand_epi16(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static void _mm_mask_compressstoreu_epi8(void*, ushort, core.simd.long2) @nogc nothrow;
    static void _mm_mask_compressstoreu_epi16(void*, ubyte, core.simd.long2) @nogc nothrow;
    int jl_gc_enable(int) @nogc nothrow;
    int jl_gc_is_enabled() @nogc nothrow;
    c_long jl_gc_total_bytes() @nogc nothrow;
    c_ulong jl_gc_total_hrtime() @nogc nothrow;
    c_long jl_gc_diff_total_bytes() @nogc nothrow;
    void jl_gc_collect(int) @nogc nothrow;
    void jl_gc_add_finalizer(_jl_value_t*, _jl_value_t*) @nogc nothrow;
    void jl_finalize(_jl_value_t*) @nogc nothrow;
    jl_weakref_t* jl_gc_new_weakref(_jl_value_t*) @nogc nothrow;
    _jl_value_t* jl_gc_alloc_0w() @nogc nothrow;
    _jl_value_t* jl_gc_alloc_1w() @nogc nothrow;
    _jl_value_t* jl_gc_alloc_2w() @nogc nothrow;
    _jl_value_t* jl_gc_alloc_3w() @nogc nothrow;
    _jl_value_t* jl_gc_allocobj(c_ulong) @nogc nothrow;
    void* jl_malloc_stack(c_ulong*, _jl_task_t*) @nogc nothrow;
    void jl_free_stack(void*, c_ulong) @nogc nothrow;
    void jl_gc_use(_jl_value_t*) @nogc nothrow;
    void jl_clear_malloc_data() @nogc nothrow;
    void jl_gc_queue_root(_jl_value_t*) @nogc nothrow;
    static void jl_gc_wb(void*, void*) @nogc nothrow;
    static void jl_gc_wb_back(void*) @nogc nothrow;
    void* jl_gc_managed_malloc(c_ulong) @nogc nothrow;
    void* jl_gc_managed_realloc(void*, c_ulong, c_ulong, int, _jl_value_t*) @nogc nothrow;
    static core.simd.long2 _mm_maskz_compress_epi8(ushort, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_compress_epi8(core.simd.long2, ushort, core.simd.long2) @nogc nothrow;
    static _jl_value_t* jl_svecref(void*, c_ulong) @nogc nothrow;
    static _jl_value_t* jl_svecset(void*, c_ulong, void*) @nogc nothrow;
    static core.simd.long2 _mm_maskz_compress_epi16(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_compress_epi16(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm256_maskz_cvtps_ph(ubyte, core.simd.float8) @nogc nothrow;
    char* jl_array_typetagdata(jl_array_t*) @nogc nothrow;
    static _jl_value_t* jl_array_ptr_ref(void*, c_ulong) @nogc nothrow;
    static _jl_value_t* jl_array_ptr_set(void*, c_ulong, void*) @nogc nothrow;
    static ubyte jl_array_uint8_ref(void*, c_ulong) @nogc nothrow;
    static void jl_array_uint8_set(void*, c_ulong, ubyte) @nogc nothrow;
    static core.simd.long2 _mm256_mask_cvtps_ph(core.simd.long2, ubyte, core.simd.float8) @nogc nothrow;
    static core.simd.long2 _mm_maskz_cvtps_ph(ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.long2 _mm_mask_cvtps_ph(core.simd.long2, ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.float8 _mm256_maskz_cvtph_ps(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.float8 _mm256_mask_cvtph_ps(core.simd.float8, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.float4 _mm_maskz_cvtph_ps(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.float4 _mm_mask_cvtph_ps(core.simd.float4, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.float8 _mm256_maskz_mov_ps(ubyte, core.simd.float8) @nogc nothrow;
    static core.simd.float8 _mm256_mask_mov_ps(core.simd.float8, ubyte, core.simd.float8) @nogc nothrow;
    static core.simd.float4 _mm_maskz_mov_ps(ubyte, core.simd.float4) @nogc nothrow;
    static jl_svec_t* jl_field_names(_jl_datatype_t*) @nogc nothrow;
    static _jl_sym_t* jl_field_name(_jl_datatype_t*, c_ulong) @nogc nothrow;
    static core.simd.float4 _mm_mask_mov_ps(core.simd.float4, ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.double4 _mm256_maskz_mov_pd(ubyte, core.simd.double4) @nogc nothrow;
    static core.simd.double4 _mm256_mask_mov_pd(core.simd.double4, ubyte, core.simd.double4) @nogc nothrow;
    static char* jl_symbol_name_(_jl_sym_t*) @nogc nothrow;
    static core.simd.double2 _mm_maskz_mov_pd(ubyte, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_mask_mov_pd(core.simd.double2, ubyte, core.simd.double2) @nogc nothrow;
    static uint jl_field_offset(_jl_datatype_t*, int) @nogc nothrow;
    static uint jl_field_size(_jl_datatype_t*, int) @nogc nothrow;
    static int jl_field_isptr(_jl_datatype_t*, int) @nogc nothrow;
    static uint jl_fielddesc_size(byte) @nogc nothrow;
    static int jl_is_layout_opaque(const(jl_datatype_layout_t)*) @nogc nothrow;
    static core.simd.float8 _mm256_maskz_moveldup_ps(ubyte, core.simd.float8) @nogc nothrow;
    static core.simd.float8 _mm256_mask_moveldup_ps(core.simd.float8, ubyte, core.simd.float8) @nogc nothrow;
    static core.simd.float4 _mm_maskz_moveldup_ps(ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_mask_moveldup_ps(core.simd.float4, ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.float8 _mm256_maskz_movehdup_ps(ubyte, core.simd.float8) @nogc nothrow;
    static core.simd.float8 _mm256_mask_movehdup_ps(core.simd.float8, ubyte, core.simd.float8) @nogc nothrow;
    static core.simd.float4 _mm_maskz_movehdup_ps(ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_mask_movehdup_ps(core.simd.float4, ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_permutexvar_epi32(ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_permutexvar_epi32(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.float8 _mm256_maskz_permutexvar_ps(ubyte, core.simd.long4, core.simd.float8) @nogc nothrow;
    static core.simd.float8 _mm256_mask_permutexvar_ps(core.simd.float8, ubyte, core.simd.long4, core.simd.float8) @nogc nothrow;
    static core.simd.long4 _mm256_mask_permutexvar_epi64(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_permutexvar_epi64(ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_permutexvar_epi64(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.double4 _mm256_maskz_permutexvar_pd(ubyte, core.simd.long4, core.simd.double4) @nogc nothrow;
    static core.simd.double4 _mm256_mask_permutexvar_pd(core.simd.double4, ubyte, core.simd.long4, core.simd.double4) @nogc nothrow;
    static core.simd.double4 _mm256_permutexvar_pd(core.simd.long4, core.simd.double4) @nogc nothrow;
    static void _mm256_mask_cvtepi64_storeu_epi16(void*, ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm256_maskz_cvtepi64_epi16(ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm256_mask_cvtepi64_epi16(core.simd.long2, ubyte, core.simd.long4) @nogc nothrow;
    int jl_subtype(_jl_value_t*, _jl_value_t*) @nogc nothrow;
    static int jl_is_kind(_jl_value_t*) @nogc nothrow;
    static int jl_is_type(_jl_value_t*) @nogc nothrow;
    static int jl_is_primitivetype(void*) @nogc nothrow;
    static int jl_is_structtype(void*) @nogc nothrow;
    static int jl_isbits(void*) @nogc nothrow;
    static int jl_is_datatype_singleton(_jl_datatype_t*) @nogc nothrow;
    static int jl_is_abstracttype(void*) @nogc nothrow;
    static int jl_is_array_type(void*) @nogc nothrow;
    static int jl_is_array(void*) @nogc nothrow;
    static int jl_is_cpointer_type(_jl_value_t*) @nogc nothrow;
    static int jl_is_abstract_ref_type(_jl_value_t*) @nogc nothrow;
    static int jl_is_tuple_type(void*) @nogc nothrow;
    static int jl_is_namedtuple_type(void*) @nogc nothrow;
    static int jl_is_vecelement_type(_jl_value_t*) @nogc nothrow;
    static int jl_is_type_type(_jl_value_t*) @nogc nothrow;
    int jl_egal(_jl_value_t*, _jl_value_t*) @nogc nothrow;
    c_ulong jl_object_id(_jl_value_t*) @nogc nothrow;
    int jl_has_free_typevars(_jl_value_t*) @nogc nothrow;
    int jl_has_typevar(_jl_value_t*, jl_tvar_t*) @nogc nothrow;
    int jl_has_typevar_from_unionall(_jl_value_t*, jl_unionall_t*) @nogc nothrow;
    int jl_subtype_env_size(_jl_value_t*) @nogc nothrow;
    int jl_subtype_env(_jl_value_t*, _jl_value_t*, _jl_value_t**, int) @nogc nothrow;
    int jl_isa(_jl_value_t*, _jl_value_t*) @nogc nothrow;
    int jl_types_equal(_jl_value_t*, _jl_value_t*) @nogc nothrow;
    int jl_is_not_broken_subtype(_jl_value_t*, _jl_value_t*) @nogc nothrow;
    _jl_value_t* jl_type_union(_jl_value_t**, c_ulong) @nogc nothrow;
    _jl_value_t* jl_type_intersection(_jl_value_t*, _jl_value_t*) @nogc nothrow;
    int jl_has_empty_intersection(_jl_value_t*, _jl_value_t*) @nogc nothrow;
    _jl_value_t* jl_type_unionall(jl_tvar_t*, _jl_value_t*) @nogc nothrow;
    const(char)* jl_typename_str(_jl_value_t*) @nogc nothrow;
    const(char)* jl_typeof_str(_jl_value_t*) @nogc nothrow;
    int jl_type_morespecific(_jl_value_t*, _jl_value_t*) @nogc nothrow;
    _jl_value_t* jl_unwrap_unionall(_jl_value_t*) @nogc nothrow;
    _jl_value_t* jl_rewrap_unionall(_jl_value_t*, _jl_value_t*) @nogc nothrow;
    static int jl_is_dispatch_tupletype(_jl_value_t*) @nogc nothrow;
    static int jl_is_concrete_type(_jl_value_t*) @nogc nothrow;
    static _jl_value_t* jl_typemap_entry_sig(_jl_value_t*) @nogc nothrow;
    jl_typename_t* jl_new_typename_in(_jl_sym_t*, _jl_module_t*) @nogc nothrow;
    jl_tvar_t* jl_new_typevar(_jl_sym_t*, _jl_value_t*, _jl_value_t*) @nogc nothrow;
    _jl_value_t* jl_instantiate_unionall(jl_unionall_t*, _jl_value_t*) @nogc nothrow;
    _jl_value_t* jl_apply_type(_jl_value_t*, _jl_value_t**, c_ulong) @nogc nothrow;
    _jl_value_t* jl_apply_type1(_jl_value_t*, _jl_value_t*) @nogc nothrow;
    _jl_value_t* jl_apply_type2(_jl_value_t*, _jl_value_t*, _jl_value_t*) @nogc nothrow;
    _jl_datatype_t* jl_apply_tuple_type(jl_svec_t*) @nogc nothrow;
    _jl_datatype_t* jl_apply_tuple_type_v(_jl_value_t**, c_ulong) @nogc nothrow;
    _jl_datatype_t* jl_new_datatype(_jl_sym_t*, _jl_module_t*, _jl_datatype_t*, jl_svec_t*, jl_svec_t*, jl_svec_t*, int, int, int) @nogc nothrow;
    _jl_datatype_t* jl_new_primitivetype(_jl_value_t*, _jl_module_t*, _jl_datatype_t*, jl_svec_t*, c_ulong) @nogc nothrow;
    _jl_datatype_t* jl_new_abstracttype(_jl_value_t*, _jl_module_t*, _jl_datatype_t*, jl_svec_t*) @nogc nothrow;
    _jl_value_t* jl_new_bits(_jl_value_t*, void*) @nogc nothrow;
    _jl_value_t* jl_new_struct(_jl_datatype_t*, ...) @nogc nothrow;
    _jl_value_t* jl_new_structv(_jl_datatype_t*, _jl_value_t**, uint) @nogc nothrow;
    _jl_value_t* jl_new_struct_uninit(_jl_datatype_t*) @nogc nothrow;
    _jl_method_instance_t* jl_new_method_instance_uninit() @nogc nothrow;
    jl_svec_t* jl_svec(c_ulong, ...) @nogc nothrow;
    jl_svec_t* jl_svec1(void*) @nogc nothrow;
    jl_svec_t* jl_svec2(void*, void*) @nogc nothrow;
    jl_svec_t* jl_alloc_svec(c_ulong) @nogc nothrow;
    jl_svec_t* jl_alloc_svec_uninit(c_ulong) @nogc nothrow;
    jl_svec_t* jl_svec_copy(jl_svec_t*) @nogc nothrow;
    jl_svec_t* jl_svec_fill(c_ulong, _jl_value_t*) @nogc nothrow;
    _jl_value_t* jl_tupletype_fill(c_ulong, _jl_value_t*) @nogc nothrow;
    _jl_sym_t* jl_symbol(const(char)*) @nogc nothrow;
    _jl_sym_t* jl_symbol_lookup(const(char)*) @nogc nothrow;
    _jl_sym_t* jl_symbol_n(const(char)*, c_ulong) @nogc nothrow;
    _jl_sym_t* jl_gensym() @nogc nothrow;
    _jl_sym_t* jl_tagged_gensym(const(char)*, int) @nogc nothrow;
    _jl_sym_t* jl_get_root_symbol() @nogc nothrow;
    _jl_value_t* jl_generic_function_def(_jl_sym_t*, _jl_module_t*, _jl_value_t**, _jl_value_t*, jl_binding_t*) @nogc nothrow;
    void jl_method_def(jl_svec_t*, _jl_code_info_t*, _jl_module_t*) @nogc nothrow;
    _jl_code_info_t* jl_code_for_staged(_jl_method_instance_t*) @nogc nothrow;
    _jl_code_info_t* jl_copy_code_info(_jl_code_info_t*) @nogc nothrow;
    c_ulong jl_get_world_counter() @nogc nothrow;
    _jl_value_t* jl_get_kwsorter(_jl_value_t*) @nogc nothrow;
    _jl_value_t* jl_box_bool(byte) @nogc nothrow;
    _jl_value_t* jl_box_int8(byte) @nogc nothrow;
    _jl_value_t* jl_box_uint8(ubyte) @nogc nothrow;
    _jl_value_t* jl_box_int16(short) @nogc nothrow;
    _jl_value_t* jl_box_uint16(ushort) @nogc nothrow;
    _jl_value_t* jl_box_int32(int) @nogc nothrow;
    _jl_value_t* jl_box_uint32(uint) @nogc nothrow;
    _jl_value_t* jl_box_char(uint) @nogc nothrow;
    _jl_value_t* jl_box_int64(c_long) @nogc nothrow;
    _jl_value_t* jl_box_uint64(c_ulong) @nogc nothrow;
    _jl_value_t* jl_box_float32(float) @nogc nothrow;
    _jl_value_t* jl_box_float64(double) @nogc nothrow;
    _jl_value_t* jl_box_voidpointer(void*) @nogc nothrow;
    _jl_value_t* jl_box_ssavalue(c_ulong) @nogc nothrow;
    _jl_value_t* jl_box_slotnumber(c_ulong) @nogc nothrow;
    byte jl_unbox_bool(_jl_value_t*) @nogc nothrow;
    byte jl_unbox_int8(_jl_value_t*) @nogc nothrow;
    ubyte jl_unbox_uint8(_jl_value_t*) @nogc nothrow;
    short jl_unbox_int16(_jl_value_t*) @nogc nothrow;
    ushort jl_unbox_uint16(_jl_value_t*) @nogc nothrow;
    int jl_unbox_int32(_jl_value_t*) @nogc nothrow;
    uint jl_unbox_uint32(_jl_value_t*) @nogc nothrow;
    c_long jl_unbox_int64(_jl_value_t*) @nogc nothrow;
    c_ulong jl_unbox_uint64(_jl_value_t*) @nogc nothrow;
    float jl_unbox_float32(_jl_value_t*) @nogc nothrow;
    double jl_unbox_float64(_jl_value_t*) @nogc nothrow;
    void* jl_unbox_voidpointer(_jl_value_t*) @nogc nothrow;
    int jl_get_size(_jl_value_t*, c_ulong*) @nogc nothrow;
    static core.simd.long2 _mm256_cvtepi64_epi16(core.simd.long4) @nogc nothrow;
    static void _mm_mask_cvtepi64_storeu_epi16(void*, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_cvtepi64_epi16(ubyte, core.simd.long2) @nogc nothrow;
    alias jl_vararg_kind_t = _Anonymous_40;
    enum _Anonymous_40
    {
        JL_VARARG_NONE = 0,
        JL_VARARG_INT = 1,
        JL_VARARG_BOUND = 2,
        JL_VARARG_UNBOUND = 3,
    }
    enum JL_VARARG_NONE = _Anonymous_40.JL_VARARG_NONE;
    enum JL_VARARG_INT = _Anonymous_40.JL_VARARG_INT;
    enum JL_VARARG_BOUND = _Anonymous_40.JL_VARARG_BOUND;
    enum JL_VARARG_UNBOUND = _Anonymous_40.JL_VARARG_UNBOUND;
    static int jl_is_vararg_type(_jl_value_t*) @nogc nothrow;
    static _jl_value_t* jl_unwrap_vararg(_jl_value_t*) @nogc nothrow;
    static jl_vararg_kind_t jl_vararg_kind(_jl_value_t*) @nogc nothrow;
    static int jl_is_va_tuple(_jl_datatype_t*) @nogc nothrow;
    static jl_vararg_kind_t jl_va_tuple_kind(_jl_datatype_t*) @nogc nothrow;
    int jl_field_index(_jl_datatype_t*, _jl_sym_t*, int) @nogc nothrow;
    _jl_value_t* jl_get_nth_field(_jl_value_t*, c_ulong) @nogc nothrow;
    _jl_value_t* jl_get_nth_field_noalloc(_jl_value_t*, c_ulong) @nogc nothrow;
    _jl_value_t* jl_get_nth_field_checked(_jl_value_t*, c_ulong) @nogc nothrow;
    void jl_set_nth_field(_jl_value_t*, c_ulong, _jl_value_t*) @nogc nothrow;
    int jl_field_isdefined(_jl_value_t*, c_ulong) @nogc nothrow;
    _jl_value_t* jl_get_field(_jl_value_t*, const(char)*) @nogc nothrow;
    _jl_value_t* jl_value_ptr(_jl_value_t*) @nogc nothrow;
    int jl_islayout_inline(_jl_value_t*, c_ulong*, c_ulong*) @nogc nothrow;
    jl_array_t* jl_new_array(_jl_value_t*, _jl_value_t*) @nogc nothrow;
    jl_array_t* jl_reshape_array(_jl_value_t*, jl_array_t*, _jl_value_t*) @nogc nothrow;
    jl_array_t* jl_ptr_to_array_1d(_jl_value_t*, void*, c_ulong, int) @nogc nothrow;
    jl_array_t* jl_ptr_to_array(_jl_value_t*, void*, _jl_value_t*, int) @nogc nothrow;
    jl_array_t* jl_alloc_array_1d(_jl_value_t*, c_ulong) @nogc nothrow;
    jl_array_t* jl_alloc_array_2d(_jl_value_t*, c_ulong, c_ulong) @nogc nothrow;
    jl_array_t* jl_alloc_array_3d(_jl_value_t*, c_ulong, c_ulong, c_ulong) @nogc nothrow;
    jl_array_t* jl_pchar_to_array(const(char)*, c_ulong) @nogc nothrow;
    _jl_value_t* jl_pchar_to_string(const(char)*, c_ulong) @nogc nothrow;
    _jl_value_t* jl_cstr_to_string(const(char)*) @nogc nothrow;
    _jl_value_t* jl_alloc_string(c_ulong) @nogc nothrow;
    _jl_value_t* jl_array_to_string(jl_array_t*) @nogc nothrow;
    jl_array_t* jl_alloc_vec_any(c_ulong) @nogc nothrow;
    _jl_value_t* jl_arrayref(jl_array_t*, c_ulong) @nogc nothrow;
    _jl_value_t* jl_ptrarrayref(jl_array_t*, c_ulong) @nogc nothrow;
    void jl_arrayset(jl_array_t*, _jl_value_t*, c_ulong) @nogc nothrow;
    void jl_arrayunset(jl_array_t*, c_ulong) @nogc nothrow;
    int jl_array_isassigned(jl_array_t*, c_ulong) @nogc nothrow;
    void jl_array_grow_end(jl_array_t*, c_ulong) @nogc nothrow;
    void jl_array_del_end(jl_array_t*, c_ulong) @nogc nothrow;
    void jl_array_grow_beg(jl_array_t*, c_ulong) @nogc nothrow;
    void jl_array_del_beg(jl_array_t*, c_ulong) @nogc nothrow;
    void jl_array_sizehint(jl_array_t*, c_ulong) @nogc nothrow;
    void jl_array_ptr_1d_push(jl_array_t*, _jl_value_t*) @nogc nothrow;
    void jl_array_ptr_1d_append(jl_array_t*, jl_array_t*) @nogc nothrow;
    _jl_value_t* jl_apply_array_type(_jl_value_t*, c_ulong) @nogc nothrow;
    void* jl_array_ptr(jl_array_t*) @nogc nothrow;
    void* jl_array_eltype(_jl_value_t*) @nogc nothrow;
    int jl_array_rank(_jl_value_t*) @nogc nothrow;
    c_ulong jl_array_size(_jl_value_t*, int) @nogc nothrow;
    const(char)* jl_string_ptr(_jl_value_t*) @nogc nothrow;
    extern __gshared _jl_module_t* jl_main_module;
    extern __gshared _jl_module_t* jl_core_module;
    extern __gshared _jl_module_t* jl_base_module;
    extern __gshared _jl_module_t* jl_top_module;
    _jl_module_t* jl_new_module(_jl_sym_t*) @nogc nothrow;
    void jl_set_module_nospecialize(_jl_module_t*, int) @nogc nothrow;
    jl_binding_t* jl_get_binding(_jl_module_t*, _jl_sym_t*) @nogc nothrow;
    jl_binding_t* jl_get_binding_or_error(_jl_module_t*, _jl_sym_t*) @nogc nothrow;
    _jl_value_t* jl_module_globalref(_jl_module_t*, _jl_sym_t*) @nogc nothrow;
    jl_binding_t* jl_get_binding_wr(_jl_module_t*, _jl_sym_t*, int) @nogc nothrow;
    jl_binding_t* jl_get_binding_for_method_def(_jl_module_t*, _jl_sym_t*) @nogc nothrow;
    int jl_boundp(_jl_module_t*, _jl_sym_t*) @nogc nothrow;
    int jl_defines_or_exports_p(_jl_module_t*, _jl_sym_t*) @nogc nothrow;
    int jl_binding_resolved_p(_jl_module_t*, _jl_sym_t*) @nogc nothrow;
    int jl_is_const(_jl_module_t*, _jl_sym_t*) @nogc nothrow;
    _jl_value_t* jl_get_global(_jl_module_t*, _jl_sym_t*) @nogc nothrow;
    void jl_set_global(_jl_module_t*, _jl_sym_t*, _jl_value_t*) @nogc nothrow;
    void jl_set_const(_jl_module_t*, _jl_sym_t*, _jl_value_t*) @nogc nothrow;
    void jl_checked_assignment(jl_binding_t*, _jl_value_t*) @nogc nothrow;
    void jl_declare_constant(jl_binding_t*) @nogc nothrow;
    void jl_module_using(_jl_module_t*, _jl_module_t*) @nogc nothrow;
    void jl_module_use(_jl_module_t*, _jl_module_t*, _jl_sym_t*) @nogc nothrow;
    void jl_module_import(_jl_module_t*, _jl_module_t*, _jl_sym_t*) @nogc nothrow;
    void jl_module_export(_jl_module_t*, _jl_sym_t*) @nogc nothrow;
    int jl_is_imported(_jl_module_t*, _jl_sym_t*) @nogc nothrow;
    int jl_module_exports_p(_jl_module_t*, _jl_sym_t*) @nogc nothrow;
    void jl_add_standard_imports(_jl_module_t*) @nogc nothrow;
    static _jl_value_t* jl_get_function(_jl_module_t*, const(char)*) @nogc nothrow;
    int jl_is_submodule(_jl_module_t*, _jl_module_t*) @nogc nothrow;
    jl_array_t* jl_eqtable_put(jl_array_t*, void*, void*, int*) @nogc nothrow;
    _jl_value_t* jl_eqtable_get(jl_array_t*, void*, _jl_value_t*) @nogc nothrow;
    int jl_errno() @nogc nothrow;
    void jl_set_errno(int) @nogc nothrow;
    int jl_stat(const(char)*, char*) @nogc nothrow;
    int jl_cpu_threads() @nogc nothrow;
    c_long jl_getpagesize() @nogc nothrow;
    c_long jl_getallocationgranularity() @nogc nothrow;
    int jl_is_debugbuild() @nogc nothrow;
    _jl_sym_t* jl_get_UNAME() @nogc nothrow;
    _jl_sym_t* jl_get_ARCH() @nogc nothrow;
    _jl_value_t* jl_environ(int) @nogc nothrow;
    void jl_error(const(char)*) @nogc nothrow;
    void jl_errorf(const(char)*) @nogc nothrow;
    void jl_exceptionf(_jl_datatype_t*, const(char)*) @nogc nothrow;
    void jl_too_few_args(const(char)*, int) @nogc nothrow;
    void jl_too_many_args(const(char)*, int) @nogc nothrow;
    void jl_type_error(const(char)*, _jl_value_t*, _jl_value_t*) @nogc nothrow;
    void jl_type_error_rt(const(char)*, const(char)*, _jl_value_t*, _jl_value_t*) @nogc nothrow;
    void jl_undefined_var_error(_jl_sym_t*) @nogc nothrow;
    void jl_bounds_error(_jl_value_t*, _jl_value_t*) @nogc nothrow;
    void jl_bounds_error_v(_jl_value_t*, _jl_value_t**, c_ulong) @nogc nothrow;
    void jl_bounds_error_int(_jl_value_t*, c_ulong) @nogc nothrow;
    void jl_bounds_error_tuple_int(_jl_value_t**, c_ulong, c_ulong) @nogc nothrow;
    void jl_bounds_error_unboxed_int(void*, _jl_value_t*, c_ulong) @nogc nothrow;
    void jl_bounds_error_ints(_jl_value_t*, c_ulong*, c_ulong) @nogc nothrow;
    void jl_eof_error() @nogc nothrow;
    _jl_value_t* jl_current_exception() @nogc nothrow;
    _jl_value_t* jl_exception_occurred() @nogc nothrow;
    void jl_exception_clear() @nogc nothrow;
    static core.simd.long2 _mm_mask_cvtepi64_epi16(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_cvtepi64_epi16(core.simd.long2) @nogc nothrow;
    alias JL_IMAGE_SEARCH = _Anonymous_41;
    enum _Anonymous_41
    {
        JL_IMAGE_CWD = 0,
        JL_IMAGE_JULIA_HOME = 1,
    }
    enum JL_IMAGE_CWD = _Anonymous_41.JL_IMAGE_CWD;
    enum JL_IMAGE_JULIA_HOME = _Anonymous_41.JL_IMAGE_JULIA_HOME;
    static void _mm256_mask_cvtepi64_storeu_epi32(void*, ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm256_maskz_cvtepi64_epi32(ubyte, core.simd.long4) @nogc nothrow;
    void julia_init__threading(JL_IMAGE_SEARCH) @nogc nothrow;
    void jl_init__threading() @nogc nothrow;
    void jl_init_with_image__threading(const(char)*, const(char)*) @nogc nothrow;
    const(char)* jl_get_default_sysimg_path() @nogc nothrow;
    int jl_is_initialized() @nogc nothrow;
    void jl_atexit_hook(int) @nogc nothrow;
    void jl_exit(int) @nogc nothrow;
    const(char)* jl_pathname_for_handle(void*) @nogc nothrow;
    int jl_deserialize_verify_header(ios_t*) @nogc nothrow;
    void jl_preload_sysimg_so(const(char)*) @nogc nothrow;
    void jl_set_sysimg_so(void*) @nogc nothrow;
    ios_t* jl_create_system_image() @nogc nothrow;
    void jl_save_system_image(const(char)*) @nogc nothrow;
    void jl_restore_system_image(const(char)*) @nogc nothrow;
    void jl_restore_system_image_data(const(char)*, c_ulong) @nogc nothrow;
    int jl_save_incremental(const(char)*, jl_array_t*) @nogc nothrow;
    _jl_value_t* jl_restore_incremental(const(char)*, jl_array_t*) @nogc nothrow;
    _jl_value_t* jl_restore_incremental_from_buf(const(char)*, c_ulong, jl_array_t*) @nogc nothrow;
    _jl_value_t* jl_parse_input_line(const(char)*, c_ulong, const(char)*, c_ulong) @nogc nothrow;
    _jl_value_t* jl_parse_string(const(char)*, c_ulong, int, int) @nogc nothrow;
    _jl_value_t* jl_load_file_string(const(char)*, c_ulong, char*, _jl_module_t*) @nogc nothrow;
    _jl_value_t* jl_expand(_jl_value_t*, _jl_module_t*) @nogc nothrow;
    _jl_value_t* jl_expand_stmt(_jl_value_t*, _jl_module_t*) @nogc nothrow;
    _jl_value_t* jl_eval_string(const(char)*) @nogc nothrow;
    enum JL_RTLD_CONSTANT
    {
        JL_RTLD_LOCAL = 1,
        JL_RTLD_GLOBAL = 2,
        JL_RTLD_LAZY = 4,
        JL_RTLD_NOW = 8,
        JL_RTLD_NODELETE = 16,
        JL_RTLD_NOLOAD = 32,
        JL_RTLD_DEEPBIND = 64,
        JL_RTLD_FIRST = 128,
    }
    enum JL_RTLD_LOCAL = JL_RTLD_CONSTANT.JL_RTLD_LOCAL;
    enum JL_RTLD_GLOBAL = JL_RTLD_CONSTANT.JL_RTLD_GLOBAL;
    enum JL_RTLD_LAZY = JL_RTLD_CONSTANT.JL_RTLD_LAZY;
    enum JL_RTLD_NOW = JL_RTLD_CONSTANT.JL_RTLD_NOW;
    enum JL_RTLD_NODELETE = JL_RTLD_CONSTANT.JL_RTLD_NODELETE;
    enum JL_RTLD_NOLOAD = JL_RTLD_CONSTANT.JL_RTLD_NOLOAD;
    enum JL_RTLD_DEEPBIND = JL_RTLD_CONSTANT.JL_RTLD_DEEPBIND;
    enum JL_RTLD_FIRST = JL_RTLD_CONSTANT.JL_RTLD_FIRST;
    alias jl_uv_libhandle = void*;
    void* jl_load_dynamic_library(const(char)*, uint, int) @nogc nothrow;
    void* jl_dlopen(const(char)*, uint) @nogc nothrow;
    int jl_dlclose(void*) @nogc nothrow;
    int jl_dlsym(void*, const(char)*, void**, int) @nogc nothrow;
    _jl_value_t* jl_toplevel_eval(_jl_module_t*, _jl_value_t*) @nogc nothrow;
    _jl_value_t* jl_toplevel_eval_in(_jl_module_t*, _jl_value_t*) @nogc nothrow;
    _jl_value_t* jl_load(_jl_module_t*, const(char)*) @nogc nothrow;
    _jl_module_t* jl_base_relative_to(_jl_module_t*) @nogc nothrow;
    void jl_trace_method(_jl_method_t*) @nogc nothrow;
    void jl_untrace_method(_jl_method_t*) @nogc nothrow;
    void jl_trace_linfo(_jl_method_instance_t*) @nogc nothrow;
    void jl_untrace_linfo(_jl_method_instance_t*) @nogc nothrow;
    void jl_register_linfo_tracer(void function(_jl_method_instance_t*)) @nogc nothrow;
    void jl_register_method_tracer(void function(_jl_method_instance_t*)) @nogc nothrow;
    void jl_register_newmeth_tracer(void function(_jl_method_t*)) @nogc nothrow;
    _jl_value_t* jl_copy_ast(_jl_value_t*) @nogc nothrow;
    jl_array_t* jl_compress_ast(_jl_method_t*, _jl_code_info_t*) @nogc nothrow;
    _jl_code_info_t* jl_uncompress_ast(_jl_method_t*, jl_array_t*) @nogc nothrow;
    ubyte jl_ast_flag_inferred(jl_array_t*) @nogc nothrow;
    ubyte jl_ast_flag_inlineable(jl_array_t*) @nogc nothrow;
    ubyte jl_ast_flag_pure(jl_array_t*) @nogc nothrow;
    void jl_fill_argnames(jl_array_t*, jl_array_t*) @nogc nothrow;
    int jl_is_operator(char*) @nogc nothrow;
    int jl_is_unary_operator(char*) @nogc nothrow;
    int jl_is_unary_and_binary_operator(char*) @nogc nothrow;
    int jl_operator_precedence(char*) @nogc nothrow;
    static int jl_vinfo_sa(ubyte) @nogc nothrow;
    static int jl_vinfo_usedundef(ubyte) @nogc nothrow;
    _jl_value_t* jl_apply_generic(_jl_value_t**, uint) @nogc nothrow;
    _jl_value_t* jl_invoke(_jl_method_instance_t*, _jl_value_t**, uint) @nogc nothrow;
    int jl_invoke_api(_jl_method_instance_t*) @nogc nothrow;
    static _jl_value_t* jl_apply(_jl_value_t**, uint) @nogc nothrow;
    _jl_value_t* jl_call(_jl_value_t*, _jl_value_t**, int) @nogc nothrow;
    _jl_value_t* jl_call0(_jl_value_t*) @nogc nothrow;
    _jl_value_t* jl_call1(_jl_value_t*, _jl_value_t*) @nogc nothrow;
    _jl_value_t* jl_call2(_jl_value_t*, _jl_value_t*, _jl_value_t*) @nogc nothrow;
    _jl_value_t* jl_call3(_jl_value_t*, _jl_value_t*, _jl_value_t*, _jl_value_t*) @nogc nothrow;
    void jl_yield() @nogc nothrow;
    void jl_install_sigint_handler() @nogc nothrow;
    void jl_sigatomic_begin() @nogc nothrow;
    void jl_sigatomic_end() @nogc nothrow;
    alias jl_timing_block_t = _jl_timing_block_t;
    struct _jl_timing_block_t;
    alias jl_handler_t = _jl_handler_t;
    struct _jl_handler_t
    {
        __jmp_buf_tag[1] eh_ctx;
        _jl_gcframe_t* gcstack;
        _jl_handler_t* prev;
        byte gc_state;
        c_ulong locks_len;
        int defer_signal;
        int finalizers_inhibited;
        _jl_timing_block_t* timing_stack;
        c_ulong world_age;
    }
    alias jl_task_t = _jl_task_t;
    _jl_task_t* jl_new_task(_jl_value_t*, c_ulong) @nogc nothrow;
    void jl_switchto(_jl_task_t**) @nogc nothrow;
    void jl_throw(_jl_value_t*) @nogc nothrow;
    void jl_rethrow() @nogc nothrow;
    void jl_sig_throw() @nogc nothrow;
    void jl_rethrow_other(_jl_value_t*) @nogc nothrow;
    void jl_no_exc_handler(_jl_value_t*) @nogc nothrow;
    void jl_enter_handler(_jl_handler_t*) @nogc nothrow;
    void jl_eh_restore_state(_jl_handler_t*) @nogc nothrow;
    void jl_pop_handler(int) @nogc nothrow;
    c_ulong jl_excstack_state() @nogc nothrow;
    void jl_restore_excstack(c_ulong) @nogc nothrow;
    static core.simd.long2 _mm256_mask_cvtepi64_epi32(core.simd.long2, ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm256_cvtepi64_epi32(core.simd.long4) @nogc nothrow;
    static void _mm_mask_cvtepi64_storeu_epi32(void*, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_cvtepi64_epi32(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_cvtepi64_epi32(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    void jl_run_event_loop(uv_loop_s*) @nogc nothrow;
    int jl_run_once(uv_loop_s*) @nogc nothrow;
    int jl_process_events(uv_loop_s*) @nogc nothrow;
    uv_loop_s* jl_global_event_loop() @nogc nothrow;
    void jl_close_uv(uv_handle_s*) @nogc nothrow;
    int jl_tcp_bind(uv_tcp_s*, ushort, uint, uint) @nogc nothrow;
    int jl_sizeof_ios_t() @nogc nothrow;
    jl_array_t* jl_take_buffer(ios_t*) @nogc nothrow;
    struct jl_uv_file_t
    {
        void* data;
        uv_loop_s* loop;
        uv_handle_type type;
        int file;
    }
    static core.simd.long2 _mm_cvtepi64_epi32(core.simd.long2) @nogc nothrow;
    void jl_uv_puts(uv_stream_s*, const(char)*, c_ulong) @nogc nothrow;
    int jl_printf(uv_stream_s*, const(char)*, ...) @nogc nothrow;
    int jl_vprintf(uv_stream_s*, const(char)*, va_list*) @nogc nothrow;
    void jl_safe_printf(const(char)*, ...) @nogc nothrow;
    extern __gshared uv_stream_s* jl_uv_stdin;
    extern __gshared uv_stream_s* jl_uv_stdout;
    extern __gshared uv_stream_s* jl_uv_stderr;
    uv_stream_s* jl_stdout_stream() @nogc nothrow;
    uv_stream_s* jl_stdin_stream() @nogc nothrow;
    uv_stream_s* jl_stderr_stream() @nogc nothrow;
    void jl_flush_cstdio() @nogc nothrow;
    _jl_value_t* jl_stdout_obj() @nogc nothrow;
    _jl_value_t* jl_stderr_obj() @nogc nothrow;
    c_ulong jl_static_show(uv_stream_s*, _jl_value_t*) @nogc nothrow;
    c_ulong jl_static_show_func_sig(uv_stream_s*, _jl_value_t*) @nogc nothrow;
    void jlbacktrace() @nogc nothrow;
    void jl_(void*) @nogc nothrow;
    struct jl_options_t
    {
        byte quiet;
        byte banner;
        const(char)* julia_bindir;
        const(char)* julia_bin;
        const(char)** cmds;
        const(char)* image_file;
        const(char)* cpu_target;
        int nprocs;
        const(char)* machine_file;
        const(char)* project;
        byte isinteractive;
        byte color;
        byte historyfile;
        byte startupfile;
        byte compile_enabled;
        byte code_coverage;
        byte malloc_log;
        byte opt_level;
        byte debug_level;
        byte check_bounds;
        byte depwarn;
        byte warn_overwrite;
        byte can_inline;
        byte polly;
        const(char)* trace_compile;
        byte fast_math;
        byte worker;
        const(char)* cookie;
        byte handle_signals;
        byte use_sysimage_native_code;
        byte use_compiled_modules;
        const(char)* bindto;
        const(char)* outputbc;
        const(char)* outputunoptbc;
        const(char)* outputjitbc;
        const(char)* outputo;
        const(char)* outputji;
        const(char)* output_code_coverage;
        byte incremental;
        byte image_file_specified;
    }
    extern __gshared jl_options_t jl_options;
    c_long jl_sizeof_jl_options() @nogc nothrow;
    void jl_parse_opts(int*, char***) @nogc nothrow;
    char* jl_format_filename(const(char)*) @nogc nothrow;
    void jl_set_ARGS(int, char**) @nogc nothrow;
    int jl_generating_output() @nogc nothrow;
    static void _mm256_mask_cvtepi64_storeu_epi8(void*, ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm256_maskz_cvtepi64_epi8(ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm256_mask_cvtepi64_epi8(core.simd.long2, ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm256_cvtepi64_epi8(core.simd.long4) @nogc nothrow;
    static void _mm_mask_cvtepi64_storeu_epi8(void*, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_cvtepi64_epi8(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_cvtepi64_epi8(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_cvtepi64_epi8(core.simd.long2) @nogc nothrow;
    static void _mm256_mask_cvtepi32_storeu_epi16(void*, ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm256_maskz_cvtepi32_epi16(ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm256_mask_cvtepi32_epi16(core.simd.long2, ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm256_cvtepi32_epi16(core.simd.long4) @nogc nothrow;
    static void _mm_mask_cvtepi32_storeu_epi16(void*, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_cvtepi32_epi16(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_cvtepi32_epi16(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_cvtepi32_epi16(core.simd.long2) @nogc nothrow;
    static void _mm256_mask_cvtepi32_storeu_epi8(void*, ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm256_maskz_cvtepi32_epi8(ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm256_mask_cvtepi32_epi8(core.simd.long2, ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm256_cvtepi32_epi8(core.simd.long4) @nogc nothrow;
    int jl_ver_major() @nogc nothrow;
    int jl_ver_minor() @nogc nothrow;
    int jl_ver_patch() @nogc nothrow;
    int jl_ver_is_release() @nogc nothrow;
    const(char)* jl_ver_string() @nogc nothrow;
    const(char)* jl_git_branch() @nogc nothrow;
    const(char)* jl_git_commit() @nogc nothrow;
    struct jl_nullable_float64_t
    {
        ubyte hasvalue;
        double value;
    }
    struct jl_nullable_float32_t
    {
        ubyte hasvalue;
        float value;
    }
    static void _mm_mask_cvtepi32_storeu_epi8(void*, ubyte, core.simd.long2) @nogc nothrow;
    struct jl_cgparams_t
    {
        int cached;
        int track_allocations;
        int code_coverage;
        int static_alloc;
        int prefer_specsig;
        _jl_value_t* module_setup;
        _jl_value_t* module_activation;
        _jl_value_t* raise_exception;
        _jl_value_t* emit_function;
        _jl_value_t* emitted_function;
    }
    extern __gshared jl_cgparams_t jl_default_cgparams;
    static core.simd.long2 _mm_maskz_cvtepi32_epi8(ubyte, core.simd.long2) @nogc nothrow;
    struct jl_ucontext_t
    {
        __jmp_buf_tag[1] uc_mcontext;
    }
    struct jl_mutex_t
    {
        c_ulong owner;
        uint count;
    }
    struct jl_gc_pool_t
    {
        _jl_taggedvalue_t* freelist;
        _jl_taggedvalue_t* newpages;
        ushort osize;
    }
    struct jl_thread_heap_t
    {
        arraylist_t weak_refs;
        arraylist_t live_tasks;
        _mallocarray_t* mallocarrays;
        _mallocarray_t* mafreelist;
        _bigval_t* big_objects;
        arraylist_t rem_bindings;
        arraylist_t[2] _remset;
        int remset_nptr;
        arraylist_t* remset;
        arraylist_t* last_remset;
        jl_gc_pool_t[41] norm_pools;
        arraylist_t[16] free_stacks;
    }
    static core.simd.long2 _mm_mask_cvtepi32_epi8(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    alias jl_gc_mark_data_t = _jl_gc_mark_data;
    union _jl_gc_mark_data;
    struct jl_gc_mark_sp_t
    {
        void** pc;
        _jl_gc_mark_data* data;
        void** pc_start;
        void** pc_end;
    }
    struct jl_gc_mark_cache_t
    {
        c_ulong perm_scanned_bytes;
        c_ulong scanned_bytes;
        c_ulong nbig_obj;
        void*[1024] big_obj;
        jl_mutex_t stack_lock;
        void** pc_stack;
        void** pc_stack_end;
        _jl_gc_mark_data* data_stack;
    }
    alias jl_excstack_t = _jl_excstack_t;
    struct _jl_excstack_t;
    static core.simd.long2 _mm_cvtepi32_epi8(core.simd.long2) @nogc nothrow;
    struct _jl_gcframe_t
    {
        c_ulong nroots;
        _jl_gcframe_t* prev;
    }
    static void _mm256_mask_cvtusepi64_storeu_epi16(void*, ubyte, core.simd.long4) @nogc nothrow;
    struct _jl_task_t
    {
        import std.bitmanip: bitfields;

        align(4):
        _jl_value_t* tls;
        _jl_sym_t* state;
        _jl_value_t* donenotify;
        _jl_value_t* result;
        _jl_value_t* exception;
        _jl_value_t* backtrace;
        _jl_value_t* logstate;
        _jl_value_t* start;
        jl_ucontext_t ctx;
        void* stkbuf;
        c_ulong bufsz;
        mixin(bitfields!(
            uint, "copy_stack", 31,
            uint, "started", 1,
        ));
        _jl_handler_t* eh;
        _jl_gcframe_t* gcstack;
        _jl_excstack_t* excstack;
        c_ulong world_age;
        short tid;
        arraylist_t locks;
        _jl_timing_block_t* timing_stack;
    }
    static core.simd.long2 _mm256_maskz_cvtusepi64_epi16(ubyte, core.simd.long4) @nogc nothrow;
    void jl_cpu_pause() @nogc nothrow;
    void jl_cpu_wake() @nogc nothrow;
    static core.simd.long2 _mm256_mask_cvtusepi64_epi16(core.simd.long2, ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm256_cvtusepi64_epi16(core.simd.long4) @nogc nothrow;
    static byte jl_gc_state_set(_jl_tls_states_t*, byte, byte) @nogc nothrow;
    static byte jl_gc_state_save_and_set(_jl_tls_states_t*, byte) @nogc nothrow;
    static void _mm_mask_cvtusepi64_storeu_epi16(void*, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_cvtusepi64_epi16(ubyte, core.simd.long2) @nogc nothrow;
    void jl_gc_safepoint() @nogc nothrow;
    void jl_gc_enable_finalizers(_jl_tls_states_t*, int) @nogc nothrow;
    static core.simd.long2 _mm_mask_cvtusepi64_epi16(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_cvtusepi64_epi16(core.simd.long2) @nogc nothrow;
    static void _mm256_mask_cvtusepi64_storeu_epi32(void*, ubyte, core.simd.long4) @nogc nothrow;
    void libsupport_init() @nogc nothrow;
    static core.simd.long2 _mm256_maskz_cvtusepi64_epi32(ubyte, core.simd.long4) @nogc nothrow;
    static void jl_mutex_wait(jl_mutex_t*, int) @nogc nothrow;
    static void jl_mutex_lock_nogc(jl_mutex_t*) @nogc nothrow;
    static void jl_lock_frame_push(jl_mutex_t*) @nogc nothrow;
    static void jl_lock_frame_pop() @nogc nothrow;
    static core.simd.long2 _mm256_mask_cvtusepi64_epi32(core.simd.long2, ubyte, core.simd.long4) @nogc nothrow;
    static void jl_mutex_lock(jl_mutex_t*) @nogc nothrow;
    static void jl_mutex_lock_maybe_nogc(jl_mutex_t*) @nogc nothrow;
    static void jl_mutex_unlock_nogc(jl_mutex_t*) @nogc nothrow;
    static void jl_mutex_unlock(jl_mutex_t*) @nogc nothrow;
    static void jl_mutex_unlock_maybe_nogc(jl_mutex_t*) @nogc nothrow;
    static void jl_mutex_init(jl_mutex_t*) @nogc nothrow;
    static core.simd.long2 _mm256_cvtusepi64_epi32(core.simd.long4) @nogc nothrow;
    static void _mm_mask_cvtusepi64_storeu_epi32(void*, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_cvtusepi64_epi32(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_cvtusepi64_epi32(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_cvtusepi64_epi32(core.simd.long2) @nogc nothrow;
    void** ptrhash_bp(htable_t*, void*) @nogc nothrow;
    int ptrhash_remove(htable_t*, void*) @nogc nothrow;
    int ptrhash_has(htable_t*, void*) @nogc nothrow;
    void ptrhash_adjoin(htable_t*, void*, void*) @nogc nothrow;
    void ptrhash_put(htable_t*, void*, void*) @nogc nothrow;
    void* ptrhash_get(htable_t*, void*) @nogc nothrow;
    static void _mm256_mask_cvtusepi64_storeu_epi8(void*, ubyte, core.simd.long4) @nogc nothrow;
    double jl_strtod_c(const(char)*, char**) @nogc nothrow;
    float jl_strtof_c(const(char)*, char**) @nogc nothrow;
    struct jl_timeval
    {
        c_long sec;
        c_long usec;
    }
    int jl_gettimeofday(jl_timeval*) @nogc nothrow;
    double jl_clock_now() @nogc nothrow;
    void sleep_ms(int) @nogc nothrow;
    static core.simd.long2 _mm256_maskz_cvtusepi64_epi8(ubyte, core.simd.long4) @nogc nothrow;
    static c_ulong jl_thread_self() @nogc nothrow;
    alias jl_tls_states_t = _jl_tls_states_t;
    struct _jl_tls_states_t
    {
        _jl_gcframe_t* pgcstack;
        c_ulong world_age;
        c_ulong* safepoint;
        byte gc_state;
        byte in_finalizer;
        byte disable_gc;
        int defer_signal;
        _jl_task_t* current_task;
        _jl_task_t* root_task;
        void* stackbase;
        c_ulong stacksize;
        jl_ucontext_t base_ctx;
        __jmp_buf_tag** safe_restore;
        short tid;
        _jl_value_t* sig_exception;
        c_ulong* bt_data;
        c_ulong bt_size;
        int signal_request;
        int io_wait;
        jl_thread_heap_t heap;
        c_ulong system_id;
        void* signal_stack;
        int in_pure_callback;
        int finalizers_inhibited;
        arraylist_t finalizers;
        jl_gc_mark_cache_t gc_cache;
        arraylist_t sweep_objs;
        jl_gc_mark_sp_t gc_mark_sp;
        _jl_value_t* previous_exception;
    }
    alias jl_ptls_t = _jl_tls_states_t*;
    short jl_threadid() @nogc nothrow;
    void jl_threading_profile() @nogc nothrow;
    _jl_tls_states_t* jl_get_ptls_states() @nogc nothrow;
    alias jl_get_ptls_states_func = _jl_tls_states_t* function();
    void jl_set_ptls_states_getter(_jl_tls_states_t* function()) @nogc nothrow;
    static core.simd.long2 _mm256_mask_cvtusepi64_epi8(core.simd.long2, ubyte, core.simd.long4) @nogc nothrow;
    c_ulong u8_toucs(uint*, c_ulong, const(char)*, c_ulong) @nogc nothrow;
    c_ulong u8_toutf8(char*, c_ulong, const(uint)*, c_ulong) @nogc nothrow;
    c_ulong u8_wc_toutf8(char*, uint) @nogc nothrow;
    c_ulong u8_offset(const(char)*, c_ulong) @nogc nothrow;
    c_ulong u8_charnum(const(char)*, c_ulong) @nogc nothrow;
    uint u8_nextchar(const(char)*, c_ulong*) @nogc nothrow;
    uint u8_nextmemchar(const(char)*, c_ulong*) @nogc nothrow;
    void u8_inc(const(char)*, c_ulong*) @nogc nothrow;
    void u8_dec(const(char)*, c_ulong*) @nogc nothrow;
    c_ulong u8_seqlen(const(char)*) @nogc nothrow;
    c_ulong u8_charlen(uint) @nogc nothrow;
    char read_escape_control_char(char) @nogc nothrow;
    c_ulong u8_read_escape_sequence(const(char)*, c_ulong, uint*) @nogc nothrow;
    int u8_escape_wchar(char*, c_ulong, uint) @nogc nothrow;
    c_ulong u8_escape(char*, c_ulong, const(char)*, c_ulong*, c_ulong, int, int) @nogc nothrow;
    int octal_digit(char) @nogc nothrow;
    int hex_digit(char) @nogc nothrow;
    char* u8_memchr(const(char)*, uint, c_ulong, c_ulong*) @nogc nothrow;
    char* u8_memrchr(const(char)*, uint, c_ulong) @nogc nothrow;
    c_ulong u8_strwidth(const(char)*) @nogc nothrow;
    c_ulong u8_vprintf(const(char)*, va_list*) @nogc nothrow;
    c_ulong u8_printf(const(char)*, ...) @nogc nothrow;
    int u8_isvalid(const(char)*, c_ulong) @nogc nothrow;
    static core.simd.long2 _mm256_cvtusepi64_epi8(core.simd.long4) @nogc nothrow;
    char* uint2str(char*, c_ulong, c_ulong, uint) @nogc nothrow;
    int str2int(char*, c_ulong, c_long*, uint) @nogc nothrow;
    int isdigit_base(char, int) @nogc nothrow;
    double conv_to_double(void*, numerictype_t) @nogc nothrow;
    c_long conv_to_int64(void*, numerictype_t) @nogc nothrow;
    c_ulong conv_to_uint64(void*, numerictype_t) @nogc nothrow;
    int conv_to_int32(void*, numerictype_t) @nogc nothrow;
    uint conv_to_uint32(void*, numerictype_t) @nogc nothrow;
    static void _mm_mask_cvtusepi64_storeu_epi8(void*, ubyte, core.simd.long2) @nogc nothrow;
    int cmp_same_lt(void*, void*, numerictype_t) @nogc nothrow;
    int cmp_same_eq(void*, void*, numerictype_t) @nogc nothrow;
    int cmp_lt(void*, numerictype_t, void*, numerictype_t) @nogc nothrow;
    int cmp_eq(void*, numerictype_t, void*, numerictype_t, int) @nogc nothrow;
    static core.simd.long2 _mm_maskz_cvtusepi64_epi8(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_cvtusepi64_epi8(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_cvtusepi64_epi8(core.simd.long2) @nogc nothrow;
    static void _mm256_mask_cvtusepi32_storeu_epi16(void*, ubyte, core.simd.long4) @nogc nothrow;
    alias uv_errno_t = _Anonymous_42;
    enum _Anonymous_42
    {
        UV_E2BIG = -7,
        UV_EACCES = -13,
        UV_EADDRINUSE = -98,
        UV_EADDRNOTAVAIL = -99,
        UV_EAFNOSUPPORT = -97,
        UV_EAGAIN = -11,
        UV_EAI_ADDRFAMILY = -3000,
        UV_EAI_AGAIN = -3001,
        UV_EAI_BADFLAGS = -3002,
        UV_EAI_BADHINTS = -3013,
        UV_EAI_CANCELED = -3003,
        UV_EAI_FAIL = -3004,
        UV_EAI_FAMILY = -3005,
        UV_EAI_MEMORY = -3006,
        UV_EAI_NODATA = -3007,
        UV_EAI_NONAME = -3008,
        UV_EAI_OVERFLOW = -3009,
        UV_EAI_PROTOCOL = -3014,
        UV_EAI_SERVICE = -3010,
        UV_EAI_SOCKTYPE = -3011,
        UV_EALREADY = -114,
        UV_EBADF = -9,
        UV_EBUSY = -16,
        UV_ECANCELED = -125,
        UV_ECHARSET = -4080,
        UV_ECONNABORTED = -103,
        UV_ECONNREFUSED = -111,
        UV_ECONNRESET = -104,
        UV_EDESTADDRREQ = -89,
        UV_EEXIST = -17,
        UV_EFAULT = -14,
        UV_EFBIG = -27,
        UV_EHOSTUNREACH = -113,
        UV_EINTR = -4,
        UV_EINVAL = -22,
        UV_EIO = -5,
        UV_EISCONN = -106,
        UV_EISDIR = -21,
        UV_ELOOP = -40,
        UV_EMFILE = -24,
        UV_EMSGSIZE = -90,
        UV_ENAMETOOLONG = -36,
        UV_ENETDOWN = -100,
        UV_ENETUNREACH = -101,
        UV_ENFILE = -23,
        UV_ENOBUFS = -105,
        UV_ENODEV = -19,
        UV_ENOENT = -2,
        UV_ENOMEM = -12,
        UV_ENONET = -64,
        UV_ENOPROTOOPT = -92,
        UV_ENOSPC = -28,
        UV_ENOSYS = -38,
        UV_ENOTCONN = -107,
        UV_ENOTDIR = -20,
        UV_ENOTEMPTY = -39,
        UV_ENOTSOCK = -88,
        UV_ENOTSUP = -95,
        UV_EPERM = -1,
        UV_EPIPE = -32,
        UV_EPROTO = -71,
        UV_EPROTONOSUPPORT = -93,
        UV_EPROTOTYPE = -91,
        UV_ERANGE = -34,
        UV_EROFS = -30,
        UV_ESHUTDOWN = -108,
        UV_ESPIPE = -29,
        UV_ESRCH = -3,
        UV_ETIMEDOUT = -110,
        UV_ETXTBSY = -26,
        UV_EXDEV = -18,
        UV_UNKNOWN = -4094,
        UV_EOF = -4095,
        UV_ENXIO = -6,
        UV_EMLINK = -31,
        UV_EHOSTDOWN = -112,
        UV_EREMOTEIO = -121,
        UV_ENOTTY = -25,
        UV_EFTYPE = -4028,
        UV_ERRNO_MAX = -4096,
    }
    enum UV_E2BIG = _Anonymous_42.UV_E2BIG;
    enum UV_EACCES = _Anonymous_42.UV_EACCES;
    enum UV_EADDRINUSE = _Anonymous_42.UV_EADDRINUSE;
    enum UV_EADDRNOTAVAIL = _Anonymous_42.UV_EADDRNOTAVAIL;
    enum UV_EAFNOSUPPORT = _Anonymous_42.UV_EAFNOSUPPORT;
    enum UV_EAGAIN = _Anonymous_42.UV_EAGAIN;
    enum UV_EAI_ADDRFAMILY = _Anonymous_42.UV_EAI_ADDRFAMILY;
    enum UV_EAI_AGAIN = _Anonymous_42.UV_EAI_AGAIN;
    enum UV_EAI_BADFLAGS = _Anonymous_42.UV_EAI_BADFLAGS;
    enum UV_EAI_BADHINTS = _Anonymous_42.UV_EAI_BADHINTS;
    enum UV_EAI_CANCELED = _Anonymous_42.UV_EAI_CANCELED;
    enum UV_EAI_FAIL = _Anonymous_42.UV_EAI_FAIL;
    enum UV_EAI_FAMILY = _Anonymous_42.UV_EAI_FAMILY;
    enum UV_EAI_MEMORY = _Anonymous_42.UV_EAI_MEMORY;
    enum UV_EAI_NODATA = _Anonymous_42.UV_EAI_NODATA;
    enum UV_EAI_NONAME = _Anonymous_42.UV_EAI_NONAME;
    enum UV_EAI_OVERFLOW = _Anonymous_42.UV_EAI_OVERFLOW;
    enum UV_EAI_PROTOCOL = _Anonymous_42.UV_EAI_PROTOCOL;
    enum UV_EAI_SERVICE = _Anonymous_42.UV_EAI_SERVICE;
    enum UV_EAI_SOCKTYPE = _Anonymous_42.UV_EAI_SOCKTYPE;
    enum UV_EALREADY = _Anonymous_42.UV_EALREADY;
    enum UV_EBADF = _Anonymous_42.UV_EBADF;
    enum UV_EBUSY = _Anonymous_42.UV_EBUSY;
    enum UV_ECANCELED = _Anonymous_42.UV_ECANCELED;
    enum UV_ECHARSET = _Anonymous_42.UV_ECHARSET;
    enum UV_ECONNABORTED = _Anonymous_42.UV_ECONNABORTED;
    enum UV_ECONNREFUSED = _Anonymous_42.UV_ECONNREFUSED;
    enum UV_ECONNRESET = _Anonymous_42.UV_ECONNRESET;
    enum UV_EDESTADDRREQ = _Anonymous_42.UV_EDESTADDRREQ;
    enum UV_EEXIST = _Anonymous_42.UV_EEXIST;
    enum UV_EFAULT = _Anonymous_42.UV_EFAULT;
    enum UV_EFBIG = _Anonymous_42.UV_EFBIG;
    enum UV_EHOSTUNREACH = _Anonymous_42.UV_EHOSTUNREACH;
    enum UV_EINTR = _Anonymous_42.UV_EINTR;
    enum UV_EINVAL = _Anonymous_42.UV_EINVAL;
    enum UV_EIO = _Anonymous_42.UV_EIO;
    enum UV_EISCONN = _Anonymous_42.UV_EISCONN;
    enum UV_EISDIR = _Anonymous_42.UV_EISDIR;
    enum UV_ELOOP = _Anonymous_42.UV_ELOOP;
    enum UV_EMFILE = _Anonymous_42.UV_EMFILE;
    enum UV_EMSGSIZE = _Anonymous_42.UV_EMSGSIZE;
    enum UV_ENAMETOOLONG = _Anonymous_42.UV_ENAMETOOLONG;
    enum UV_ENETDOWN = _Anonymous_42.UV_ENETDOWN;
    enum UV_ENETUNREACH = _Anonymous_42.UV_ENETUNREACH;
    enum UV_ENFILE = _Anonymous_42.UV_ENFILE;
    enum UV_ENOBUFS = _Anonymous_42.UV_ENOBUFS;
    enum UV_ENODEV = _Anonymous_42.UV_ENODEV;
    enum UV_ENOENT = _Anonymous_42.UV_ENOENT;
    enum UV_ENOMEM = _Anonymous_42.UV_ENOMEM;
    enum UV_ENONET = _Anonymous_42.UV_ENONET;
    enum UV_ENOPROTOOPT = _Anonymous_42.UV_ENOPROTOOPT;
    enum UV_ENOSPC = _Anonymous_42.UV_ENOSPC;
    enum UV_ENOSYS = _Anonymous_42.UV_ENOSYS;
    enum UV_ENOTCONN = _Anonymous_42.UV_ENOTCONN;
    enum UV_ENOTDIR = _Anonymous_42.UV_ENOTDIR;
    enum UV_ENOTEMPTY = _Anonymous_42.UV_ENOTEMPTY;
    enum UV_ENOTSOCK = _Anonymous_42.UV_ENOTSOCK;
    enum UV_ENOTSUP = _Anonymous_42.UV_ENOTSUP;
    enum UV_EPERM = _Anonymous_42.UV_EPERM;
    enum UV_EPIPE = _Anonymous_42.UV_EPIPE;
    enum UV_EPROTO = _Anonymous_42.UV_EPROTO;
    enum UV_EPROTONOSUPPORT = _Anonymous_42.UV_EPROTONOSUPPORT;
    enum UV_EPROTOTYPE = _Anonymous_42.UV_EPROTOTYPE;
    enum UV_ERANGE = _Anonymous_42.UV_ERANGE;
    enum UV_EROFS = _Anonymous_42.UV_EROFS;
    enum UV_ESHUTDOWN = _Anonymous_42.UV_ESHUTDOWN;
    enum UV_ESPIPE = _Anonymous_42.UV_ESPIPE;
    enum UV_ESRCH = _Anonymous_42.UV_ESRCH;
    enum UV_ETIMEDOUT = _Anonymous_42.UV_ETIMEDOUT;
    enum UV_ETXTBSY = _Anonymous_42.UV_ETXTBSY;
    enum UV_EXDEV = _Anonymous_42.UV_EXDEV;
    enum UV_UNKNOWN = _Anonymous_42.UV_UNKNOWN;
    enum UV_EOF = _Anonymous_42.UV_EOF;
    enum UV_ENXIO = _Anonymous_42.UV_ENXIO;
    enum UV_EMLINK = _Anonymous_42.UV_EMLINK;
    enum UV_EHOSTDOWN = _Anonymous_42.UV_EHOSTDOWN;
    enum UV_EREMOTEIO = _Anonymous_42.UV_EREMOTEIO;
    enum UV_ENOTTY = _Anonymous_42.UV_ENOTTY;
    enum UV_EFTYPE = _Anonymous_42.UV_EFTYPE;
    enum UV_ERRNO_MAX = _Anonymous_42.UV_ERRNO_MAX;
    alias uv_handle_type = _Anonymous_43;
    enum _Anonymous_43
    {
        UV_UNKNOWN_HANDLE = 0,
        UV_ASYNC = 1,
        UV_CHECK = 2,
        UV_FS_EVENT = 3,
        UV_FS_POLL = 4,
        UV_HANDLE = 5,
        UV_IDLE = 6,
        UV_NAMED_PIPE = 7,
        UV_POLL = 8,
        UV_PREPARE = 9,
        UV_PROCESS = 10,
        UV_STREAM = 11,
        UV_TCP = 12,
        UV_TIMER = 13,
        UV_TTY = 14,
        UV_UDP = 15,
        UV_SIGNAL = 16,
        UV_FILE = 17,
        UV_HANDLE_TYPE_MAX = 18,
    }
    enum UV_UNKNOWN_HANDLE = _Anonymous_43.UV_UNKNOWN_HANDLE;
    enum UV_ASYNC = _Anonymous_43.UV_ASYNC;
    enum UV_CHECK = _Anonymous_43.UV_CHECK;
    enum UV_FS_EVENT = _Anonymous_43.UV_FS_EVENT;
    enum UV_FS_POLL = _Anonymous_43.UV_FS_POLL;
    enum UV_HANDLE = _Anonymous_43.UV_HANDLE;
    enum UV_IDLE = _Anonymous_43.UV_IDLE;
    enum UV_NAMED_PIPE = _Anonymous_43.UV_NAMED_PIPE;
    enum UV_POLL = _Anonymous_43.UV_POLL;
    enum UV_PREPARE = _Anonymous_43.UV_PREPARE;
    enum UV_PROCESS = _Anonymous_43.UV_PROCESS;
    enum UV_STREAM = _Anonymous_43.UV_STREAM;
    enum UV_TCP = _Anonymous_43.UV_TCP;
    enum UV_TIMER = _Anonymous_43.UV_TIMER;
    enum UV_TTY = _Anonymous_43.UV_TTY;
    enum UV_UDP = _Anonymous_43.UV_UDP;
    enum UV_SIGNAL = _Anonymous_43.UV_SIGNAL;
    enum UV_FILE = _Anonymous_43.UV_FILE;
    enum UV_HANDLE_TYPE_MAX = _Anonymous_43.UV_HANDLE_TYPE_MAX;
    static core.simd.long2 _mm256_maskz_cvtusepi32_epi16(ubyte, core.simd.long4) @nogc nothrow;
    alias uv_req_type = _Anonymous_44;
    enum _Anonymous_44
    {
        UV_UNKNOWN_REQ = 0,
        UV_REQ = 1,
        UV_CONNECT = 2,
        UV_WRITE = 3,
        UV_SHUTDOWN = 4,
        UV_UDP_SEND = 5,
        UV_FS = 6,
        UV_WORK = 7,
        UV_GETADDRINFO = 8,
        UV_GETNAMEINFO = 9,
        UV_REQ_TYPE_MAX = 10,
    }
    enum UV_UNKNOWN_REQ = _Anonymous_44.UV_UNKNOWN_REQ;
    enum UV_REQ = _Anonymous_44.UV_REQ;
    enum UV_CONNECT = _Anonymous_44.UV_CONNECT;
    enum UV_WRITE = _Anonymous_44.UV_WRITE;
    enum UV_SHUTDOWN = _Anonymous_44.UV_SHUTDOWN;
    enum UV_UDP_SEND = _Anonymous_44.UV_UDP_SEND;
    enum UV_FS = _Anonymous_44.UV_FS;
    enum UV_WORK = _Anonymous_44.UV_WORK;
    enum UV_GETADDRINFO = _Anonymous_44.UV_GETADDRINFO;
    enum UV_GETNAMEINFO = _Anonymous_44.UV_GETNAMEINFO;
    enum UV_REQ_TYPE_MAX = _Anonymous_44.UV_REQ_TYPE_MAX;
    alias uv_loop_t = uv_loop_s;
    alias uv_handle_t = uv_handle_s;
    struct uv_handle_s
    {
        void* data;
        uv_loop_s* loop;
        uv_handle_type type;
        void function(uv_handle_s*) close_cb;
        void*[2] handle_queue;
        uv_handle_s* next_closing;
        uint flags;
    }
    alias uv_stream_t = uv_stream_s;
    struct uv_stream_s
    {
        void* data;
        uv_loop_s* loop;
        uv_handle_type type;
        void function(uv_handle_s*) close_cb;
        void*[2] handle_queue;
        uv_handle_s* next_closing;
        uint flags;
        c_ulong write_queue_size;
        void function(uv_handle_s*, c_ulong, uv_buf_t*) alloc_cb;
        void function(uv_stream_s*, c_long, const(uv_buf_t)*) read_cb;
        uv_connect_s* connect_req;
        uv_shutdown_s* shutdown_req;
        uv__io_s io_watcher;
        void*[2] write_queue;
        void*[2] write_completed_queue;
        void function(uv_stream_s*, int) connection_cb;
        int delayed_error;
        int accepted_fd;
        void* queued_fds;
    }
    alias uv_tcp_t = uv_tcp_s;
    struct uv_tcp_s
    {
        void* data;
        uv_loop_s* loop;
        uv_handle_type type;
        void function(uv_handle_s*) close_cb;
        void*[2] handle_queue;
        uv_handle_s* next_closing;
        uint flags;
        c_ulong write_queue_size;
        void function(uv_handle_s*, c_ulong, uv_buf_t*) alloc_cb;
        void function(uv_stream_s*, c_long, const(uv_buf_t)*) read_cb;
        uv_connect_s* connect_req;
        uv_shutdown_s* shutdown_req;
        uv__io_s io_watcher;
        void*[2] write_queue;
        void*[2] write_completed_queue;
        void function(uv_stream_s*, int) connection_cb;
        int delayed_error;
        int accepted_fd;
        void* queued_fds;
    }
    alias uv_udp_t = uv_udp_s;
    struct uv_udp_s
    {
        void* data;
        uv_loop_s* loop;
        uv_handle_type type;
        void function(uv_handle_s*) close_cb;
        void*[2] handle_queue;
        uv_handle_s* next_closing;
        uint flags;
        c_ulong send_queue_size;
        c_ulong send_queue_count;
        void function(uv_handle_s*, c_ulong, uv_buf_t*) alloc_cb;
        void function(uv_udp_s*, c_long, const(uv_buf_t)*, const(sockaddr)*, uint) recv_cb;
        uv__io_s io_watcher;
        void*[2] write_queue;
        void*[2] write_completed_queue;
    }
    alias uv_pipe_t = uv_pipe_s;
    struct uv_pipe_s
    {
        void* data;
        uv_loop_s* loop;
        uv_handle_type type;
        void function(uv_handle_s*) close_cb;
        void*[2] handle_queue;
        uv_handle_s* next_closing;
        uint flags;
        c_ulong write_queue_size;
        void function(uv_handle_s*, c_ulong, uv_buf_t*) alloc_cb;
        void function(uv_stream_s*, c_long, const(uv_buf_t)*) read_cb;
        uv_connect_s* connect_req;
        uv_shutdown_s* shutdown_req;
        uv__io_s io_watcher;
        void*[2] write_queue;
        void*[2] write_completed_queue;
        void function(uv_stream_s*, int) connection_cb;
        int delayed_error;
        int accepted_fd;
        void* queued_fds;
        int ipc;
        const(char)* pipe_fname;
    }
    alias uv_tty_t = uv_tty_s;
    struct uv_tty_s
    {
        void* data;
        uv_loop_s* loop;
        uv_handle_type type;
        void function(uv_handle_s*) close_cb;
        void*[2] handle_queue;
        uv_handle_s* next_closing;
        uint flags;
        c_ulong write_queue_size;
        void function(uv_handle_s*, c_ulong, uv_buf_t*) alloc_cb;
        void function(uv_stream_s*, c_long, const(uv_buf_t)*) read_cb;
        uv_connect_s* connect_req;
        uv_shutdown_s* shutdown_req;
        uv__io_s io_watcher;
        void*[2] write_queue;
        void*[2] write_completed_queue;
        void function(uv_stream_s*, int) connection_cb;
        int delayed_error;
        int accepted_fd;
        void* queued_fds;
        termios orig_termios;
        int mode;
    }
    alias uv_poll_t = uv_poll_s;
    struct uv_poll_s
    {
        void* data;
        uv_loop_s* loop;
        uv_handle_type type;
        void function(uv_handle_s*) close_cb;
        void*[2] handle_queue;
        uv_handle_s* next_closing;
        uint flags;
        void function(uv_poll_s*, int, int) poll_cb;
        uv__io_s io_watcher;
    }
    alias uv_timer_t = uv_timer_s;
    struct uv_timer_s
    {
        void* data;
        uv_loop_s* loop;
        uv_handle_type type;
        void function(uv_handle_s*) close_cb;
        void*[2] handle_queue;
        uv_handle_s* next_closing;
        uint flags;
        void function(uv_timer_s*) timer_cb;
        void*[3] heap_node;
        c_ulong timeout;
        c_ulong repeat;
        c_ulong start_id;
    }
    alias uv_prepare_t = uv_prepare_s;
    struct uv_prepare_s
    {
        void* data;
        uv_loop_s* loop;
        uv_handle_type type;
        void function(uv_handle_s*) close_cb;
        void*[2] handle_queue;
        uv_handle_s* next_closing;
        uint flags;
        void function(uv_prepare_s*) prepare_cb;
        void*[2] queue;
    }
    alias uv_check_t = uv_check_s;
    struct uv_check_s
    {
        void* data;
        uv_loop_s* loop;
        uv_handle_type type;
        void function(uv_handle_s*) close_cb;
        void*[2] handle_queue;
        uv_handle_s* next_closing;
        uint flags;
        void function(uv_check_s*) check_cb;
        void*[2] queue;
    }
    alias uv_idle_t = uv_idle_s;
    struct uv_idle_s
    {
        void* data;
        uv_loop_s* loop;
        uv_handle_type type;
        void function(uv_handle_s*) close_cb;
        void*[2] handle_queue;
        uv_handle_s* next_closing;
        uint flags;
        void function(uv_idle_s*) idle_cb;
        void*[2] queue;
    }
    alias uv_async_t = uv_async_s;
    struct uv_async_s
    {
        void* data;
        uv_loop_s* loop;
        uv_handle_type type;
        void function(uv_handle_s*) close_cb;
        void*[2] handle_queue;
        uv_handle_s* next_closing;
        uint flags;
        void function(uv_async_s*) async_cb;
        void*[2] queue;
        int pending;
    }
    alias uv_process_t = uv_process_s;
    struct uv_process_s
    {
        void* data;
        uv_loop_s* loop;
        uv_handle_type type;
        void function(uv_handle_s*) close_cb;
        void*[2] handle_queue;
        uv_handle_s* next_closing;
        uint flags;
        void function(uv_process_s*, c_long, int) exit_cb;
        int pid;
        void*[2] queue;
        int status;
    }
    alias uv_fs_event_t = uv_fs_event_s;
    struct uv_fs_event_s
    {
        void* data;
        uv_loop_s* loop;
        uv_handle_type type;
        void function(uv_handle_s*) close_cb;
        void*[2] handle_queue;
        uv_handle_s* next_closing;
        uint flags;
        char* path;
        void function(uv_fs_event_s*, const(char)*, int, int) cb;
        void*[2] watchers;
        int wd;
    }
    alias uv_fs_poll_t = uv_fs_poll_s;
    struct uv_fs_poll_s
    {
        void* data;
        uv_loop_s* loop;
        uv_handle_type type;
        void function(uv_handle_s*) close_cb;
        void*[2] handle_queue;
        uv_handle_s* next_closing;
        uint flags;
        void* poll_ctx;
    }
    alias uv_signal_t = uv_signal_s;
    struct uv_signal_s
    {
        void* data;
        uv_loop_s* loop;
        uv_handle_type type;
        void function(uv_handle_s*) close_cb;
        void*[2] handle_queue;
        uv_handle_s* next_closing;
        uint flags;
        void function(uv_signal_s*, int) signal_cb;
        int signum;
        static struct _Anonymous_45
        {
            uv_signal_s* rbe_left;
            uv_signal_s* rbe_right;
            uv_signal_s* rbe_parent;
            int rbe_color;
        }
        _Anonymous_45 tree_entry;
        uint caught_signals;
        uint dispatched_signals;
    }
    alias uv_req_t = uv_req_s;
    struct uv_req_s
    {
        void* data;
        uv_req_type type;
        void*[6] reserved;
    }
    alias uv_getaddrinfo_t = uv_getaddrinfo_s;
    struct uv_getaddrinfo_s
    {
        void* data;
        uv_req_type type;
        void*[6] reserved;
        uv_loop_s* loop;
        uv__work work_req;
        void function(uv_getaddrinfo_s*, int, addrinfo*) cb;
        addrinfo* hints;
        char* hostname;
        char* service;
        addrinfo* addrinfo_;
        int retcode;
    }
    alias uv_getnameinfo_t = uv_getnameinfo_s;
    struct uv_getnameinfo_s
    {
        void* data;
        uv_req_type type;
        void*[6] reserved;
        uv_loop_s* loop;
        uv__work work_req;
        void function(uv_getnameinfo_s*, int, const(char)*, const(char)*) getnameinfo_cb;
        sockaddr_storage storage;
        int flags;
        char[1025] host;
        char[32] service;
        int retcode;
    }
    alias uv_shutdown_t = uv_shutdown_s;
    struct uv_shutdown_s
    {
        void* data;
        uv_req_type type;
        void*[6] reserved;
        uv_stream_s* handle;
        void function(uv_shutdown_s*, int) cb;
    }
    alias uv_write_t = uv_write_s;
    struct uv_write_s
    {
        void* data;
        uv_req_type type;
        void*[6] reserved;
        void function(uv_write_s*, int) cb;
        uv_stream_s* send_handle;
        uv_stream_s* handle;
        void*[2] queue;
        uint write_index;
        uv_buf_t* bufs;
        uint nbufs;
        int error;
        uv_buf_t[4] bufsml;
    }
    alias uv_connect_t = uv_connect_s;
    struct uv_connect_s
    {
        void* data;
        uv_req_type type;
        void*[6] reserved;
        void function(uv_connect_s*, int) cb;
        uv_stream_s* handle;
        void*[2] queue;
    }
    alias uv_udp_send_t = uv_udp_send_s;
    struct uv_udp_send_s
    {
        void* data;
        uv_req_type type;
        void*[6] reserved;
        uv_udp_s* handle;
        void function(uv_udp_send_s*, int) cb;
        void*[2] queue;
        sockaddr_storage addr;
        uint nbufs;
        uv_buf_t* bufs;
        c_long status;
        void function(uv_udp_send_s*, int) send_cb;
        uv_buf_t[4] bufsml;
    }
    alias uv_fs_t = uv_fs_s;
    struct uv_fs_s
    {
        void* data;
        uv_req_type type;
        void*[6] reserved;
        uv_fs_type fs_type;
        uv_loop_s* loop;
        void function(uv_fs_s*) cb;
        c_long result;
        void* ptr;
        const(char)* path;
        uv_stat_t statbuf;
        const(char)* new_path;
        int file;
        int flags;
        uint mode;
        uint nbufs;
        uv_buf_t* bufs;
        c_long off;
        uint uid;
        uint gid;
        double btime;
        double atime;
        double mtime;
        uv__work work_req;
        uv_buf_t[4] bufsml;
    }
    alias uv_work_t = uv_work_s;
    struct uv_work_s
    {
        void* data;
        uv_req_type type;
        void*[6] reserved;
        uv_loop_s* loop;
        void function(uv_work_s*) work_cb;
        void function(uv_work_s*, int) after_work_cb;
        uv__work work_req;
    }
    alias uv_cpu_info_t = uv_cpu_info_s;
    struct uv_cpu_info_s
    {
        char* model;
        int speed;
        uv_cpu_times_s cpu_times;
    }
    alias uv_interface_address_t = uv_interface_address_s;
    struct uv_interface_address_s
    {
        char* name;
        char[6] phys_addr;
        int is_internal;
        static union _Anonymous_46
        {
            sockaddr_in address4;
            sockaddr_in6 address6;
        }
        _Anonymous_46 address;
        static union _Anonymous_47
        {
            sockaddr_in netmask4;
            sockaddr_in6 netmask6;
        }
        _Anonymous_47 netmask;
    }
    alias uv_dirent_t = uv_dirent_s;
    struct uv_dirent_s
    {
        const(char)* name;
        uv_dirent_type_t type;
    }
    alias uv_passwd_t = uv_passwd_s;
    struct uv_passwd_s
    {
        char* username;
        c_long uid;
        c_long gid;
        char* shell;
        char* homedir;
        char* gecos;
    }
    alias uv_loop_option = _Anonymous_48;
    enum _Anonymous_48
    {
        UV_LOOP_BLOCK_SIGNAL = 0,
    }
    enum UV_LOOP_BLOCK_SIGNAL = _Anonymous_48.UV_LOOP_BLOCK_SIGNAL;
    alias uv_run_mode = _Anonymous_49;
    enum _Anonymous_49
    {
        UV_RUN_DEFAULT = 0,
        UV_RUN_ONCE = 1,
        UV_RUN_NOWAIT = 2,
    }
    enum UV_RUN_DEFAULT = _Anonymous_49.UV_RUN_DEFAULT;
    enum UV_RUN_ONCE = _Anonymous_49.UV_RUN_ONCE;
    enum UV_RUN_NOWAIT = _Anonymous_49.UV_RUN_NOWAIT;
    uint uv_version() @nogc nothrow;
    const(char)* uv_version_string() @nogc nothrow;
    alias uv_malloc_func = void* function(c_ulong);
    alias uv_realloc_func = void* function(void*, c_ulong);
    alias uv_calloc_func = void* function(c_ulong, c_ulong);
    alias uv_free_func = void function(void*);
    int uv_replace_allocator(void* function(c_ulong), void* function(void*, c_ulong), void* function(c_ulong, c_ulong), void function(void*)) @nogc nothrow;
    uv_loop_s* uv_default_loop() @nogc nothrow;
    int uv_loop_init(uv_loop_s*) @nogc nothrow;
    int uv_loop_close(uv_loop_s*) @nogc nothrow;
    uv_loop_s* uv_loop_new() @nogc nothrow;
    void uv_loop_delete(uv_loop_s*) @nogc nothrow;
    c_ulong uv_loop_size() @nogc nothrow;
    int uv_loop_alive(const(uv_loop_s)*) @nogc nothrow;
    int uv_loop_configure(uv_loop_s*, uv_loop_option, ...) @nogc nothrow;
    int uv_run(uv_loop_s*, uv_run_mode) @nogc nothrow;
    void uv_stop(uv_loop_s*) @nogc nothrow;
    void uv_ref(uv_handle_s*) @nogc nothrow;
    void uv_unref(uv_handle_s*) @nogc nothrow;
    int uv_has_ref(const(uv_handle_s)*) @nogc nothrow;
    void uv_update_time(uv_loop_s*) @nogc nothrow;
    c_ulong uv_now(const(uv_loop_s)*) @nogc nothrow;
    int uv_backend_fd(const(uv_loop_s)*) @nogc nothrow;
    int uv_backend_timeout(const(uv_loop_s)*) @nogc nothrow;
    alias uv_alloc_cb = void function(uv_handle_s*, c_ulong, uv_buf_t*);
    alias uv_read_cb = void function(uv_stream_s*, c_long, const(uv_buf_t)*);
    alias uv_write_cb = void function(uv_write_s*, int);
    alias uv_connect_cb = void function(uv_connect_s*, int);
    alias uv_shutdown_cb = void function(uv_shutdown_s*, int);
    alias uv_connection_cb = void function(uv_stream_s*, int);
    alias uv_close_cb = void function(uv_handle_s*);
    alias uv_poll_cb = void function(uv_poll_s*, int, int);
    alias uv_timer_cb = void function(uv_timer_s*);
    alias uv_async_cb = void function(uv_async_s*);
    alias uv_prepare_cb = void function(uv_prepare_s*);
    alias uv_check_cb = void function(uv_check_s*);
    alias uv_idle_cb = void function(uv_idle_s*);
    alias uv_exit_cb = void function(uv_process_s*, c_long, int);
    alias uv_walk_cb = void function(uv_handle_s*, void*);
    alias uv_fs_cb = void function(uv_fs_s*);
    alias uv_work_cb = void function(uv_work_s*);
    alias uv_after_work_cb = void function(uv_work_s*, int);
    alias uv_getaddrinfo_cb = void function(uv_getaddrinfo_s*, int, addrinfo*);
    alias uv_getnameinfo_cb = void function(uv_getnameinfo_s*, int, const(char)*, const(char)*);
    struct uv_timespec_t
    {
        c_long tv_sec;
        c_long tv_nsec;
    }
    struct uv_stat_t
    {
        c_ulong st_dev;
        c_ulong st_mode;
        c_ulong st_nlink;
        c_ulong st_uid;
        c_ulong st_gid;
        c_ulong st_rdev;
        c_ulong st_ino;
        c_ulong st_size;
        c_ulong st_blksize;
        c_ulong st_blocks;
        c_ulong st_flags;
        c_ulong st_gen;
        uv_timespec_t st_atim;
        uv_timespec_t st_mtim;
        uv_timespec_t st_ctim;
        uv_timespec_t st_birthtim;
    }
    alias uv_fs_event_cb = void function(uv_fs_event_s*, const(char)*, int, int);
    alias uv_fs_poll_cb = void function(uv_fs_poll_s*, int, const(uv_stat_t)*, const(uv_stat_t)*);
    alias uv_signal_cb = void function(uv_signal_s*, int);
    alias uv_membership = _Anonymous_50;
    enum _Anonymous_50
    {
        UV_LEAVE_GROUP = 0,
        UV_JOIN_GROUP = 1,
    }
    enum UV_LEAVE_GROUP = _Anonymous_50.UV_LEAVE_GROUP;
    enum UV_JOIN_GROUP = _Anonymous_50.UV_JOIN_GROUP;
    int uv_translate_sys_error(int) @nogc nothrow;
    const(char)* uv_strerror(int) @nogc nothrow;
    char* uv_strerror_r(int, char*, c_ulong) @nogc nothrow;
    const(char)* uv_err_name(int) @nogc nothrow;
    char* uv_err_name_r(int, char*, c_ulong) @nogc nothrow;
    static core.simd.long2 _mm256_mask_cvtusepi32_epi16(core.simd.long2, ubyte, core.simd.long4) @nogc nothrow;
    int uv_shutdown(uv_shutdown_s*, uv_stream_s*, void function(uv_shutdown_s*, int)) @nogc nothrow;
    c_ulong uv_handle_size(uv_handle_type) @nogc nothrow;
    uv_handle_type uv_handle_get_type(const(uv_handle_s)*) @nogc nothrow;
    const(char)* uv_handle_type_name(uv_handle_type) @nogc nothrow;
    void* uv_handle_get_data(const(uv_handle_s)*) @nogc nothrow;
    uv_loop_s* uv_handle_get_loop(const(uv_handle_s)*) @nogc nothrow;
    void uv_handle_set_data(uv_handle_s*, void*) @nogc nothrow;
    c_ulong uv_req_size(uv_req_type) @nogc nothrow;
    void* uv_req_get_data(const(uv_req_s)*) @nogc nothrow;
    void uv_req_set_data(uv_req_s*, void*) @nogc nothrow;
    uv_req_type uv_req_get_type(const(uv_req_s)*) @nogc nothrow;
    const(char)* uv_req_type_name(uv_req_type) @nogc nothrow;
    int uv_is_active(const(uv_handle_s)*) @nogc nothrow;
    void uv_walk(uv_loop_s*, void function(uv_handle_s*, void*), void*) @nogc nothrow;
    void uv_print_all_handles(uv_loop_s*, void*) @nogc nothrow;
    void uv_print_active_handles(uv_loop_s*, void*) @nogc nothrow;
    void uv_close(uv_handle_s*, void function(uv_handle_s*)) @nogc nothrow;
    int uv_send_buffer_size(uv_handle_s*, int*) @nogc nothrow;
    int uv_recv_buffer_size(uv_handle_s*, int*) @nogc nothrow;
    int uv_fileno(const(uv_handle_s)*, int*) @nogc nothrow;
    uv_buf_t uv_buf_init(char*, c_ulong) @nogc nothrow;
    int uv_pipe(int*, int, int) @nogc nothrow;
    int uv_socketpair(int, int, int*, int, int) @nogc nothrow;
    static core.simd.long2 _mm256_cvtusepi32_epi16(core.simd.long4) @nogc nothrow;
    static int uv_get_osfhandle(int) @nogc nothrow;
    static int uv_convert_fd_to_handle(int) @nogc nothrow;
    static void _mm_mask_cvtusepi32_storeu_epi16(void*, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_cvtusepi32_epi16(ubyte, core.simd.long2) @nogc nothrow;
    c_ulong uv_stream_get_write_queue_size(const(uv_stream_s)*) @nogc nothrow;
    int uv_listen(uv_stream_s*, int, void function(uv_stream_s*, int)) @nogc nothrow;
    int uv_accept(uv_stream_s*, uv_stream_s*) @nogc nothrow;
    int uv_read_start(uv_stream_s*, void function(uv_handle_s*, c_ulong, uv_buf_t*), void function(uv_stream_s*, c_long, const(uv_buf_t)*)) @nogc nothrow;
    int uv_read_stop(uv_stream_s*) @nogc nothrow;
    int uv_write(uv_write_s*, uv_stream_s*, const(uv_buf_t)*, uint, void function(uv_write_s*, int)) @nogc nothrow;
    int uv_write2(uv_write_s*, uv_stream_s*, const(uv_buf_t)*, uint, uv_stream_s*, void function(uv_write_s*, int)) @nogc nothrow;
    int uv_try_write(uv_stream_s*, const(uv_buf_t)*, uint) @nogc nothrow;
    int uv_is_readable(const(uv_stream_s)*) @nogc nothrow;
    int uv_is_writable(const(uv_stream_s)*) @nogc nothrow;
    int uv_stream_set_blocking(uv_stream_s*, int) @nogc nothrow;
    int uv_is_closing(const(uv_handle_s)*) @nogc nothrow;
    int uv_tcp_init(uv_loop_s*, uv_tcp_s*) @nogc nothrow;
    int uv_tcp_init_ex(uv_loop_s*, uv_tcp_s*, uint) @nogc nothrow;
    int uv_tcp_open(uv_tcp_s*, int) @nogc nothrow;
    int uv_tcp_nodelay(uv_tcp_s*, int) @nogc nothrow;
    int uv_tcp_keepalive(uv_tcp_s*, int, uint) @nogc nothrow;
    int uv_tcp_simultaneous_accepts(uv_tcp_s*, int) @nogc nothrow;
    enum uv_tcp_flags
    {
        UV_TCP_IPV6ONLY = 1,
    }
    enum UV_TCP_IPV6ONLY = uv_tcp_flags.UV_TCP_IPV6ONLY;
    int uv_tcp_bind(uv_tcp_s*, const(sockaddr)*, uint) @nogc nothrow;
    int uv_tcp_getsockname(const(uv_tcp_s)*, sockaddr*, int*) @nogc nothrow;
    int uv_tcp_getpeername(const(uv_tcp_s)*, sockaddr*, int*) @nogc nothrow;
    int uv_tcp_connect(uv_connect_s*, uv_tcp_s*, const(sockaddr)*, void function(uv_connect_s*, int)) @nogc nothrow;
    enum uv_udp_flags
    {
        UV_UDP_IPV6ONLY = 1,
        UV_UDP_PARTIAL = 2,
        UV_UDP_REUSEADDR = 4,
    }
    enum UV_UDP_IPV6ONLY = uv_udp_flags.UV_UDP_IPV6ONLY;
    enum UV_UDP_PARTIAL = uv_udp_flags.UV_UDP_PARTIAL;
    enum UV_UDP_REUSEADDR = uv_udp_flags.UV_UDP_REUSEADDR;
    alias uv_udp_send_cb = void function(uv_udp_send_s*, int);
    alias uv_udp_recv_cb = void function(uv_udp_s*, c_long, const(uv_buf_t)*, const(sockaddr)*, uint);
    int uv_udp_init(uv_loop_s*, uv_udp_s*) @nogc nothrow;
    int uv_udp_init_ex(uv_loop_s*, uv_udp_s*, uint) @nogc nothrow;
    int uv_udp_open(uv_udp_s*, int) @nogc nothrow;
    int uv_udp_bind(uv_udp_s*, const(sockaddr)*, uint) @nogc nothrow;
    int uv_udp_connect(uv_udp_s*, const(sockaddr)*) @nogc nothrow;
    int uv_udp_getpeername(const(uv_udp_s)*, sockaddr*, int*) @nogc nothrow;
    int uv_udp_getsockname(const(uv_udp_s)*, sockaddr*, int*) @nogc nothrow;
    int uv_udp_set_membership(uv_udp_s*, const(char)*, const(char)*, uv_membership) @nogc nothrow;
    int uv_udp_set_multicast_loop(uv_udp_s*, int) @nogc nothrow;
    int uv_udp_set_multicast_ttl(uv_udp_s*, int) @nogc nothrow;
    int uv_udp_set_multicast_interface(uv_udp_s*, const(char)*) @nogc nothrow;
    int uv_udp_set_broadcast(uv_udp_s*, int) @nogc nothrow;
    int uv_udp_set_ttl(uv_udp_s*, int) @nogc nothrow;
    int uv_udp_send(uv_udp_send_s*, uv_udp_s*, const(uv_buf_t)*, uint, const(sockaddr)*, void function(uv_udp_send_s*, int)) @nogc nothrow;
    int uv_udp_try_send(uv_udp_s*, const(uv_buf_t)*, uint, const(sockaddr)*) @nogc nothrow;
    int uv_udp_recv_start(uv_udp_s*, void function(uv_handle_s*, c_ulong, uv_buf_t*), void function(uv_udp_s*, c_long, const(uv_buf_t)*, const(sockaddr)*, uint)) @nogc nothrow;
    int uv_udp_recv_stop(uv_udp_s*) @nogc nothrow;
    c_ulong uv_udp_get_send_queue_size(const(uv_udp_s)*) @nogc nothrow;
    c_ulong uv_udp_get_send_queue_count(const(uv_udp_s)*) @nogc nothrow;
    alias uv_tty_mode_t = _Anonymous_51;
    enum _Anonymous_51
    {
        UV_TTY_MODE_NORMAL = 0,
        UV_TTY_MODE_RAW = 1,
        UV_TTY_MODE_IO = 2,
    }
    enum UV_TTY_MODE_NORMAL = _Anonymous_51.UV_TTY_MODE_NORMAL;
    enum UV_TTY_MODE_RAW = _Anonymous_51.UV_TTY_MODE_RAW;
    enum UV_TTY_MODE_IO = _Anonymous_51.UV_TTY_MODE_IO;
    int uv_tty_init(uv_loop_s*, uv_tty_s*, int, int) @nogc nothrow;
    int uv_tty_set_mode(uv_tty_s*, uv_tty_mode_t) @nogc nothrow;
    int uv_tty_reset_mode() @nogc nothrow;
    int uv_tty_get_winsize(uv_tty_s*, int*, int*) @nogc nothrow;
    uv_handle_type uv_guess_handle(int) @nogc nothrow;
    int uv_pipe_init(uv_loop_s*, uv_pipe_s*, int) @nogc nothrow;
    int uv_pipe_open(uv_pipe_s*, int) @nogc nothrow;
    int uv_pipe_bind(uv_pipe_s*, const(char)*) @nogc nothrow;
    void uv_pipe_connect(uv_connect_s*, uv_pipe_s*, const(char)*, void function(uv_connect_s*, int)) @nogc nothrow;
    int uv_pipe_getsockname(const(uv_pipe_s)*, char*, c_ulong*) @nogc nothrow;
    int uv_pipe_getpeername(const(uv_pipe_s)*, char*, c_ulong*) @nogc nothrow;
    void uv_pipe_pending_instances(uv_pipe_s*, int) @nogc nothrow;
    int uv_pipe_pending_count(uv_pipe_s*) @nogc nothrow;
    uv_handle_type uv_pipe_pending_type(uv_pipe_s*) @nogc nothrow;
    int uv_pipe_chmod(uv_pipe_s*, int) @nogc nothrow;
    enum uv_poll_event
    {
        UV_READABLE = 1,
        UV_WRITABLE = 2,
        UV_DISCONNECT = 4,
        UV_PRIORITIZED = 8,
    }
    enum UV_READABLE = uv_poll_event.UV_READABLE;
    enum UV_WRITABLE = uv_poll_event.UV_WRITABLE;
    enum UV_DISCONNECT = uv_poll_event.UV_DISCONNECT;
    enum UV_PRIORITIZED = uv_poll_event.UV_PRIORITIZED;
    int uv_poll_init(uv_loop_s*, uv_poll_s*, int) @nogc nothrow;
    int uv_poll_start(uv_poll_s*, int, void function(uv_poll_s*, int, int)) @nogc nothrow;
    int uv_poll_stop(uv_poll_s*) @nogc nothrow;
    int uv_prepare_init(uv_loop_s*, uv_prepare_s*) @nogc nothrow;
    int uv_prepare_start(uv_prepare_s*, void function(uv_prepare_s*)) @nogc nothrow;
    int uv_prepare_stop(uv_prepare_s*) @nogc nothrow;
    int uv_check_init(uv_loop_s*, uv_check_s*) @nogc nothrow;
    int uv_check_start(uv_check_s*, void function(uv_check_s*)) @nogc nothrow;
    int uv_check_stop(uv_check_s*) @nogc nothrow;
    int uv_idle_init(uv_loop_s*, uv_idle_s*) @nogc nothrow;
    int uv_idle_start(uv_idle_s*, void function(uv_idle_s*)) @nogc nothrow;
    int uv_idle_stop(uv_idle_s*) @nogc nothrow;
    int uv_async_init(uv_loop_s*, uv_async_s*, void function(uv_async_s*)) @nogc nothrow;
    int uv_async_send(uv_async_s*) @nogc nothrow;
    int uv_timer_init(uv_loop_s*, uv_timer_s*) @nogc nothrow;
    int uv_timer_start(uv_timer_s*, void function(uv_timer_s*), c_ulong, c_ulong) @nogc nothrow;
    int uv_timer_stop(uv_timer_s*) @nogc nothrow;
    int uv_timer_again(uv_timer_s*) @nogc nothrow;
    void uv_timer_set_repeat(uv_timer_s*, c_ulong) @nogc nothrow;
    c_ulong uv_timer_get_repeat(const(uv_timer_s)*) @nogc nothrow;
    int uv_getaddrinfo(uv_loop_s*, uv_getaddrinfo_s*, void function(uv_getaddrinfo_s*, int, addrinfo*), const(char)*, const(char)*, const(addrinfo)*) @nogc nothrow;
    void uv_freeaddrinfo(addrinfo*) @nogc nothrow;
    int uv_getnameinfo(uv_loop_s*, uv_getnameinfo_s*, void function(uv_getnameinfo_s*, int, const(char)*, const(char)*), const(sockaddr)*, int) @nogc nothrow;
    alias uv_stdio_flags = _Anonymous_52;
    enum _Anonymous_52
    {
        UV_IGNORE = 0,
        UV_CREATE_PIPE = 1,
        UV_INHERIT_FD = 2,
        UV_INHERIT_STREAM = 4,
        UV_READABLE_PIPE = 16,
        UV_WRITABLE_PIPE = 32,
        UV_NONBLOCK_PIPE = 64,
        UV_OVERLAPPED_PIPE = 64,
    }
    enum UV_IGNORE = _Anonymous_52.UV_IGNORE;
    enum UV_CREATE_PIPE = _Anonymous_52.UV_CREATE_PIPE;
    enum UV_INHERIT_FD = _Anonymous_52.UV_INHERIT_FD;
    enum UV_INHERIT_STREAM = _Anonymous_52.UV_INHERIT_STREAM;
    enum UV_READABLE_PIPE = _Anonymous_52.UV_READABLE_PIPE;
    enum UV_WRITABLE_PIPE = _Anonymous_52.UV_WRITABLE_PIPE;
    enum UV_NONBLOCK_PIPE = _Anonymous_52.UV_NONBLOCK_PIPE;
    enum UV_OVERLAPPED_PIPE = _Anonymous_52.UV_OVERLAPPED_PIPE;
    alias uv_stdio_container_t = uv_stdio_container_s;
    struct uv_stdio_container_s
    {
        uv_stdio_flags flags;
        static union _Anonymous_53
        {
            uv_stream_s* stream;
            int file;
        }
        _Anonymous_53 data;
    }
    alias uv_process_options_t = uv_process_options_s;
    struct uv_process_options_s
    {
        void function(uv_process_s*, c_long, int) exit_cb;
        const(char)* file;
        char** args;
        char** env;
        const(char)* cwd;
        uint flags;
        int stdio_count;
        uv_stdio_container_s* stdio;
        uint uid;
        uint gid;
        char* cpumask;
        c_ulong cpumask_size;
    }
    enum uv_process_flags
    {
        UV_PROCESS_SETUID = 1,
        UV_PROCESS_SETGID = 2,
        UV_PROCESS_WINDOWS_VERBATIM_ARGUMENTS = 4,
        UV_PROCESS_DETACHED = 8,
        UV_PROCESS_WINDOWS_HIDE = 16,
        UV_PROCESS_WINDOWS_HIDE_CONSOLE = 32,
        UV_PROCESS_WINDOWS_HIDE_GUI = 64,
    }
    enum UV_PROCESS_SETUID = uv_process_flags.UV_PROCESS_SETUID;
    enum UV_PROCESS_SETGID = uv_process_flags.UV_PROCESS_SETGID;
    enum UV_PROCESS_WINDOWS_VERBATIM_ARGUMENTS = uv_process_flags.UV_PROCESS_WINDOWS_VERBATIM_ARGUMENTS;
    enum UV_PROCESS_DETACHED = uv_process_flags.UV_PROCESS_DETACHED;
    enum UV_PROCESS_WINDOWS_HIDE = uv_process_flags.UV_PROCESS_WINDOWS_HIDE;
    enum UV_PROCESS_WINDOWS_HIDE_CONSOLE = uv_process_flags.UV_PROCESS_WINDOWS_HIDE_CONSOLE;
    enum UV_PROCESS_WINDOWS_HIDE_GUI = uv_process_flags.UV_PROCESS_WINDOWS_HIDE_GUI;
    int uv_spawn(uv_loop_s*, uv_process_s*, const(uv_process_options_s)*) @nogc nothrow;
    int uv_process_kill(uv_process_s*, int) @nogc nothrow;
    int uv_kill(int, int) @nogc nothrow;
    int uv_process_get_pid(const(uv_process_s)*) @nogc nothrow;
    int uv_queue_work(uv_loop_s*, uv_work_s*, void function(uv_work_s*), void function(uv_work_s*, int)) @nogc nothrow;
    int uv_cancel(uv_req_s*) @nogc nothrow;
    struct uv_cpu_times_s
    {
        c_ulong user;
        c_ulong nice;
        c_ulong sys;
        c_ulong idle;
        c_ulong irq;
    }
    alias uv_dirent_type_t = _Anonymous_54;
    enum _Anonymous_54
    {
        UV_DIRENT_UNKNOWN = 0,
        UV_DIRENT_FILE = 1,
        UV_DIRENT_DIR = 2,
        UV_DIRENT_LINK = 3,
        UV_DIRENT_FIFO = 4,
        UV_DIRENT_SOCKET = 5,
        UV_DIRENT_CHAR = 6,
        UV_DIRENT_BLOCK = 7,
    }
    enum UV_DIRENT_UNKNOWN = _Anonymous_54.UV_DIRENT_UNKNOWN;
    enum UV_DIRENT_FILE = _Anonymous_54.UV_DIRENT_FILE;
    enum UV_DIRENT_DIR = _Anonymous_54.UV_DIRENT_DIR;
    enum UV_DIRENT_LINK = _Anonymous_54.UV_DIRENT_LINK;
    enum UV_DIRENT_FIFO = _Anonymous_54.UV_DIRENT_FIFO;
    enum UV_DIRENT_SOCKET = _Anonymous_54.UV_DIRENT_SOCKET;
    enum UV_DIRENT_CHAR = _Anonymous_54.UV_DIRENT_CHAR;
    enum UV_DIRENT_BLOCK = _Anonymous_54.UV_DIRENT_BLOCK;
    char** uv_setup_args(int, char**) @nogc nothrow;
    int uv_get_process_title(char*, c_ulong) @nogc nothrow;
    int uv_set_process_title(const(char)*) @nogc nothrow;
    int uv_resident_set_memory(c_ulong*) @nogc nothrow;
    int uv_uptime(double*) @nogc nothrow;
    struct uv_timeval_t
    {
        c_long tv_sec;
        c_long tv_usec;
    }
    struct uv_rusage_t
    {
        uv_timeval_t ru_utime;
        uv_timeval_t ru_stime;
        c_ulong ru_maxrss;
        c_ulong ru_ixrss;
        c_ulong ru_idrss;
        c_ulong ru_isrss;
        c_ulong ru_minflt;
        c_ulong ru_majflt;
        c_ulong ru_nswap;
        c_ulong ru_inblock;
        c_ulong ru_oublock;
        c_ulong ru_msgsnd;
        c_ulong ru_msgrcv;
        c_ulong ru_nsignals;
        c_ulong ru_nvcsw;
        c_ulong ru_nivcsw;
    }
    int uv_getrusage(uv_rusage_t*) @nogc nothrow;
    int uv_os_homedir(char*, c_ulong*) @nogc nothrow;
    int uv_os_tmpdir(char*, c_ulong*) @nogc nothrow;
    int uv_os_get_passwd(uv_passwd_s*) @nogc nothrow;
    void uv_os_free_passwd(uv_passwd_s*) @nogc nothrow;
    int uv_os_getpid() @nogc nothrow;
    int uv_os_getppid() @nogc nothrow;
    static core.simd.long2 _mm_mask_cvtusepi32_epi16(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_cvtusepi32_epi16(core.simd.long2) @nogc nothrow;
    static void _mm256_mask_cvtusepi32_storeu_epi8(void*, ubyte, core.simd.long4) @nogc nothrow;
    int uv_os_getpriority(int, int*) @nogc nothrow;
    int uv_os_setpriority(int, int) @nogc nothrow;
    int uv_cpu_info(uv_cpu_info_s**, int*) @nogc nothrow;
    void uv_free_cpu_info(uv_cpu_info_s*, int) @nogc nothrow;
    int uv_cpumask_size() @nogc nothrow;
    int uv_interface_addresses(uv_interface_address_s**, int*) @nogc nothrow;
    void uv_free_interface_addresses(uv_interface_address_s*, int) @nogc nothrow;
    int uv_os_getenv(const(char)*, char*, c_ulong*) @nogc nothrow;
    int uv_os_setenv(const(char)*, const(char)*) @nogc nothrow;
    int uv_os_unsetenv(const(char)*) @nogc nothrow;
    int uv_os_gethostname(char*, c_ulong*) @nogc nothrow;
    alias uv_fs_type = _Anonymous_55;
    enum _Anonymous_55
    {
        UV_FS_UNKNOWN = -1,
        UV_FS_CUSTOM = 0,
        UV_FS_OPEN = 1,
        UV_FS_CLOSE = 2,
        UV_FS_READ = 3,
        UV_FS_WRITE = 4,
        UV_FS_SENDFILE = 5,
        UV_FS_STAT = 6,
        UV_FS_LSTAT = 7,
        UV_FS_FSTAT = 8,
        UV_FS_FTRUNCATE = 9,
        UV_FS_UTIME = 10,
        UV_FS_FUTIME = 11,
        UV_FS_ACCESS = 12,
        UV_FS_CHMOD = 13,
        UV_FS_FCHMOD = 14,
        UV_FS_FSYNC = 15,
        UV_FS_FDATASYNC = 16,
        UV_FS_UNLINK = 17,
        UV_FS_RMDIR = 18,
        UV_FS_MKDIR = 19,
        UV_FS_MKDTEMP = 20,
        UV_FS_RENAME = 21,
        UV_FS_SCANDIR = 22,
        UV_FS_LINK = 23,
        UV_FS_SYMLINK = 24,
        UV_FS_READLINK = 25,
        UV_FS_CHOWN = 26,
        UV_FS_FCHOWN = 27,
        UV_FS_LCHOWN = 28,
        UV_FS_REALPATH = 29,
        UV_FS_COPYFILE = 30,
    }
    enum UV_FS_UNKNOWN = _Anonymous_55.UV_FS_UNKNOWN;
    enum UV_FS_CUSTOM = _Anonymous_55.UV_FS_CUSTOM;
    enum UV_FS_OPEN = _Anonymous_55.UV_FS_OPEN;
    enum UV_FS_CLOSE = _Anonymous_55.UV_FS_CLOSE;
    enum UV_FS_READ = _Anonymous_55.UV_FS_READ;
    enum UV_FS_WRITE = _Anonymous_55.UV_FS_WRITE;
    enum UV_FS_SENDFILE = _Anonymous_55.UV_FS_SENDFILE;
    enum UV_FS_STAT = _Anonymous_55.UV_FS_STAT;
    enum UV_FS_LSTAT = _Anonymous_55.UV_FS_LSTAT;
    enum UV_FS_FSTAT = _Anonymous_55.UV_FS_FSTAT;
    enum UV_FS_FTRUNCATE = _Anonymous_55.UV_FS_FTRUNCATE;
    enum UV_FS_UTIME = _Anonymous_55.UV_FS_UTIME;
    enum UV_FS_FUTIME = _Anonymous_55.UV_FS_FUTIME;
    enum UV_FS_ACCESS = _Anonymous_55.UV_FS_ACCESS;
    enum UV_FS_CHMOD = _Anonymous_55.UV_FS_CHMOD;
    enum UV_FS_FCHMOD = _Anonymous_55.UV_FS_FCHMOD;
    enum UV_FS_FSYNC = _Anonymous_55.UV_FS_FSYNC;
    enum UV_FS_FDATASYNC = _Anonymous_55.UV_FS_FDATASYNC;
    enum UV_FS_UNLINK = _Anonymous_55.UV_FS_UNLINK;
    enum UV_FS_RMDIR = _Anonymous_55.UV_FS_RMDIR;
    enum UV_FS_MKDIR = _Anonymous_55.UV_FS_MKDIR;
    enum UV_FS_MKDTEMP = _Anonymous_55.UV_FS_MKDTEMP;
    enum UV_FS_RENAME = _Anonymous_55.UV_FS_RENAME;
    enum UV_FS_SCANDIR = _Anonymous_55.UV_FS_SCANDIR;
    enum UV_FS_LINK = _Anonymous_55.UV_FS_LINK;
    enum UV_FS_SYMLINK = _Anonymous_55.UV_FS_SYMLINK;
    enum UV_FS_READLINK = _Anonymous_55.UV_FS_READLINK;
    enum UV_FS_CHOWN = _Anonymous_55.UV_FS_CHOWN;
    enum UV_FS_FCHOWN = _Anonymous_55.UV_FS_FCHOWN;
    enum UV_FS_LCHOWN = _Anonymous_55.UV_FS_LCHOWN;
    enum UV_FS_REALPATH = _Anonymous_55.UV_FS_REALPATH;
    enum UV_FS_COPYFILE = _Anonymous_55.UV_FS_COPYFILE;
    uv_fs_type uv_fs_get_type(const(uv_fs_s)*) @nogc nothrow;
    c_long uv_fs_get_result(const(uv_fs_s)*) @nogc nothrow;
    void* uv_fs_get_ptr(const(uv_fs_s)*) @nogc nothrow;
    const(char)* uv_fs_get_path(const(uv_fs_s)*) @nogc nothrow;
    uv_stat_t* uv_fs_get_statbuf(uv_fs_s*) @nogc nothrow;
    void uv_fs_req_cleanup(uv_fs_s*) @nogc nothrow;
    int uv_fs_close(uv_loop_s*, uv_fs_s*, int, void function(uv_fs_s*)) @nogc nothrow;
    int uv_fs_open(uv_loop_s*, uv_fs_s*, const(char)*, int, int, void function(uv_fs_s*)) @nogc nothrow;
    int uv_fs_read(uv_loop_s*, uv_fs_s*, int, const(uv_buf_t)*, uint, c_long, void function(uv_fs_s*)) @nogc nothrow;
    int uv_fs_unlink(uv_loop_s*, uv_fs_s*, const(char)*, void function(uv_fs_s*)) @nogc nothrow;
    int uv_fs_write(uv_loop_s*, uv_fs_s*, int, const(uv_buf_t)*, uint, c_long, void function(uv_fs_s*)) @nogc nothrow;
    static core.simd.long2 _mm256_maskz_cvtusepi32_epi8(ubyte, core.simd.long4) @nogc nothrow;
    int uv_fs_copyfile(uv_loop_s*, uv_fs_s*, const(char)*, const(char)*, int, void function(uv_fs_s*)) @nogc nothrow;
    int uv_fs_mkdir(uv_loop_s*, uv_fs_s*, const(char)*, int, void function(uv_fs_s*)) @nogc nothrow;
    int uv_fs_mkdtemp(uv_loop_s*, uv_fs_s*, const(char)*, void function(uv_fs_s*)) @nogc nothrow;
    int uv_fs_rmdir(uv_loop_s*, uv_fs_s*, const(char)*, void function(uv_fs_s*)) @nogc nothrow;
    int uv_fs_scandir(uv_loop_s*, uv_fs_s*, const(char)*, int, void function(uv_fs_s*)) @nogc nothrow;
    int uv_fs_scandir_next(uv_fs_s*, uv_dirent_s*) @nogc nothrow;
    int uv_fs_stat(uv_loop_s*, uv_fs_s*, const(char)*, void function(uv_fs_s*)) @nogc nothrow;
    int uv_fs_fstat(uv_loop_s*, uv_fs_s*, int, void function(uv_fs_s*)) @nogc nothrow;
    int uv_fs_rename(uv_loop_s*, uv_fs_s*, const(char)*, const(char)*, void function(uv_fs_s*)) @nogc nothrow;
    int uv_fs_fsync(uv_loop_s*, uv_fs_s*, int, void function(uv_fs_s*)) @nogc nothrow;
    int uv_fs_fdatasync(uv_loop_s*, uv_fs_s*, int, void function(uv_fs_s*)) @nogc nothrow;
    int uv_fs_ftruncate(uv_loop_s*, uv_fs_s*, int, c_long, void function(uv_fs_s*)) @nogc nothrow;
    int uv_fs_sendfile(uv_loop_s*, uv_fs_s*, int, int, c_long, c_ulong, void function(uv_fs_s*)) @nogc nothrow;
    int uv_fs_access(uv_loop_s*, uv_fs_s*, const(char)*, int, void function(uv_fs_s*)) @nogc nothrow;
    int uv_fs_chmod(uv_loop_s*, uv_fs_s*, const(char)*, int, void function(uv_fs_s*)) @nogc nothrow;
    int uv_fs_utime(uv_loop_s*, uv_fs_s*, const(char)*, double, double, void function(uv_fs_s*)) @nogc nothrow;
    int uv_fs_utime_ex(uv_loop_s*, uv_fs_s*, const(char)*, double, double, double, void function(uv_fs_s*)) @nogc nothrow;
    int uv_fs_futime(uv_loop_s*, uv_fs_s*, int, double, double, void function(uv_fs_s*)) @nogc nothrow;
    int uv_fs_futime_ex(uv_loop_s*, uv_fs_s*, int, double, double, double, void function(uv_fs_s*)) @nogc nothrow;
    int uv_fs_lstat(uv_loop_s*, uv_fs_s*, const(char)*, void function(uv_fs_s*)) @nogc nothrow;
    int uv_fs_link(uv_loop_s*, uv_fs_s*, const(char)*, const(char)*, void function(uv_fs_s*)) @nogc nothrow;
    static core.simd.long2 _mm256_mask_cvtusepi32_epi8(core.simd.long2, ubyte, core.simd.long4) @nogc nothrow;
    int uv_fs_symlink(uv_loop_s*, uv_fs_s*, const(char)*, const(char)*, int, void function(uv_fs_s*)) @nogc nothrow;
    int uv_fs_readlink(uv_loop_s*, uv_fs_s*, const(char)*, void function(uv_fs_s*)) @nogc nothrow;
    int uv_fs_realpath(uv_loop_s*, uv_fs_s*, const(char)*, void function(uv_fs_s*)) @nogc nothrow;
    int uv_fs_fchmod(uv_loop_s*, uv_fs_s*, int, int, void function(uv_fs_s*)) @nogc nothrow;
    int uv_fs_chown(uv_loop_s*, uv_fs_s*, const(char)*, uint, uint, void function(uv_fs_s*)) @nogc nothrow;
    int uv_fs_fchown(uv_loop_s*, uv_fs_s*, int, uint, uint, void function(uv_fs_s*)) @nogc nothrow;
    int uv_fs_lchown(uv_loop_s*, uv_fs_s*, const(char)*, uint, uint, void function(uv_fs_s*)) @nogc nothrow;
    enum uv_fs_event
    {
        UV_RENAME = 1,
        UV_CHANGE = 2,
    }
    enum UV_RENAME = uv_fs_event.UV_RENAME;
    enum UV_CHANGE = uv_fs_event.UV_CHANGE;
    int uv_fs_poll_init(uv_loop_s*, uv_fs_poll_s*) @nogc nothrow;
    int uv_fs_poll_start(uv_fs_poll_s*, void function(uv_fs_poll_s*, int, const(uv_stat_t)*, const(uv_stat_t)*), const(char)*, uint) @nogc nothrow;
    int uv_fs_poll_stop(uv_fs_poll_s*) @nogc nothrow;
    int uv_fs_poll_getpath(uv_fs_poll_s*, char*, c_ulong*) @nogc nothrow;
    int uv_signal_init(uv_loop_s*, uv_signal_s*) @nogc nothrow;
    int uv_signal_start(uv_signal_s*, void function(uv_signal_s*, int), int) @nogc nothrow;
    int uv_signal_start_oneshot(uv_signal_s*, void function(uv_signal_s*, int), int) @nogc nothrow;
    int uv_signal_stop(uv_signal_s*) @nogc nothrow;
    void uv_loadavg(double*) @nogc nothrow;
    enum uv_fs_event_flags
    {
        UV_FS_EVENT_WATCH_ENTRY = 1,
        UV_FS_EVENT_STAT = 2,
        UV_FS_EVENT_RECURSIVE = 4,
    }
    enum UV_FS_EVENT_WATCH_ENTRY = uv_fs_event_flags.UV_FS_EVENT_WATCH_ENTRY;
    enum UV_FS_EVENT_STAT = uv_fs_event_flags.UV_FS_EVENT_STAT;
    enum UV_FS_EVENT_RECURSIVE = uv_fs_event_flags.UV_FS_EVENT_RECURSIVE;
    int uv_fs_event_init(uv_loop_s*, uv_fs_event_s*) @nogc nothrow;
    int uv_fs_event_start(uv_fs_event_s*, void function(uv_fs_event_s*, const(char)*, int, int), const(char)*, uint) @nogc nothrow;
    int uv_fs_event_stop(uv_fs_event_s*) @nogc nothrow;
    int uv_fs_event_getpath(uv_fs_event_s*, char*, c_ulong*) @nogc nothrow;
    int uv_ip4_addr(const(char)*, int, sockaddr_in*) @nogc nothrow;
    int uv_ip6_addr(const(char)*, int, sockaddr_in6*) @nogc nothrow;
    int uv_ip4_name(const(sockaddr_in)*, char*, c_ulong) @nogc nothrow;
    int uv_ip6_name(const(sockaddr_in6)*, char*, c_ulong) @nogc nothrow;
    int uv_inet_ntop(int, const(void)*, char*, c_ulong) @nogc nothrow;
    int uv_inet_pton(int, const(char)*, void*) @nogc nothrow;
    static core.simd.long2 _mm256_cvtusepi32_epi8(core.simd.long4) @nogc nothrow;
    int uv_if_indextoname(uint, char*, c_ulong*) @nogc nothrow;
    int uv_if_indextoiid(uint, char*, c_ulong*) @nogc nothrow;
    int uv_exepath(char*, c_ulong*) @nogc nothrow;
    int uv_cwd(char*, c_ulong*) @nogc nothrow;
    int uv_chdir(const(char)*) @nogc nothrow;
    c_ulong uv_get_free_memory() @nogc nothrow;
    c_ulong uv_get_total_memory() @nogc nothrow;
    c_ulong uv_hrtime() @nogc nothrow;
    void uv_disable_stdio_inheritance() @nogc nothrow;
    int uv_dlopen(const(char)*, uv_lib_t*) @nogc nothrow;
    void uv_dlclose(uv_lib_t*) @nogc nothrow;
    int uv_dlsym(uv_lib_t*, const(char)*, void**) @nogc nothrow;
    const(char)* uv_dlerror(const(uv_lib_t)*) @nogc nothrow;
    int uv_mutex_init(pthread_mutex_t*) @nogc nothrow;
    int uv_mutex_init_recursive(pthread_mutex_t*) @nogc nothrow;
    void uv_mutex_destroy(pthread_mutex_t*) @nogc nothrow;
    void uv_mutex_lock(pthread_mutex_t*) @nogc nothrow;
    int uv_mutex_trylock(pthread_mutex_t*) @nogc nothrow;
    void uv_mutex_unlock(pthread_mutex_t*) @nogc nothrow;
    int uv_rwlock_init(pthread_rwlock_t*) @nogc nothrow;
    void uv_rwlock_destroy(pthread_rwlock_t*) @nogc nothrow;
    void uv_rwlock_rdlock(pthread_rwlock_t*) @nogc nothrow;
    int uv_rwlock_tryrdlock(pthread_rwlock_t*) @nogc nothrow;
    void uv_rwlock_rdunlock(pthread_rwlock_t*) @nogc nothrow;
    void uv_rwlock_wrlock(pthread_rwlock_t*) @nogc nothrow;
    int uv_rwlock_trywrlock(pthread_rwlock_t*) @nogc nothrow;
    void uv_rwlock_wrunlock(pthread_rwlock_t*) @nogc nothrow;
    int uv_sem_init(sem_t*, uint) @nogc nothrow;
    void uv_sem_destroy(sem_t*) @nogc nothrow;
    void uv_sem_post(sem_t*) @nogc nothrow;
    void uv_sem_wait(sem_t*) @nogc nothrow;
    int uv_sem_trywait(sem_t*) @nogc nothrow;
    int uv_cond_init(pthread_cond_t*) @nogc nothrow;
    void uv_cond_destroy(pthread_cond_t*) @nogc nothrow;
    void uv_cond_signal(pthread_cond_t*) @nogc nothrow;
    void uv_cond_broadcast(pthread_cond_t*) @nogc nothrow;
    int uv_barrier_init(pthread_barrier_t*, uint) @nogc nothrow;
    void uv_barrier_destroy(pthread_barrier_t*) @nogc nothrow;
    int uv_barrier_wait(pthread_barrier_t*) @nogc nothrow;
    void uv_cond_wait(pthread_cond_t*, pthread_mutex_t*) @nogc nothrow;
    int uv_cond_timedwait(pthread_cond_t*, pthread_mutex_t*, c_ulong) @nogc nothrow;
    void uv_once(int*, void function()) @nogc nothrow;
    int uv_key_create(uint*) @nogc nothrow;
    void uv_key_delete(uint*) @nogc nothrow;
    void* uv_key_get(uint*) @nogc nothrow;
    void uv_key_set(uint*, void*) @nogc nothrow;
    alias uv_thread_cb = void function(void*);
    int uv_thread_create(c_ulong*, void function(void*), void*) @nogc nothrow;
    int uv_thread_setaffinity(c_ulong*, char*, char*, c_ulong) @nogc nothrow;
    int uv_thread_getaffinity(c_ulong*, char*, c_ulong) @nogc nothrow;
    int uv_thread_detach(c_ulong*) @nogc nothrow;
    c_ulong uv_thread_self() @nogc nothrow;
    int uv_thread_join(c_ulong*) @nogc nothrow;
    int uv_thread_equal(const(c_ulong)*, const(c_ulong)*) @nogc nothrow;
    union uv_any_handle
    {
        uv_async_s async;
        uv_check_s check;
        uv_fs_event_s fs_event;
        uv_fs_poll_s fs_poll;
        uv_handle_s handle;
        uv_idle_s idle;
        uv_pipe_s pipe;
        uv_poll_s poll;
        uv_prepare_s prepare;
        uv_process_s process;
        uv_stream_s stream;
        uv_tcp_s tcp;
        uv_timer_s timer;
        uv_tty_s tty;
        uv_udp_s udp;
        uv_signal_s signal;
    }
    union uv_any_req
    {
        uv_req_s req;
        uv_connect_s connect;
        uv_write_s write;
        uv_shutdown_s shutdown;
        uv_udp_send_s udp_send;
        uv_fs_s fs;
        uv_work_s work;
        uv_getaddrinfo_s getaddrinfo;
        uv_getnameinfo_s getnameinfo;
    }
    void* uv_loop_get_data(const(uv_loop_s)*) @nogc nothrow;
    void uv_loop_set_data(uv_loop_s*, void*) @nogc nothrow;
    static void _mm_mask_cvtusepi32_storeu_epi8(void*, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_cvtusepi32_epi8(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_cvtusepi32_epi8(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_cvtusepi32_epi8(core.simd.long2) @nogc nothrow;
    static void _mm256_mask_cvtsepi64_storeu_epi16(void*, ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm256_maskz_cvtsepi64_epi16(ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm256_mask_cvtsepi64_epi16(core.simd.long2, ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm256_cvtsepi64_epi16(core.simd.long4) @nogc nothrow;
    static void _mm_mask_cvtsepi64_storeu_epi16(void*, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_cvtsepi64_epi16(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_cvtsepi64_epi16(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_cvtsepi64_epi16(core.simd.long2) @nogc nothrow;
    static void _mm256_mask_cvtsepi64_storeu_epi32(void*, ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm256_maskz_cvtsepi64_epi32(ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm256_mask_cvtsepi64_epi32(core.simd.long2, ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm256_cvtsepi64_epi32(core.simd.long4) @nogc nothrow;
    static void _mm_mask_cvtsepi64_storeu_epi32(void*, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_cvtsepi64_epi32(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_cvtsepi64_epi32(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_cvtsepi64_epi32(core.simd.long2) @nogc nothrow;
    static void _mm256_mask_cvtsepi64_storeu_epi8(void*, ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm256_maskz_cvtsepi64_epi8(ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm256_mask_cvtsepi64_epi8(core.simd.long2, ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm256_cvtsepi64_epi8(core.simd.long4) @nogc nothrow;
    static void _mm_mask_cvtsepi64_storeu_epi8(void*, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_cvtsepi64_epi8(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_cvtsepi64_epi8(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_cvtsepi64_epi8(core.simd.long2) @nogc nothrow;
    static void _mm256_mask_cvtsepi32_storeu_epi16(void*, ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm256_maskz_cvtsepi32_epi16(ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm256_mask_cvtsepi32_epi16(core.simd.long2, ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm256_cvtsepi32_epi16(core.simd.long4) @nogc nothrow;
    static void _mm_mask_cvtsepi32_storeu_epi16(void*, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_cvtsepi32_epi16(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_cvtsepi32_epi16(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_cvtsepi32_epi16(core.simd.long2) @nogc nothrow;
    static void _mm256_mask_cvtsepi32_storeu_epi8(void*, ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm256_maskz_cvtsepi32_epi8(ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm256_mask_cvtsepi32_epi8(core.simd.long2, ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm256_cvtsepi32_epi8(core.simd.long4) @nogc nothrow;
    static void _mm_mask_cvtsepi32_storeu_epi8(void*, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_cvtsepi32_epi8(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_cvtsepi32_epi8(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    struct uv__work
    {
        void function(uv__work*) work;
        void function(uv__work*, int) done;
        uv_loop_s* loop;
        void*[2] wq;
    }
    struct uv_loop_s
    {
        void* data;
        uint active_handles;
        void*[2] handle_queue;
        static union _Anonymous_56
        {
            void*[2] unused;
            uint count;
        }
        _Anonymous_56 active_reqs;
        uint stop_flag;
        void*[4] reserved;
        c_ulong flags;
        int backend_fd;
        void*[2] pending_queue;
        void*[2] watcher_queue;
        uv__io_s** watchers;
        uint nwatchers;
        uint nfds;
        void*[2] wq;
        pthread_mutex_t wq_mutex;
        uv_async_s wq_async;
        pthread_rwlock_t cloexec_lock;
        uv_handle_s* closing_handles;
        void*[2] process_handles;
        void*[2] prepare_handles;
        void*[2] check_handles;
        void*[2] idle_handles;
        void*[2] async_handles;
        void function() async_unused;
        uv__io_s async_io_watcher;
        int async_wfd;
        static struct _Anonymous_57
        {
            void* min;
            uint nelts;
        }
        _Anonymous_57 timer_heap;
        c_ulong timer_counter;
        c_ulong time;
        int[2] signal_pipefd;
        uv__io_s signal_io_watcher;
        uv_signal_s child_watcher;
        int emfile_fd;
        uv__io_s inotify_read_watcher;
        void* inotify_watchers;
        int inotify_fd;
    }
    static core.simd.long2 _mm_cvtsepi32_epi8(core.simd.long2) @nogc nothrow;
    struct uv__io_s
    {
        void function(uv_loop_s*, uv__io_s*, uint) cb;
        void*[2] pending_queue;
        void*[2] watcher_queue;
        uint pevents;
        uint events;
        int fd;
    }
    alias uv__io_cb = void function(uv_loop_s*, uv__io_s*, uint);
    alias uv__io_t = uv__io_s;
    static core.simd.long4 _mm256_maskz_broadcastq_epi64(ubyte, core.simd.long2) @nogc nothrow;
    struct uv_buf_t
    {
        char* base;
        c_ulong len;
    }
    alias uv_os_sock_t = int;
    alias uv_os_fd_t = int;
    alias uv_pid_t = int;
    alias uv_once_t = int;
    alias uv_thread_t = c_ulong;
    alias uv_mutex_t = pthread_mutex_t;
    alias uv_rwlock_t = pthread_rwlock_t;
    alias uv_sem_t = sem_t;
    alias uv_cond_t = pthread_cond_t;
    alias uv_key_t = uint;
    alias uv_barrier_t = pthread_barrier_t;
    alias uv_gid_t = uint;
    alias uv_uid_t = uint;
    alias uv__dirent_t = dirent;
    static core.simd.long4 _mm256_mask_broadcastq_epi64(core.simd.long4, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_broadcastq_epi64(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_broadcastq_epi64(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_broadcastd_epi32(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_broadcastd_epi32(core.simd.long4, ubyte, core.simd.long2) @nogc nothrow;
    struct uv_lib_t
    {
        void* handle;
        char* errmsg;
    }
    static core.simd.long2 _mm_maskz_broadcastd_epi32(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_broadcastd_epi32(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.float8 _mm256_maskz_broadcastss_ps(ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.float8 _mm256_mask_broadcastss_ps(core.simd.float8, ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_maskz_broadcastss_ps(ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_mask_broadcastss_ps(core.simd.float4, ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.double4 _mm256_maskz_broadcastsd_pd(ubyte, core.simd.double2) @nogc nothrow;
    static core.simd.double4 _mm256_mask_broadcastsd_pd(core.simd.double4, ubyte, core.simd.double2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_broadcast_i32x4(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_broadcast_i32x4(core.simd.long4, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_broadcast_i32x4(core.simd.long2) @nogc nothrow;
    static core.simd.float8 _mm256_maskz_broadcast_f32x4(ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.float8 _mm256_mask_broadcast_f32x4(core.simd.float8, ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.float8 _mm256_broadcast_f32x4(core.simd.float4) @nogc nothrow;
    static core.simd.float8 _mm256_maskz_rsqrt14_ps(ubyte, core.simd.float8) @nogc nothrow;
    static core.simd.float8 _mm256_mask_rsqrt14_ps(core.simd.float8, ubyte, core.simd.float8) @nogc nothrow;
    static core.simd.float8 _mm256_rsqrt14_ps(core.simd.float8) @nogc nothrow;
    static core.simd.float4 _mm_maskz_rsqrt14_ps(ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_mask_rsqrt14_ps(core.simd.float4, ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_rsqrt14_ps(core.simd.float4) @nogc nothrow;
    static core.simd.double4 _mm256_maskz_rsqrt14_pd(ubyte, core.simd.double4) @nogc nothrow;
    static core.simd.double4 _mm256_mask_rsqrt14_pd(core.simd.double4, ubyte, core.simd.double4) @nogc nothrow;
    static core.simd.double4 _mm256_rsqrt14_pd(core.simd.double4) @nogc nothrow;
    static core.simd.double2 _mm_maskz_rsqrt14_pd(ubyte, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_mask_rsqrt14_pd(core.simd.double2, ubyte, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_rsqrt14_pd(core.simd.double2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_srai_epi64(ubyte, core.simd.long4, int) @nogc nothrow;
    static core.simd.long4 _mm256_mask_srai_epi64(core.simd.long4, ubyte, core.simd.long4, int) @nogc nothrow;
    static core.simd.long4 _mm256_srai_epi64(core.simd.long4, int) @nogc nothrow;
    static core.simd.long2 _mm_maskz_srai_epi64(ubyte, core.simd.long2, int) @nogc nothrow;
    static core.simd.long2 _mm_mask_srai_epi64(core.simd.long2, ubyte, core.simd.long2, int) @nogc nothrow;
    static core.simd.long2 _mm_srai_epi64(core.simd.long2, int) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_sra_epi64(ubyte, core.simd.long4, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_sra_epi64(core.simd.long4, ubyte, core.simd.long4, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_sra_epi64(core.simd.long4, core.simd.long2) @nogc nothrow;
    struct __kernel_fd_set
    {
        c_ulong[16] fds_bits;
    }
    alias __kernel_sighandler_t = void function(int);
    alias __kernel_key_t = int;
    alias __kernel_mqd_t = int;
    static core.simd.long2 _mm_maskz_sra_epi64(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_sra_epi64(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_sra_epi64(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_srai_epi32(ubyte, core.simd.long4, int) @nogc nothrow;
    alias float_t = float;
    alias double_t = double;
    static core.simd.long4 _mm256_mask_srai_epi32(core.simd.long4, ubyte, core.simd.long4, int) @nogc nothrow;
    static core.simd.long2 _mm_maskz_srai_epi32(ubyte, core.simd.long2, int) @nogc nothrow;
    static core.simd.long2 _mm_mask_srai_epi32(core.simd.long2, ubyte, core.simd.long2, int) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_sra_epi32(ubyte, core.simd.long4, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_sra_epi32(core.simd.long4, ubyte, core.simd.long4, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_sra_epi32(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_sra_epi32(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_unpacklo_epi64(ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_unpacklo_epi64(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_unpacklo_epi64(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_unpacklo_epi64(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_unpacklo_epi32(ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_unpacklo_epi32(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_unpacklo_epi32(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_unpacklo_epi32(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_unpackhi_epi64(ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_unpackhi_epi64(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_unpackhi_epi64(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_unpackhi_epi64(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_unpackhi_epi32(ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_unpackhi_epi32(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_unpackhi_epi32(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    extern __gshared int signgam;
    static core.simd.long2 _mm_mask_unpackhi_epi32(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    enum _Anonymous_58
    {
        FP_NAN = 0,
        FP_INFINITE = 1,
        FP_ZERO = 2,
        FP_SUBNORMAL = 3,
        FP_NORMAL = 4,
    }
    enum FP_NAN = _Anonymous_58.FP_NAN;
    enum FP_INFINITE = _Anonymous_58.FP_INFINITE;
    enum FP_ZERO = _Anonymous_58.FP_ZERO;
    enum FP_SUBNORMAL = _Anonymous_58.FP_SUBNORMAL;
    enum FP_NORMAL = _Anonymous_58.FP_NORMAL;
    static ubyte _mm256_mask_testn_epi64_mask(ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static ubyte _mm256_testn_epi64_mask(core.simd.long4, core.simd.long4) @nogc nothrow;
    static ubyte _mm_mask_testn_epi64_mask(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static ubyte _mm_testn_epi64_mask(core.simd.long2, core.simd.long2) @nogc nothrow;
    static ubyte _mm256_mask_testn_epi32_mask(ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static ubyte _mm256_testn_epi32_mask(core.simd.long4, core.simd.long4) @nogc nothrow;
    static ubyte _mm_mask_testn_epi32_mask(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static ubyte _mm_testn_epi32_mask(core.simd.long2, core.simd.long2) @nogc nothrow;
    static ubyte _mm256_mask_test_epi64_mask(ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static ubyte _mm256_test_epi64_mask(core.simd.long4, core.simd.long4) @nogc nothrow;
    static ubyte _mm_mask_test_epi64_mask(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static ubyte _mm_test_epi64_mask(core.simd.long2, core.simd.long2) @nogc nothrow;
    static ubyte _mm256_mask_test_epi32_mask(ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    int* __h_errno_location() @nogc nothrow;
    static ubyte _mm256_test_epi32_mask(core.simd.long4, core.simd.long4) @nogc nothrow;
    static ubyte _mm_mask_test_epi32_mask(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static ubyte _mm_test_epi32_mask(core.simd.long2, core.simd.long2) @nogc nothrow;
    void herror(const(char)*) @nogc nothrow;
    const(char)* hstrerror(int) @nogc nothrow;
    struct hostent
    {
        char* h_name;
        char** h_aliases;
        int h_addrtype;
        int h_length;
        char** h_addr_list;
    }
    static core.simd.float8 _mm256_maskz_permutevar_ps(ubyte, core.simd.float8, core.simd.long4) @nogc nothrow;
    void sethostent(int) @nogc nothrow;
    void endhostent() @nogc nothrow;
    hostent* gethostent() @nogc nothrow;
    hostent* gethostbyaddr(const(void)*, uint, int) @nogc nothrow;
    hostent* gethostbyname(const(char)*) @nogc nothrow;
    hostent* gethostbyname2(const(char)*, int) @nogc nothrow;
    int gethostent_r(hostent*, char*, c_ulong, hostent**, int*) @nogc nothrow;
    int gethostbyaddr_r(const(void)*, uint, int, hostent*, char*, c_ulong, hostent**, int*) @nogc nothrow;
    int gethostbyname_r(const(char)*, hostent*, char*, c_ulong, hostent**, int*) @nogc nothrow;
    int gethostbyname2_r(const(char)*, int, hostent*, char*, c_ulong, hostent**, int*) @nogc nothrow;
    void setnetent(int) @nogc nothrow;
    void endnetent() @nogc nothrow;
    netent* getnetent() @nogc nothrow;
    netent* getnetbyaddr(uint, int) @nogc nothrow;
    netent* getnetbyname(const(char)*) @nogc nothrow;
    int getnetent_r(netent*, char*, c_ulong, netent**, int*) @nogc nothrow;
    int getnetbyaddr_r(uint, int, netent*, char*, c_ulong, netent**, int*) @nogc nothrow;
    int getnetbyname_r(const(char)*, netent*, char*, c_ulong, netent**, int*) @nogc nothrow;
    struct servent
    {
        char* s_name;
        char** s_aliases;
        int s_port;
        char* s_proto;
    }
    void setservent(int) @nogc nothrow;
    void endservent() @nogc nothrow;
    servent* getservent() @nogc nothrow;
    servent* getservbyname(const(char)*, const(char)*) @nogc nothrow;
    servent* getservbyport(int, const(char)*) @nogc nothrow;
    int getservent_r(servent*, char*, c_ulong, servent**) @nogc nothrow;
    int getservbyname_r(const(char)*, const(char)*, servent*, char*, c_ulong, servent**) @nogc nothrow;
    int getservbyport_r(int, const(char)*, servent*, char*, c_ulong, servent**) @nogc nothrow;
    struct protoent
    {
        char* p_name;
        char** p_aliases;
        int p_proto;
    }
    void setprotoent(int) @nogc nothrow;
    void endprotoent() @nogc nothrow;
    protoent* getprotoent() @nogc nothrow;
    protoent* getprotobyname(const(char)*) @nogc nothrow;
    protoent* getprotobynumber(int) @nogc nothrow;
    int getprotoent_r(protoent*, char*, c_ulong, protoent**) @nogc nothrow;
    int getprotobyname_r(const(char)*, protoent*, char*, c_ulong, protoent**) @nogc nothrow;
    int getprotobynumber_r(int, protoent*, char*, c_ulong, protoent**) @nogc nothrow;
    int setnetgrent(const(char)*) @nogc nothrow;
    void endnetgrent() @nogc nothrow;
    int getnetgrent(char**, char**, char**) @nogc nothrow;
    int innetgr(const(char)*, const(char)*, const(char)*, const(char)*) @nogc nothrow;
    int getnetgrent_r(char**, char**, char**, char*, c_ulong) @nogc nothrow;
    int rcmd(char**, ushort, const(char)*, const(char)*, const(char)*, int*) @nogc nothrow;
    int rcmd_af(char**, ushort, const(char)*, const(char)*, const(char)*, int*, ushort) @nogc nothrow;
    int rexec(char**, int, const(char)*, const(char)*, const(char)*, int*) @nogc nothrow;
    int rexec_af(char**, int, const(char)*, const(char)*, const(char)*, int*, ushort) @nogc nothrow;
    int ruserok(const(char)*, int, const(char)*, const(char)*) @nogc nothrow;
    int ruserok_af(const(char)*, int, const(char)*, const(char)*, ushort) @nogc nothrow;
    int iruserok(uint, int, const(char)*, const(char)*) @nogc nothrow;
    int iruserok_af(const(void)*, int, const(char)*, const(char)*, ushort) @nogc nothrow;
    int rresvport(int*) @nogc nothrow;
    int rresvport_af(int*, ushort) @nogc nothrow;
    struct addrinfo
    {
        int ai_flags;
        int ai_family;
        int ai_socktype;
        int ai_protocol;
        uint ai_addrlen;
        sockaddr* ai_addr;
        char* ai_canonname;
        addrinfo* ai_next;
    }
    static core.simd.float8 _mm256_mask_permutevar_ps(core.simd.float8, ubyte, core.simd.float8, core.simd.long4) @nogc nothrow;
    static core.simd.float4 _mm_maskz_permutevar_ps(ubyte, core.simd.float4, core.simd.long2) @nogc nothrow;
    static core.simd.float4 _mm_mask_permutevar_ps(core.simd.float4, ubyte, core.simd.float4, core.simd.long2) @nogc nothrow;
    static core.simd.double4 _mm256_maskz_permutevar_pd(ubyte, core.simd.double4, core.simd.long4) @nogc nothrow;
    static core.simd.double4 _mm256_mask_permutevar_pd(core.simd.double4, ubyte, core.simd.double4, core.simd.long4) @nogc nothrow;
    static core.simd.double2 _mm_maskz_permutevar_pd(ubyte, core.simd.double2, core.simd.long2) @nogc nothrow;
    static core.simd.double2 _mm_mask_permutevar_pd(core.simd.double2, ubyte, core.simd.double2, core.simd.long2) @nogc nothrow;
    static core.simd.float8 _mm256_maskz_rcp14_ps(ubyte, core.simd.float8) @nogc nothrow;
    static core.simd.float8 _mm256_mask_rcp14_ps(core.simd.float8, ubyte, core.simd.float8) @nogc nothrow;
    static core.simd.float8 _mm256_rcp14_ps(core.simd.float8) @nogc nothrow;
    static core.simd.float4 _mm_maskz_rcp14_ps(ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_mask_rcp14_ps(core.simd.float4, ubyte, core.simd.float4) @nogc nothrow;
    int getaddrinfo(const(char)*, const(char)*, const(addrinfo)*, addrinfo**) @nogc nothrow;
    void freeaddrinfo(addrinfo*) @nogc nothrow;
    const(char)* gai_strerror(int) @nogc nothrow;
    int getnameinfo(const(sockaddr)*, uint, char*, uint, char*, uint, int) @nogc nothrow;
    alias in_addr_t = uint;
    struct in_addr
    {
        uint s_addr;
    }
    enum _Anonymous_59
    {
        IPPROTO_IP = 0,
        IPPROTO_ICMP = 1,
        IPPROTO_IGMP = 2,
        IPPROTO_IPIP = 4,
        IPPROTO_TCP = 6,
        IPPROTO_EGP = 8,
        IPPROTO_PUP = 12,
        IPPROTO_UDP = 17,
        IPPROTO_IDP = 22,
        IPPROTO_TP = 29,
        IPPROTO_DCCP = 33,
        IPPROTO_IPV6 = 41,
        IPPROTO_RSVP = 46,
        IPPROTO_GRE = 47,
        IPPROTO_ESP = 50,
        IPPROTO_AH = 51,
        IPPROTO_MTP = 92,
        IPPROTO_BEETPH = 94,
        IPPROTO_ENCAP = 98,
        IPPROTO_PIM = 103,
        IPPROTO_COMP = 108,
        IPPROTO_SCTP = 132,
        IPPROTO_UDPLITE = 136,
        IPPROTO_MPLS = 137,
        IPPROTO_RAW = 255,
        IPPROTO_MAX = 256,
    }
    enum IPPROTO_IP = _Anonymous_59.IPPROTO_IP;
    enum IPPROTO_ICMP = _Anonymous_59.IPPROTO_ICMP;
    enum IPPROTO_IGMP = _Anonymous_59.IPPROTO_IGMP;
    enum IPPROTO_IPIP = _Anonymous_59.IPPROTO_IPIP;
    enum IPPROTO_TCP = _Anonymous_59.IPPROTO_TCP;
    enum IPPROTO_EGP = _Anonymous_59.IPPROTO_EGP;
    enum IPPROTO_PUP = _Anonymous_59.IPPROTO_PUP;
    enum IPPROTO_UDP = _Anonymous_59.IPPROTO_UDP;
    enum IPPROTO_IDP = _Anonymous_59.IPPROTO_IDP;
    enum IPPROTO_TP = _Anonymous_59.IPPROTO_TP;
    enum IPPROTO_DCCP = _Anonymous_59.IPPROTO_DCCP;
    enum IPPROTO_IPV6 = _Anonymous_59.IPPROTO_IPV6;
    enum IPPROTO_RSVP = _Anonymous_59.IPPROTO_RSVP;
    enum IPPROTO_GRE = _Anonymous_59.IPPROTO_GRE;
    enum IPPROTO_ESP = _Anonymous_59.IPPROTO_ESP;
    enum IPPROTO_AH = _Anonymous_59.IPPROTO_AH;
    enum IPPROTO_MTP = _Anonymous_59.IPPROTO_MTP;
    enum IPPROTO_BEETPH = _Anonymous_59.IPPROTO_BEETPH;
    enum IPPROTO_ENCAP = _Anonymous_59.IPPROTO_ENCAP;
    enum IPPROTO_PIM = _Anonymous_59.IPPROTO_PIM;
    enum IPPROTO_COMP = _Anonymous_59.IPPROTO_COMP;
    enum IPPROTO_SCTP = _Anonymous_59.IPPROTO_SCTP;
    enum IPPROTO_UDPLITE = _Anonymous_59.IPPROTO_UDPLITE;
    enum IPPROTO_MPLS = _Anonymous_59.IPPROTO_MPLS;
    enum IPPROTO_RAW = _Anonymous_59.IPPROTO_RAW;
    enum IPPROTO_MAX = _Anonymous_59.IPPROTO_MAX;
    static core.simd.float4 _mm_rcp14_ps(core.simd.float4) @nogc nothrow;
    static core.simd.double4 _mm256_maskz_rcp14_pd(ubyte, core.simd.double4) @nogc nothrow;
    static core.simd.double4 _mm256_mask_rcp14_pd(core.simd.double4, ubyte, core.simd.double4) @nogc nothrow;
    static core.simd.double4 _mm256_rcp14_pd(core.simd.double4) @nogc nothrow;
    static core.simd.double2 _mm_maskz_rcp14_pd(ubyte, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_mask_rcp14_pd(core.simd.double2, ubyte, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_rcp14_pd(core.simd.double2) @nogc nothrow;
    static core.simd.float8 _mm256_maskz_unpacklo_ps(ubyte, core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.float8 _mm256_mask_unpacklo_ps(core.simd.float8, ubyte, core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.float4 _mm_maskz_unpacklo_ps(ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_mask_unpacklo_ps(core.simd.float4, ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.double4 _mm256_maskz_unpacklo_pd(ubyte, core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.double4 _mm256_mask_unpacklo_pd(core.simd.double4, ubyte, core.simd.double4, core.simd.double4) @nogc nothrow;
    enum _Anonymous_60
    {
        IPPROTO_HOPOPTS = 0,
        IPPROTO_ROUTING = 43,
        IPPROTO_FRAGMENT = 44,
        IPPROTO_ICMPV6 = 58,
        IPPROTO_NONE = 59,
        IPPROTO_DSTOPTS = 60,
        IPPROTO_MH = 135,
    }
    enum IPPROTO_HOPOPTS = _Anonymous_60.IPPROTO_HOPOPTS;
    enum IPPROTO_ROUTING = _Anonymous_60.IPPROTO_ROUTING;
    enum IPPROTO_FRAGMENT = _Anonymous_60.IPPROTO_FRAGMENT;
    enum IPPROTO_ICMPV6 = _Anonymous_60.IPPROTO_ICMPV6;
    enum IPPROTO_NONE = _Anonymous_60.IPPROTO_NONE;
    enum IPPROTO_DSTOPTS = _Anonymous_60.IPPROTO_DSTOPTS;
    enum IPPROTO_MH = _Anonymous_60.IPPROTO_MH;
    static core.simd.double2 _mm_maskz_unpacklo_pd(ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_mask_unpacklo_pd(core.simd.double2, ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.float8 _mm256_maskz_unpackhi_ps(ubyte, core.simd.float8, core.simd.float8) @nogc nothrow;
    alias in_port_t = ushort;
    enum _Anonymous_61
    {
        IPPORT_ECHO = 7,
        IPPORT_DISCARD = 9,
        IPPORT_SYSTAT = 11,
        IPPORT_DAYTIME = 13,
        IPPORT_NETSTAT = 15,
        IPPORT_FTP = 21,
        IPPORT_TELNET = 23,
        IPPORT_SMTP = 25,
        IPPORT_TIMESERVER = 37,
        IPPORT_NAMESERVER = 42,
        IPPORT_WHOIS = 43,
        IPPORT_MTP = 57,
        IPPORT_TFTP = 69,
        IPPORT_RJE = 77,
        IPPORT_FINGER = 79,
        IPPORT_TTYLINK = 87,
        IPPORT_SUPDUP = 95,
        IPPORT_EXECSERVER = 512,
        IPPORT_LOGINSERVER = 513,
        IPPORT_CMDSERVER = 514,
        IPPORT_EFSSERVER = 520,
        IPPORT_BIFFUDP = 512,
        IPPORT_WHOSERVER = 513,
        IPPORT_ROUTESERVER = 520,
        IPPORT_RESERVED = 1024,
        IPPORT_USERRESERVED = 5000,
    }
    enum IPPORT_ECHO = _Anonymous_61.IPPORT_ECHO;
    enum IPPORT_DISCARD = _Anonymous_61.IPPORT_DISCARD;
    enum IPPORT_SYSTAT = _Anonymous_61.IPPORT_SYSTAT;
    enum IPPORT_DAYTIME = _Anonymous_61.IPPORT_DAYTIME;
    enum IPPORT_NETSTAT = _Anonymous_61.IPPORT_NETSTAT;
    enum IPPORT_FTP = _Anonymous_61.IPPORT_FTP;
    enum IPPORT_TELNET = _Anonymous_61.IPPORT_TELNET;
    enum IPPORT_SMTP = _Anonymous_61.IPPORT_SMTP;
    enum IPPORT_TIMESERVER = _Anonymous_61.IPPORT_TIMESERVER;
    enum IPPORT_NAMESERVER = _Anonymous_61.IPPORT_NAMESERVER;
    enum IPPORT_WHOIS = _Anonymous_61.IPPORT_WHOIS;
    enum IPPORT_MTP = _Anonymous_61.IPPORT_MTP;
    enum IPPORT_TFTP = _Anonymous_61.IPPORT_TFTP;
    enum IPPORT_RJE = _Anonymous_61.IPPORT_RJE;
    enum IPPORT_FINGER = _Anonymous_61.IPPORT_FINGER;
    enum IPPORT_TTYLINK = _Anonymous_61.IPPORT_TTYLINK;
    enum IPPORT_SUPDUP = _Anonymous_61.IPPORT_SUPDUP;
    enum IPPORT_EXECSERVER = _Anonymous_61.IPPORT_EXECSERVER;
    enum IPPORT_LOGINSERVER = _Anonymous_61.IPPORT_LOGINSERVER;
    enum IPPORT_CMDSERVER = _Anonymous_61.IPPORT_CMDSERVER;
    enum IPPORT_EFSSERVER = _Anonymous_61.IPPORT_EFSSERVER;
    enum IPPORT_BIFFUDP = _Anonymous_61.IPPORT_BIFFUDP;
    enum IPPORT_WHOSERVER = _Anonymous_61.IPPORT_WHOSERVER;
    enum IPPORT_ROUTESERVER = _Anonymous_61.IPPORT_ROUTESERVER;
    enum IPPORT_RESERVED = _Anonymous_61.IPPORT_RESERVED;
    enum IPPORT_USERRESERVED = _Anonymous_61.IPPORT_USERRESERVED;
    static core.simd.float8 _mm256_mask_unpackhi_ps(core.simd.float8, ubyte, core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.float4 _mm_maskz_unpackhi_ps(ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_mask_unpackhi_ps(core.simd.float4, ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.double4 _mm256_maskz_unpackhi_pd(ubyte, core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.double4 _mm256_mask_unpackhi_pd(core.simd.double4, ubyte, core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.double2 _mm_maskz_unpackhi_pd(ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_mask_unpackhi_pd(core.simd.double2, ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static void _mm256_mask_storeu_ps(void*, ubyte, core.simd.float8) @nogc nothrow;
    static void _mm_mask_storeu_ps(void*, ubyte, core.simd.float4) @nogc nothrow;
    static void _mm256_mask_storeu_pd(void*, ubyte, core.simd.double4) @nogc nothrow;
    static void _mm_mask_storeu_pd(void*, ubyte, core.simd.double2) @nogc nothrow;
    static void _mm256_mask_storeu_epi32(void*, ubyte, core.simd.long4) @nogc nothrow;
    static void _mm256_storeu_epi32(void*, core.simd.long4) @nogc nothrow;
    static void _mm_mask_storeu_epi32(void*, ubyte, core.simd.long2) @nogc nothrow;
    struct in6_addr
    {
        static union _Anonymous_62
        {
            ubyte[16] __u6_addr8;
            ushort[8] __u6_addr16;
            uint[4] __u6_addr32;
        }
        _Anonymous_62 __in6_u;
    }
    static void _mm_storeu_epi32(void*, core.simd.long2) @nogc nothrow;
    extern __gshared const(in6_addr) in6addr_any;
    extern __gshared const(in6_addr) in6addr_loopback;
    static void _mm256_mask_storeu_epi64(void*, ubyte, core.simd.long4) @nogc nothrow;
    static void _mm256_storeu_epi64(void*, core.simd.long4) @nogc nothrow;
    struct sockaddr_in
    {
        ushort sin_family;
        ushort sin_port;
        in_addr sin_addr;
        ubyte[8] sin_zero;
    }
    struct sockaddr_in6
    {
        ushort sin6_family;
        ushort sin6_port;
        uint sin6_flowinfo;
        in6_addr sin6_addr;
        uint sin6_scope_id;
    }
    struct ip_mreq
    {
        in_addr imr_multiaddr;
        in_addr imr_interface;
    }
    struct ip_mreq_source
    {
        in_addr imr_multiaddr;
        in_addr imr_interface;
        in_addr imr_sourceaddr;
    }
    struct ipv6_mreq
    {
        in6_addr ipv6mr_multiaddr;
        uint ipv6mr_interface;
    }
    struct group_req
    {
        uint gr_interface;
        sockaddr_storage gr_group;
    }
    struct group_source_req
    {
        uint gsr_interface;
        sockaddr_storage gsr_group;
        sockaddr_storage gsr_source;
    }
    struct ip_msfilter
    {
        in_addr imsf_multiaddr;
        in_addr imsf_interface;
        uint imsf_fmode;
        uint imsf_numsrc;
        in_addr[1] imsf_slist;
    }
    static void _mm_mask_storeu_epi64(void*, ubyte, core.simd.long2) @nogc nothrow;
    struct group_filter
    {
        uint gf_interface;
        sockaddr_storage gf_group;
        uint gf_fmode;
        uint gf_numsrc;
        sockaddr_storage[1] gf_slist;
    }
    uint ntohl(uint) @nogc nothrow;
    ushort ntohs(ushort) @nogc nothrow;
    uint htonl(uint) @nogc nothrow;
    ushort htons(ushort) @nogc nothrow;
    static void _mm_storeu_epi64(void*, core.simd.long2) @nogc nothrow;
    static void _mm256_mask_store_ps(void*, ubyte, core.simd.float8) @nogc nothrow;
    static void _mm_mask_store_ps(void*, ubyte, core.simd.float4) @nogc nothrow;
    static void _mm256_mask_store_pd(void*, ubyte, core.simd.double4) @nogc nothrow;
    int bindresvport(int, sockaddr_in*) @nogc nothrow;
    int bindresvport6(int, sockaddr_in6*) @nogc nothrow;
    static void _mm_mask_store_pd(void*, ubyte, core.simd.double2) @nogc nothrow;
    static core.simd.float8 _mm256_maskz_loadu_ps(ubyte, const(void)*) @nogc nothrow;
    static core.simd.float8 _mm256_mask_loadu_ps(core.simd.float8, ubyte, const(void)*) @nogc nothrow;
    static core.simd.float4 _mm_maskz_loadu_ps(ubyte, const(void)*) @nogc nothrow;
    static core.simd.float4 _mm_mask_loadu_ps(core.simd.float4, ubyte, const(void)*) @nogc nothrow;
    static core.simd.double4 _mm256_maskz_loadu_pd(ubyte, const(void)*) @nogc nothrow;
    static core.simd.double4 _mm256_mask_loadu_pd(core.simd.double4, ubyte, const(void)*) @nogc nothrow;
    static core.simd.double2 _mm_maskz_loadu_pd(ubyte, const(void)*) @nogc nothrow;
    static core.simd.double2 _mm_mask_loadu_pd(core.simd.double2, ubyte, const(void)*) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_loadu_epi32(ubyte, const(void)*) @nogc nothrow;
    static core.simd.long4 _mm256_mask_loadu_epi32(core.simd.long4, ubyte, const(void)*) @nogc nothrow;
    static core.simd.long4 _mm256_loadu_epi32(const(void)*) @nogc nothrow;
    static core.simd.long2 _mm_maskz_loadu_epi32(ubyte, const(void)*) @nogc nothrow;
    static core.simd.long2 _mm_mask_loadu_epi32(core.simd.long2, ubyte, const(void)*) @nogc nothrow;
    static core.simd.long2 _mm_loadu_epi32(const(void)*) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_loadu_epi64(ubyte, const(void)*) @nogc nothrow;
    static core.simd.long4 _mm256_mask_loadu_epi64(core.simd.long4, ubyte, const(void)*) @nogc nothrow;
    static core.simd.long4 _mm256_loadu_epi64(const(void)*) @nogc nothrow;
    static core.simd.long2 _mm_maskz_loadu_epi64(ubyte, const(void)*) @nogc nothrow;
    static core.simd.long2 _mm_mask_loadu_epi64(core.simd.long2, ubyte, const(void)*) @nogc nothrow;
    static core.simd.long2 _mm_loadu_epi64(const(void)*) @nogc nothrow;
    static core.simd.float8 _mm256_maskz_load_ps(ubyte, const(void)*) @nogc nothrow;
    static core.simd.float8 _mm256_mask_load_ps(core.simd.float8, ubyte, const(void)*) @nogc nothrow;
    alias tcp_seq = uint;
    struct tcphdr
    {
        static union _Anonymous_63
        {
            static struct _Anonymous_64
            {
                import std.bitmanip: bitfields;

                align(4):
                ushort th_sport;
                ushort th_dport;
                uint th_seq;
                uint th_ack;
                mixin(bitfields!(
                    ubyte, "th_x2", 4,
                    ubyte, "th_off", 4,
                ));
                ubyte th_flags;
                ushort th_win;
                ushort th_sum;
                ushort th_urp;
            }
            _Anonymous_64 _anonymous_65;
            auto th_sport() @property @nogc pure nothrow { return _anonymous_65.th_sport; }
            void th_sport(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_65.th_sport = val; }
            auto th_dport() @property @nogc pure nothrow { return _anonymous_65.th_dport; }
            void th_dport(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_65.th_dport = val; }
            auto th_seq() @property @nogc pure nothrow { return _anonymous_65.th_seq; }
            void th_seq(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_65.th_seq = val; }
            auto th_ack() @property @nogc pure nothrow { return _anonymous_65.th_ack; }
            void th_ack(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_65.th_ack = val; }
            auto th_x2() @property @nogc pure nothrow { return _anonymous_65.th_x2; }
            void th_x2(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_65.th_x2 = val; }
            auto th_off() @property @nogc pure nothrow { return _anonymous_65.th_off; }
            void th_off(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_65.th_off = val; }
            auto th_flags() @property @nogc pure nothrow { return _anonymous_65.th_flags; }
            void th_flags(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_65.th_flags = val; }
            auto th_win() @property @nogc pure nothrow { return _anonymous_65.th_win; }
            void th_win(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_65.th_win = val; }
            auto th_sum() @property @nogc pure nothrow { return _anonymous_65.th_sum; }
            void th_sum(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_65.th_sum = val; }
            auto th_urp() @property @nogc pure nothrow { return _anonymous_65.th_urp; }
            void th_urp(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_65.th_urp = val; }
            static struct _Anonymous_66
            {
                import std.bitmanip: bitfields;

                align(4):
                ushort source;
                ushort dest;
                uint seq;
                uint ack_seq;
                mixin(bitfields!(
                    ushort, "res1", 4,
                    ushort, "doff", 4,
                    ushort, "fin", 1,
                    ushort, "syn", 1,
                    ushort, "rst", 1,
                    ushort, "psh", 1,
                    ushort, "ack", 1,
                    ushort, "urg", 1,
                    ushort, "res2", 2,
                ));
                ushort window;
                ushort check;
                ushort urg_ptr;
            }
            _Anonymous_66 _anonymous_67;
            auto source() @property @nogc pure nothrow { return _anonymous_67.source; }
            void source(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_67.source = val; }
            auto dest() @property @nogc pure nothrow { return _anonymous_67.dest; }
            void dest(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_67.dest = val; }
            auto seq() @property @nogc pure nothrow { return _anonymous_67.seq; }
            void seq(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_67.seq = val; }
            auto ack_seq() @property @nogc pure nothrow { return _anonymous_67.ack_seq; }
            void ack_seq(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_67.ack_seq = val; }
            auto res1() @property @nogc pure nothrow { return _anonymous_67.res1; }
            void res1(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_67.res1 = val; }
            auto doff() @property @nogc pure nothrow { return _anonymous_67.doff; }
            void doff(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_67.doff = val; }
            auto fin() @property @nogc pure nothrow { return _anonymous_67.fin; }
            void fin(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_67.fin = val; }
            auto syn() @property @nogc pure nothrow { return _anonymous_67.syn; }
            void syn(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_67.syn = val; }
            auto rst() @property @nogc pure nothrow { return _anonymous_67.rst; }
            void rst(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_67.rst = val; }
            auto psh() @property @nogc pure nothrow { return _anonymous_67.psh; }
            void psh(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_67.psh = val; }
            auto ack() @property @nogc pure nothrow { return _anonymous_67.ack; }
            void ack(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_67.ack = val; }
            auto urg() @property @nogc pure nothrow { return _anonymous_67.urg; }
            void urg(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_67.urg = val; }
            auto res2() @property @nogc pure nothrow { return _anonymous_67.res2; }
            void res2(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_67.res2 = val; }
            auto window() @property @nogc pure nothrow { return _anonymous_67.window; }
            void window(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_67.window = val; }
            auto check() @property @nogc pure nothrow { return _anonymous_67.check; }
            void check(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_67.check = val; }
            auto urg_ptr() @property @nogc pure nothrow { return _anonymous_67.urg_ptr; }
            void urg_ptr(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_67.urg_ptr = val; }
        }
        _Anonymous_63 _anonymous_68;

        auto th_sport() @property @nogc pure nothrow { return _anonymous_68.th_sport; }
        void th_sport(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_68.th_sport = val; }

        auto th_dport() @property @nogc pure nothrow { return _anonymous_68.th_dport; }
        void th_dport(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_68.th_dport = val; }

        auto th_seq() @property @nogc pure nothrow { return _anonymous_68.th_seq; }
        void th_seq(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_68.th_seq = val; }

        auto th_ack() @property @nogc pure nothrow { return _anonymous_68.th_ack; }
        void th_ack(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_68.th_ack = val; }

        auto th_x2() @property @nogc pure nothrow { return _anonymous_68.th_x2; }
        void th_x2(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_68.th_x2 = val; }

        auto th_off() @property @nogc pure nothrow { return _anonymous_68.th_off; }
        void th_off(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_68.th_off = val; }

        auto th_flags() @property @nogc pure nothrow { return _anonymous_68.th_flags; }
        void th_flags(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_68.th_flags = val; }

        auto th_win() @property @nogc pure nothrow { return _anonymous_68.th_win; }
        void th_win(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_68.th_win = val; }

        auto th_sum() @property @nogc pure nothrow { return _anonymous_68.th_sum; }
        void th_sum(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_68.th_sum = val; }

        auto th_urp() @property @nogc pure nothrow { return _anonymous_68.th_urp; }
        void th_urp(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_68.th_urp = val; }

        auto source() @property @nogc pure nothrow { return _anonymous_68.source; }
        void source(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_68.source = val; }

        auto dest() @property @nogc pure nothrow { return _anonymous_68.dest; }
        void dest(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_68.dest = val; }

        auto seq() @property @nogc pure nothrow { return _anonymous_68.seq; }
        void seq(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_68.seq = val; }

        auto ack_seq() @property @nogc pure nothrow { return _anonymous_68.ack_seq; }
        void ack_seq(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_68.ack_seq = val; }

        auto res1() @property @nogc pure nothrow { return _anonymous_68.res1; }
        void res1(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_68.res1 = val; }

        auto doff() @property @nogc pure nothrow { return _anonymous_68.doff; }
        void doff(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_68.doff = val; }

        auto fin() @property @nogc pure nothrow { return _anonymous_68.fin; }
        void fin(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_68.fin = val; }

        auto syn() @property @nogc pure nothrow { return _anonymous_68.syn; }
        void syn(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_68.syn = val; }

        auto rst() @property @nogc pure nothrow { return _anonymous_68.rst; }
        void rst(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_68.rst = val; }

        auto psh() @property @nogc pure nothrow { return _anonymous_68.psh; }
        void psh(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_68.psh = val; }

        auto ack() @property @nogc pure nothrow { return _anonymous_68.ack; }
        void ack(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_68.ack = val; }

        auto urg() @property @nogc pure nothrow { return _anonymous_68.urg; }
        void urg(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_68.urg = val; }

        auto res2() @property @nogc pure nothrow { return _anonymous_68.res2; }
        void res2(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_68.res2 = val; }

        auto window() @property @nogc pure nothrow { return _anonymous_68.window; }
        void window(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_68.window = val; }

        auto check() @property @nogc pure nothrow { return _anonymous_68.check; }
        void check(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_68.check = val; }

        auto urg_ptr() @property @nogc pure nothrow { return _anonymous_68.urg_ptr; }
        void urg_ptr(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_68.urg_ptr = val; }
    }
    static core.simd.float4 _mm_maskz_load_ps(ubyte, const(void)*) @nogc nothrow;
    static core.simd.float4 _mm_mask_load_ps(core.simd.float4, ubyte, const(void)*) @nogc nothrow;
    static core.simd.double4 _mm256_maskz_load_pd(ubyte, const(void)*) @nogc nothrow;
    enum _Anonymous_69
    {
        TCP_ESTABLISHED = 1,
        TCP_SYN_SENT = 2,
        TCP_SYN_RECV = 3,
        TCP_FIN_WAIT1 = 4,
        TCP_FIN_WAIT2 = 5,
        TCP_TIME_WAIT = 6,
        TCP_CLOSE = 7,
        TCP_CLOSE_WAIT = 8,
        TCP_LAST_ACK = 9,
        TCP_LISTEN = 10,
        TCP_CLOSING = 11,
    }
    enum TCP_ESTABLISHED = _Anonymous_69.TCP_ESTABLISHED;
    enum TCP_SYN_SENT = _Anonymous_69.TCP_SYN_SENT;
    enum TCP_SYN_RECV = _Anonymous_69.TCP_SYN_RECV;
    enum TCP_FIN_WAIT1 = _Anonymous_69.TCP_FIN_WAIT1;
    enum TCP_FIN_WAIT2 = _Anonymous_69.TCP_FIN_WAIT2;
    enum TCP_TIME_WAIT = _Anonymous_69.TCP_TIME_WAIT;
    enum TCP_CLOSE = _Anonymous_69.TCP_CLOSE;
    enum TCP_CLOSE_WAIT = _Anonymous_69.TCP_CLOSE_WAIT;
    enum TCP_LAST_ACK = _Anonymous_69.TCP_LAST_ACK;
    enum TCP_LISTEN = _Anonymous_69.TCP_LISTEN;
    enum TCP_CLOSING = _Anonymous_69.TCP_CLOSING;
    static core.simd.double4 _mm256_mask_load_pd(core.simd.double4, ubyte, const(void)*) @nogc nothrow;
    static core.simd.double2 _mm_maskz_load_pd(ubyte, const(void)*) @nogc nothrow;
    static core.simd.double2 _mm_mask_load_pd(core.simd.double2, ubyte, const(void)*) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_set1_epi64(ubyte, long) @nogc nothrow;
    static core.simd.long4 _mm256_mask_set1_epi64(core.simd.long4, ubyte, long) @nogc nothrow;
    static core.simd.long2 _mm_maskz_set1_epi64(ubyte, long) @nogc nothrow;
    static core.simd.long2 _mm_mask_set1_epi64(core.simd.long2, ubyte, long) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_set1_epi32(ubyte, int) @nogc nothrow;
    static core.simd.long4 _mm256_mask_set1_epi32(core.simd.long4, ubyte, int) @nogc nothrow;
    static core.simd.long2 _mm_maskz_set1_epi32(ubyte, int) @nogc nothrow;
    static core.simd.long2 _mm_mask_set1_epi32(core.simd.long2, ubyte, int) @nogc nothrow;
    static core.simd.double4 _mm256_maskz_movedup_pd(ubyte, core.simd.double4) @nogc nothrow;
    enum tcp_ca_state
    {
        TCP_CA_Open = 0,
        TCP_CA_Disorder = 1,
        TCP_CA_CWR = 2,
        TCP_CA_Recovery = 3,
        TCP_CA_Loss = 4,
    }
    enum TCP_CA_Open = tcp_ca_state.TCP_CA_Open;
    enum TCP_CA_Disorder = tcp_ca_state.TCP_CA_Disorder;
    enum TCP_CA_CWR = tcp_ca_state.TCP_CA_CWR;
    enum TCP_CA_Recovery = tcp_ca_state.TCP_CA_Recovery;
    enum TCP_CA_Loss = tcp_ca_state.TCP_CA_Loss;
    struct tcp_info
    {
        import std.bitmanip: bitfields;

        align(4):
        ubyte tcpi_state;
        ubyte tcpi_ca_state;
        ubyte tcpi_retransmits;
        ubyte tcpi_probes;
        ubyte tcpi_backoff;
        ubyte tcpi_options;
        mixin(bitfields!(
            ubyte, "tcpi_snd_wscale", 4,
            ubyte, "tcpi_rcv_wscale", 4,
        ));
        uint tcpi_rto;
        uint tcpi_ato;
        uint tcpi_snd_mss;
        uint tcpi_rcv_mss;
        uint tcpi_unacked;
        uint tcpi_sacked;
        uint tcpi_lost;
        uint tcpi_retrans;
        uint tcpi_fackets;
        uint tcpi_last_data_sent;
        uint tcpi_last_ack_sent;
        uint tcpi_last_data_recv;
        uint tcpi_last_ack_recv;
        uint tcpi_pmtu;
        uint tcpi_rcv_ssthresh;
        uint tcpi_rtt;
        uint tcpi_rttvar;
        uint tcpi_snd_ssthresh;
        uint tcpi_snd_cwnd;
        uint tcpi_advmss;
        uint tcpi_reordering;
        uint tcpi_rcv_rtt;
        uint tcpi_rcv_space;
        uint tcpi_total_retrans;
    }
    static core.simd.double4 _mm256_mask_movedup_pd(core.simd.double4, ubyte, core.simd.double4) @nogc nothrow;
    struct tcp_md5sig
    {
        sockaddr_storage tcpm_addr;
        ubyte tcpm_flags;
        ubyte tcpm_prefixlen;
        ushort tcpm_keylen;
        uint __tcpm_pad;
        ubyte[80] tcpm_key;
    }
    struct tcp_repair_opt
    {
        uint opt_code;
        uint opt_val;
    }
    enum _Anonymous_70
    {
        TCP_NO_QUEUE = 0,
        TCP_RECV_QUEUE = 1,
        TCP_SEND_QUEUE = 2,
        TCP_QUEUES_NR = 3,
    }
    enum TCP_NO_QUEUE = _Anonymous_70.TCP_NO_QUEUE;
    enum TCP_RECV_QUEUE = _Anonymous_70.TCP_RECV_QUEUE;
    enum TCP_SEND_QUEUE = _Anonymous_70.TCP_SEND_QUEUE;
    enum TCP_QUEUES_NR = _Anonymous_70.TCP_QUEUES_NR;
    static core.simd.double2 _mm_maskz_movedup_pd(ubyte, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_mask_movedup_pd(core.simd.double2, ubyte, core.simd.double2) @nogc nothrow;
    static void _mm256_mask_store_epi64(void*, ubyte, core.simd.long4) @nogc nothrow;
    static void _mm256_store_epi64(void*, core.simd.long4) @nogc nothrow;
    struct tcp_cookie_transactions
    {
        ushort tcpct_flags;
        ubyte __tcpct_pad1;
        ubyte tcpct_cookie_desired;
        ushort tcpct_s_data_desired;
        ushort tcpct_used;
        ubyte[536] tcpct_value;
    }
    struct tcp_repair_window
    {
        uint snd_wl1;
        uint snd_wnd;
        uint max_window;
        uint rcv_wnd;
        uint rcv_wup;
    }
    struct tcp_zerocopy_receive
    {
        c_ulong address;
        uint length;
        uint recv_skip_hint;
    }
    static void _mm_mask_store_epi64(void*, ubyte, core.simd.long2) @nogc nothrow;
    enum _Anonymous_71
    {
        PTHREAD_CREATE_JOINABLE = 0,
        PTHREAD_CREATE_DETACHED = 1,
    }
    enum PTHREAD_CREATE_JOINABLE = _Anonymous_71.PTHREAD_CREATE_JOINABLE;
    enum PTHREAD_CREATE_DETACHED = _Anonymous_71.PTHREAD_CREATE_DETACHED;
    static void _mm_store_epi64(void*, core.simd.long2) @nogc nothrow;
    enum _Anonymous_72
    {
        PTHREAD_MUTEX_TIMED_NP = 0,
        PTHREAD_MUTEX_RECURSIVE_NP = 1,
        PTHREAD_MUTEX_ERRORCHECK_NP = 2,
        PTHREAD_MUTEX_ADAPTIVE_NP = 3,
        PTHREAD_MUTEX_NORMAL = 0,
        PTHREAD_MUTEX_RECURSIVE = 1,
        PTHREAD_MUTEX_ERRORCHECK = 2,
        PTHREAD_MUTEX_DEFAULT = 0,
    }
    enum PTHREAD_MUTEX_TIMED_NP = _Anonymous_72.PTHREAD_MUTEX_TIMED_NP;
    enum PTHREAD_MUTEX_RECURSIVE_NP = _Anonymous_72.PTHREAD_MUTEX_RECURSIVE_NP;
    enum PTHREAD_MUTEX_ERRORCHECK_NP = _Anonymous_72.PTHREAD_MUTEX_ERRORCHECK_NP;
    enum PTHREAD_MUTEX_ADAPTIVE_NP = _Anonymous_72.PTHREAD_MUTEX_ADAPTIVE_NP;
    enum PTHREAD_MUTEX_NORMAL = _Anonymous_72.PTHREAD_MUTEX_NORMAL;
    enum PTHREAD_MUTEX_RECURSIVE = _Anonymous_72.PTHREAD_MUTEX_RECURSIVE;
    enum PTHREAD_MUTEX_ERRORCHECK = _Anonymous_72.PTHREAD_MUTEX_ERRORCHECK;
    enum PTHREAD_MUTEX_DEFAULT = _Anonymous_72.PTHREAD_MUTEX_DEFAULT;
    enum _Anonymous_73
    {
        PTHREAD_MUTEX_STALLED = 0,
        PTHREAD_MUTEX_STALLED_NP = 0,
        PTHREAD_MUTEX_ROBUST = 1,
        PTHREAD_MUTEX_ROBUST_NP = 1,
    }
    enum PTHREAD_MUTEX_STALLED = _Anonymous_73.PTHREAD_MUTEX_STALLED;
    enum PTHREAD_MUTEX_STALLED_NP = _Anonymous_73.PTHREAD_MUTEX_STALLED_NP;
    enum PTHREAD_MUTEX_ROBUST = _Anonymous_73.PTHREAD_MUTEX_ROBUST;
    enum PTHREAD_MUTEX_ROBUST_NP = _Anonymous_73.PTHREAD_MUTEX_ROBUST_NP;
    enum _Anonymous_74
    {
        PTHREAD_PRIO_NONE = 0,
        PTHREAD_PRIO_INHERIT = 1,
        PTHREAD_PRIO_PROTECT = 2,
    }
    enum PTHREAD_PRIO_NONE = _Anonymous_74.PTHREAD_PRIO_NONE;
    enum PTHREAD_PRIO_INHERIT = _Anonymous_74.PTHREAD_PRIO_INHERIT;
    enum PTHREAD_PRIO_PROTECT = _Anonymous_74.PTHREAD_PRIO_PROTECT;
    enum _Anonymous_75
    {
        PTHREAD_RWLOCK_PREFER_READER_NP = 0,
        PTHREAD_RWLOCK_PREFER_WRITER_NP = 1,
        PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP = 2,
        PTHREAD_RWLOCK_DEFAULT_NP = 0,
    }
    enum PTHREAD_RWLOCK_PREFER_READER_NP = _Anonymous_75.PTHREAD_RWLOCK_PREFER_READER_NP;
    enum PTHREAD_RWLOCK_PREFER_WRITER_NP = _Anonymous_75.PTHREAD_RWLOCK_PREFER_WRITER_NP;
    enum PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP = _Anonymous_75.PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP;
    enum PTHREAD_RWLOCK_DEFAULT_NP = _Anonymous_75.PTHREAD_RWLOCK_DEFAULT_NP;
    static core.simd.long4 _mm256_maskz_load_epi64(ubyte, const(void)*) @nogc nothrow;
    enum _Anonymous_76
    {
        PTHREAD_INHERIT_SCHED = 0,
        PTHREAD_EXPLICIT_SCHED = 1,
    }
    enum PTHREAD_INHERIT_SCHED = _Anonymous_76.PTHREAD_INHERIT_SCHED;
    enum PTHREAD_EXPLICIT_SCHED = _Anonymous_76.PTHREAD_EXPLICIT_SCHED;
    static core.simd.long4 _mm256_mask_load_epi64(core.simd.long4, ubyte, const(void)*) @nogc nothrow;
    enum _Anonymous_77
    {
        PTHREAD_SCOPE_SYSTEM = 0,
        PTHREAD_SCOPE_PROCESS = 1,
    }
    enum PTHREAD_SCOPE_SYSTEM = _Anonymous_77.PTHREAD_SCOPE_SYSTEM;
    enum PTHREAD_SCOPE_PROCESS = _Anonymous_77.PTHREAD_SCOPE_PROCESS;
    static core.simd.long4 _mm256_load_epi64(const(void)*) @nogc nothrow;
    enum _Anonymous_78
    {
        PTHREAD_PROCESS_PRIVATE = 0,
        PTHREAD_PROCESS_SHARED = 1,
    }
    enum PTHREAD_PROCESS_PRIVATE = _Anonymous_78.PTHREAD_PROCESS_PRIVATE;
    enum PTHREAD_PROCESS_SHARED = _Anonymous_78.PTHREAD_PROCESS_SHARED;
    static core.simd.long2 _mm_maskz_load_epi64(ubyte, const(void)*) @nogc nothrow;
    struct _pthread_cleanup_buffer
    {
        void function(void*) __routine;
        void* __arg;
        int __canceltype;
        _pthread_cleanup_buffer* __prev;
    }
    enum _Anonymous_79
    {
        PTHREAD_CANCEL_ENABLE = 0,
        PTHREAD_CANCEL_DISABLE = 1,
    }
    enum PTHREAD_CANCEL_ENABLE = _Anonymous_79.PTHREAD_CANCEL_ENABLE;
    enum PTHREAD_CANCEL_DISABLE = _Anonymous_79.PTHREAD_CANCEL_DISABLE;
    static core.simd.long2 _mm_mask_load_epi64(core.simd.long2, ubyte, const(void)*) @nogc nothrow;
    enum _Anonymous_80
    {
        PTHREAD_CANCEL_DEFERRED = 0,
        PTHREAD_CANCEL_ASYNCHRONOUS = 1,
    }
    enum PTHREAD_CANCEL_DEFERRED = _Anonymous_80.PTHREAD_CANCEL_DEFERRED;
    enum PTHREAD_CANCEL_ASYNCHRONOUS = _Anonymous_80.PTHREAD_CANCEL_ASYNCHRONOUS;
    static core.simd.long2 _mm_load_epi64(const(void)*) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_mov_epi64(ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_mov_epi64(core.simd.long4, ubyte, core.simd.long4) @nogc nothrow;
    int pthread_create(c_ulong*, const(pthread_attr_t)*, void* function(void*), void*) @nogc nothrow;
    void pthread_exit(void*) @nogc nothrow;
    int pthread_join(c_ulong, void**) @nogc nothrow;
    int pthread_detach(c_ulong) @nogc nothrow;
    c_ulong pthread_self() @nogc nothrow;
    int pthread_equal(c_ulong, c_ulong) @nogc nothrow;
    int pthread_attr_init(pthread_attr_t*) @nogc nothrow;
    int pthread_attr_destroy(pthread_attr_t*) @nogc nothrow;
    int pthread_attr_getdetachstate(const(pthread_attr_t)*, int*) @nogc nothrow;
    int pthread_attr_setdetachstate(pthread_attr_t*, int) @nogc nothrow;
    int pthread_attr_getguardsize(const(pthread_attr_t)*, c_ulong*) @nogc nothrow;
    int pthread_attr_setguardsize(pthread_attr_t*, c_ulong) @nogc nothrow;
    int pthread_attr_getschedparam(const(pthread_attr_t)*, sched_param*) @nogc nothrow;
    int pthread_attr_setschedparam(pthread_attr_t*, const(sched_param)*) @nogc nothrow;
    int pthread_attr_getschedpolicy(const(pthread_attr_t)*, int*) @nogc nothrow;
    int pthread_attr_setschedpolicy(pthread_attr_t*, int) @nogc nothrow;
    int pthread_attr_getinheritsched(const(pthread_attr_t)*, int*) @nogc nothrow;
    int pthread_attr_setinheritsched(pthread_attr_t*, int) @nogc nothrow;
    int pthread_attr_getscope(const(pthread_attr_t)*, int*) @nogc nothrow;
    int pthread_attr_setscope(pthread_attr_t*, int) @nogc nothrow;
    int pthread_attr_getstackaddr(const(pthread_attr_t)*, void**) @nogc nothrow;
    int pthread_attr_setstackaddr(pthread_attr_t*, void*) @nogc nothrow;
    int pthread_attr_getstacksize(const(pthread_attr_t)*, c_ulong*) @nogc nothrow;
    int pthread_attr_setstacksize(pthread_attr_t*, c_ulong) @nogc nothrow;
    int pthread_attr_getstack(const(pthread_attr_t)*, void**, c_ulong*) @nogc nothrow;
    int pthread_attr_setstack(pthread_attr_t*, void*, c_ulong) @nogc nothrow;
    int pthread_setschedparam(c_ulong, int, const(sched_param)*) @nogc nothrow;
    int pthread_getschedparam(c_ulong, int*, sched_param*) @nogc nothrow;
    int pthread_setschedprio(c_ulong, int) @nogc nothrow;
    int pthread_once(int*, void function()) @nogc nothrow;
    int pthread_setcancelstate(int, int*) @nogc nothrow;
    int pthread_setcanceltype(int, int*) @nogc nothrow;
    int pthread_cancel(c_ulong) @nogc nothrow;
    void pthread_testcancel() @nogc nothrow;
    struct __pthread_unwind_buf_t
    {
        static struct _Anonymous_81
        {
            c_long[8] __cancel_jmp_buf;
            int __mask_was_saved;
        }
        _Anonymous_81[1] __cancel_jmp_buf;
        void*[4] __pad;
    }
    struct __pthread_cleanup_frame
    {
        void function(void*) __cancel_routine;
        void* __cancel_arg;
        int __do_it;
        int __cancel_type;
    }
    static core.simd.long2 _mm_maskz_mov_epi64(ubyte, core.simd.long2) @nogc nothrow;
    void __pthread_register_cancel(__pthread_unwind_buf_t*) @nogc nothrow;
    void __pthread_unregister_cancel(__pthread_unwind_buf_t*) @nogc nothrow;
    void __pthread_unwind_next(__pthread_unwind_buf_t*) @nogc nothrow;
    struct __jmp_buf_tag
    {
        c_long[8] __jmpbuf;
        int __mask_was_saved;
        __sigset_t __saved_mask;
    }
    int __sigsetjmp(__jmp_buf_tag*, int) @nogc nothrow;
    int pthread_mutex_init(pthread_mutex_t*, const(pthread_mutexattr_t)*) @nogc nothrow;
    int pthread_mutex_destroy(pthread_mutex_t*) @nogc nothrow;
    int pthread_mutex_trylock(pthread_mutex_t*) @nogc nothrow;
    int pthread_mutex_lock(pthread_mutex_t*) @nogc nothrow;
    int pthread_mutex_timedlock(pthread_mutex_t*, const(timespec)*) @nogc nothrow;
    int pthread_mutex_unlock(pthread_mutex_t*) @nogc nothrow;
    int pthread_mutex_getprioceiling(const(pthread_mutex_t)*, int*) @nogc nothrow;
    int pthread_mutex_setprioceiling(pthread_mutex_t*, int, int*) @nogc nothrow;
    int pthread_mutex_consistent(pthread_mutex_t*) @nogc nothrow;
    int pthread_mutexattr_init(pthread_mutexattr_t*) @nogc nothrow;
    int pthread_mutexattr_destroy(pthread_mutexattr_t*) @nogc nothrow;
    int pthread_mutexattr_getpshared(const(pthread_mutexattr_t)*, int*) @nogc nothrow;
    int pthread_mutexattr_setpshared(pthread_mutexattr_t*, int) @nogc nothrow;
    int pthread_mutexattr_gettype(const(pthread_mutexattr_t)*, int*) @nogc nothrow;
    int pthread_mutexattr_settype(pthread_mutexattr_t*, int) @nogc nothrow;
    int pthread_mutexattr_getprotocol(const(pthread_mutexattr_t)*, int*) @nogc nothrow;
    int pthread_mutexattr_setprotocol(pthread_mutexattr_t*, int) @nogc nothrow;
    int pthread_mutexattr_getprioceiling(const(pthread_mutexattr_t)*, int*) @nogc nothrow;
    int pthread_mutexattr_setprioceiling(pthread_mutexattr_t*, int) @nogc nothrow;
    int pthread_mutexattr_getrobust(const(pthread_mutexattr_t)*, int*) @nogc nothrow;
    int pthread_mutexattr_setrobust(pthread_mutexattr_t*, int) @nogc nothrow;
    int pthread_rwlock_init(pthread_rwlock_t*, const(pthread_rwlockattr_t)*) @nogc nothrow;
    int pthread_rwlock_destroy(pthread_rwlock_t*) @nogc nothrow;
    int pthread_rwlock_rdlock(pthread_rwlock_t*) @nogc nothrow;
    int pthread_rwlock_tryrdlock(pthread_rwlock_t*) @nogc nothrow;
    int pthread_rwlock_timedrdlock(pthread_rwlock_t*, const(timespec)*) @nogc nothrow;
    int pthread_rwlock_wrlock(pthread_rwlock_t*) @nogc nothrow;
    int pthread_rwlock_trywrlock(pthread_rwlock_t*) @nogc nothrow;
    int pthread_rwlock_timedwrlock(pthread_rwlock_t*, const(timespec)*) @nogc nothrow;
    int pthread_rwlock_unlock(pthread_rwlock_t*) @nogc nothrow;
    int pthread_rwlockattr_init(pthread_rwlockattr_t*) @nogc nothrow;
    int pthread_rwlockattr_destroy(pthread_rwlockattr_t*) @nogc nothrow;
    int pthread_rwlockattr_getpshared(const(pthread_rwlockattr_t)*, int*) @nogc nothrow;
    int pthread_rwlockattr_setpshared(pthread_rwlockattr_t*, int) @nogc nothrow;
    int pthread_rwlockattr_getkind_np(const(pthread_rwlockattr_t)*, int*) @nogc nothrow;
    int pthread_rwlockattr_setkind_np(pthread_rwlockattr_t*, int) @nogc nothrow;
    int pthread_cond_init(pthread_cond_t*, const(pthread_condattr_t)*) @nogc nothrow;
    int pthread_cond_destroy(pthread_cond_t*) @nogc nothrow;
    int pthread_cond_signal(pthread_cond_t*) @nogc nothrow;
    int pthread_cond_broadcast(pthread_cond_t*) @nogc nothrow;
    int pthread_cond_wait(pthread_cond_t*, pthread_mutex_t*) @nogc nothrow;
    int pthread_cond_timedwait(pthread_cond_t*, pthread_mutex_t*, const(timespec)*) @nogc nothrow;
    int pthread_condattr_init(pthread_condattr_t*) @nogc nothrow;
    int pthread_condattr_destroy(pthread_condattr_t*) @nogc nothrow;
    int pthread_condattr_getpshared(const(pthread_condattr_t)*, int*) @nogc nothrow;
    int pthread_condattr_setpshared(pthread_condattr_t*, int) @nogc nothrow;
    int pthread_condattr_getclock(const(pthread_condattr_t)*, int*) @nogc nothrow;
    int pthread_condattr_setclock(pthread_condattr_t*, int) @nogc nothrow;
    int pthread_spin_init(int*, int) @nogc nothrow;
    int pthread_spin_destroy(int*) @nogc nothrow;
    int pthread_spin_lock(int*) @nogc nothrow;
    int pthread_spin_trylock(int*) @nogc nothrow;
    int pthread_spin_unlock(int*) @nogc nothrow;
    int pthread_barrier_init(pthread_barrier_t*, const(pthread_barrierattr_t)*, uint) @nogc nothrow;
    int pthread_barrier_destroy(pthread_barrier_t*) @nogc nothrow;
    int pthread_barrier_wait(pthread_barrier_t*) @nogc nothrow;
    int pthread_barrierattr_init(pthread_barrierattr_t*) @nogc nothrow;
    int pthread_barrierattr_destroy(pthread_barrierattr_t*) @nogc nothrow;
    int pthread_barrierattr_getpshared(const(pthread_barrierattr_t)*, int*) @nogc nothrow;
    int pthread_barrierattr_setpshared(pthread_barrierattr_t*, int) @nogc nothrow;
    int pthread_key_create(uint*, void function(void*)) @nogc nothrow;
    int pthread_key_delete(uint) @nogc nothrow;
    void* pthread_getspecific(uint) @nogc nothrow;
    int pthread_setspecific(uint, const(void)*) @nogc nothrow;
    int pthread_getcpuclockid(c_ulong, int*) @nogc nothrow;
    int pthread_atfork(void function(), void function(), void function()) @nogc nothrow;
    static core.simd.long2 _mm_mask_mov_epi64(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    struct passwd
    {
        char* pw_name;
        char* pw_passwd;
        uint pw_uid;
        uint pw_gid;
        char* pw_gecos;
        char* pw_dir;
        char* pw_shell;
    }
    void setpwent() @nogc nothrow;
    void endpwent() @nogc nothrow;
    passwd* getpwent() @nogc nothrow;
    passwd* fgetpwent(_IO_FILE*) @nogc nothrow;
    int putpwent(const(passwd)*, _IO_FILE*) @nogc nothrow;
    passwd* getpwuid(uint) @nogc nothrow;
    passwd* getpwnam(const(char)*) @nogc nothrow;
    static void _mm256_mask_store_epi32(void*, ubyte, core.simd.long4) @nogc nothrow;
    int getpwent_r(passwd*, char*, c_ulong, passwd**) @nogc nothrow;
    int getpwuid_r(uint, passwd*, char*, c_ulong, passwd**) @nogc nothrow;
    int getpwnam_r(const(char)*, passwd*, char*, c_ulong, passwd**) @nogc nothrow;
    int fgetpwent_r(_IO_FILE*, passwd*, char*, c_ulong, passwd**) @nogc nothrow;
    static void _mm256_store_epi32(void*, core.simd.long4) @nogc nothrow;
    struct rpcent
    {
        char* r_name;
        char** r_aliases;
        int r_number;
    }
    void setrpcent(int) @nogc nothrow;
    void endrpcent() @nogc nothrow;
    rpcent* getrpcbyname(const(char)*) @nogc nothrow;
    rpcent* getrpcbynumber(int) @nogc nothrow;
    rpcent* getrpcent() @nogc nothrow;
    int getrpcbyname_r(const(char)*, rpcent*, char*, c_ulong, rpcent**) @nogc nothrow;
    int getrpcbynumber_r(int, rpcent*, char*, c_ulong, rpcent**) @nogc nothrow;
    int getrpcent_r(rpcent*, char*, c_ulong, rpcent**) @nogc nothrow;
    static void _mm_mask_store_epi32(void*, ubyte, core.simd.long2) @nogc nothrow;
    static void _mm_store_epi32(void*, core.simd.long2) @nogc nothrow;
    int sched_setparam(int, const(sched_param)*) @nogc nothrow;
    int sched_getparam(int, sched_param*) @nogc nothrow;
    int sched_setscheduler(int, int, const(sched_param)*) @nogc nothrow;
    int sched_getscheduler(int) @nogc nothrow;
    int sched_yield() @nogc nothrow;
    int sched_get_priority_max(int) @nogc nothrow;
    int sched_get_priority_min(int) @nogc nothrow;
    int sched_rr_get_interval(int, timespec*) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_load_epi32(ubyte, const(void)*) @nogc nothrow;
    int sem_init(sem_t*, int, uint) @nogc nothrow;
    int sem_destroy(sem_t*) @nogc nothrow;
    sem_t* sem_open(const(char)*, int, ...) @nogc nothrow;
    int sem_close(sem_t*) @nogc nothrow;
    int sem_unlink(const(char)*) @nogc nothrow;
    int sem_wait(sem_t*) @nogc nothrow;
    int sem_timedwait(sem_t*, const(timespec)*) @nogc nothrow;
    int sem_trywait(sem_t*) @nogc nothrow;
    int sem_post(sem_t*) @nogc nothrow;
    int sem_getvalue(sem_t*, int*) @nogc nothrow;
    alias jmp_buf = __jmp_buf_tag[1];
    int setjmp(__jmp_buf_tag*) @nogc nothrow;
    int _setjmp(__jmp_buf_tag*) @nogc nothrow;
    static core.simd.long4 _mm256_mask_load_epi32(core.simd.long4, ubyte, const(void)*) @nogc nothrow;
    void longjmp(__jmp_buf_tag*, int) @nogc nothrow;
    void _longjmp(__jmp_buf_tag*, int) @nogc nothrow;
    alias sigjmp_buf = __jmp_buf_tag[1];
    void siglongjmp(__jmp_buf_tag*, int) @nogc nothrow;
    static core.simd.long4 _mm256_load_epi32(const(void)*) @nogc nothrow;
    alias __sighandler_t = void function(int);
    void function(int) __sysv_signal(int, void function(int)) @nogc nothrow;
    void function(int) signal(int, void function(int)) @nogc nothrow;
    int kill(int, int) @nogc nothrow;
    int killpg(int, int) @nogc nothrow;
    int raise(int) @nogc nothrow;
    void function(int) ssignal(int, void function(int)) @nogc nothrow;
    int gsignal(int) @nogc nothrow;
    void psignal(int, const(char)*) @nogc nothrow;
    void psiginfo(const(siginfo_t)*, const(char)*) @nogc nothrow;
    int sigblock(int) @nogc nothrow;
    int sigsetmask(int) @nogc nothrow;
    int siggetmask() @nogc nothrow;
    static core.simd.long2 _mm_maskz_load_epi32(ubyte, const(void)*) @nogc nothrow;
    alias sig_t = void function(int);
    int sigemptyset(__sigset_t*) @nogc nothrow;
    int sigfillset(__sigset_t*) @nogc nothrow;
    int sigaddset(__sigset_t*, int) @nogc nothrow;
    int sigdelset(__sigset_t*, int) @nogc nothrow;
    int sigismember(const(__sigset_t)*, int) @nogc nothrow;
    int sigprocmask(int, const(__sigset_t)*, __sigset_t*) @nogc nothrow;
    int sigsuspend(const(__sigset_t)*) @nogc nothrow;
    pragma(mangle, "sigaction") int sigaction_(int, const(sigaction)*, sigaction*) @nogc nothrow;
    int sigpending(__sigset_t*) @nogc nothrow;
    int sigwait(const(__sigset_t)*, int*) @nogc nothrow;
    int sigwaitinfo(const(__sigset_t)*, siginfo_t*) @nogc nothrow;
    int sigtimedwait(const(__sigset_t)*, siginfo_t*, const(timespec)*) @nogc nothrow;
    int sigqueue(int, int, const(sigval)) @nogc nothrow;
    extern __gshared const(const(char)*)[65] _sys_siglist;
    extern __gshared const(const(char)*)[65] sys_siglist;
    int sigreturn(sigcontext*) @nogc nothrow;
    int siginterrupt(int, int) @nogc nothrow;
    int sigaltstack(const(stack_t)*, stack_t*) @nogc nothrow;
    pragma(mangle, "sigstack") int sigstack_(sigstack*, sigstack*) @nogc nothrow;
    int __libc_current_sigrtmin() @nogc nothrow;
    int __libc_current_sigrtmax() @nogc nothrow;
    static core.simd.long2 _mm_mask_load_epi32(core.simd.long2, ubyte, const(void)*) @nogc nothrow;
    static core.simd.long2 _mm_load_epi32(const(void)*) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_mov_epi32(ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_mov_epi32(core.simd.long4, ubyte, core.simd.long4) @nogc nothrow;
    alias int_least8_t = byte;
    alias int_least16_t = short;
    alias int_least32_t = int;
    alias int_least64_t = c_long;
    alias uint_least8_t = ubyte;
    alias uint_least16_t = ushort;
    alias uint_least32_t = uint;
    alias uint_least64_t = c_ulong;
    alias int_fast8_t = byte;
    alias int_fast16_t = c_long;
    alias int_fast32_t = c_long;
    alias int_fast64_t = c_long;
    alias uint_fast8_t = ubyte;
    alias uint_fast16_t = c_ulong;
    alias uint_fast32_t = c_ulong;
    alias uint_fast64_t = c_ulong;
    alias intptr_t = c_long;
    static core.simd.long2 _mm_maskz_mov_epi32(ubyte, core.simd.long2) @nogc nothrow;
    alias uintptr_t = c_ulong;
    alias intmax_t = c_long;
    alias uintmax_t = c_ulong;
    static core.simd.long2 _mm_mask_mov_epi32(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_srav_epi64(ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_srav_epi64(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_srav_epi64(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_srav_epi64(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_srav_epi64(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_srav_epi64(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_srav_epi32(ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_srav_epi32(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_srav_epi32(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_srav_epi32(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_srli_epi64(ubyte, core.simd.long4, int) @nogc nothrow;
    static core.simd.long4 _mm256_mask_srli_epi64(core.simd.long4, ubyte, core.simd.long4, int) @nogc nothrow;
    static core.simd.long2 _mm_maskz_srli_epi64(ubyte, core.simd.long2, int) @nogc nothrow;
    static core.simd.long2 _mm_mask_srli_epi64(core.simd.long2, ubyte, core.simd.long2, int) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_srl_epi64(ubyte, core.simd.long4, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_srl_epi64(core.simd.long4, ubyte, core.simd.long4, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_srl_epi64(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_srl_epi64(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_srli_epi32(ubyte, core.simd.long4, int) @nogc nothrow;
    static core.simd.long4 _mm256_mask_srli_epi32(core.simd.long4, ubyte, core.simd.long4, int) @nogc nothrow;
    static core.simd.long2 _mm_maskz_srli_epi32(ubyte, core.simd.long2, int) @nogc nothrow;
    static core.simd.long2 _mm_mask_srli_epi32(core.simd.long2, ubyte, core.simd.long2, int) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_srl_epi32(ubyte, core.simd.long4, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_srl_epi32(core.simd.long4, ubyte, core.simd.long4, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_srl_epi32(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_srl_epi32(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_srlv_epi32(ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_srlv_epi32(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_srlv_epi32(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_srlv_epi32(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_srlv_epi64(ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_srlv_epi64(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_srlv_epi64(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_srlv_epi64(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_sllv_epi32(ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_sllv_epi32(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    struct div_t
    {
        int quot;
        int rem;
    }
    struct ldiv_t
    {
        c_long quot;
        c_long rem;
    }
    static core.simd.long2 _mm_maskz_sllv_epi32(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    struct lldiv_t
    {
        long quot;
        long rem;
    }
    static core.simd.long2 _mm_mask_sllv_epi32(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_sllv_epi64(ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    c_ulong __ctype_get_mb_cur_max() @nogc nothrow;
    double atof(const(char)*) @nogc nothrow;
    int atoi(const(char)*) @nogc nothrow;
    c_long atol(const(char)*) @nogc nothrow;
    long atoll(const(char)*) @nogc nothrow;
    double strtod(const(char)*, char**) @nogc nothrow;
    float strtof(const(char)*, char**) @nogc nothrow;
    real strtold(const(char)*, char**) @nogc nothrow;
    c_long strtol(const(char)*, char**, int) @nogc nothrow;
    c_ulong strtoul(const(char)*, char**, int) @nogc nothrow;
    long strtoq(const(char)*, char**, int) @nogc nothrow;
    ulong strtouq(const(char)*, char**, int) @nogc nothrow;
    long strtoll(const(char)*, char**, int) @nogc nothrow;
    ulong strtoull(const(char)*, char**, int) @nogc nothrow;
    char* l64a(c_long) @nogc nothrow;
    c_long a64l(const(char)*) @nogc nothrow;
    c_long random() @nogc nothrow;
    void srandom(uint) @nogc nothrow;
    char* initstate(uint, char*, c_ulong) @nogc nothrow;
    char* setstate(char*) @nogc nothrow;
    struct random_data
    {
        int* fptr;
        int* rptr;
        int* state;
        int rand_type;
        int rand_deg;
        int rand_sep;
        int* end_ptr;
    }
    int random_r(random_data*, int*) @nogc nothrow;
    int srandom_r(uint, random_data*) @nogc nothrow;
    int initstate_r(uint, char*, c_ulong, random_data*) @nogc nothrow;
    int setstate_r(char*, random_data*) @nogc nothrow;
    int rand() @nogc nothrow;
    void srand(uint) @nogc nothrow;
    int rand_r(uint*) @nogc nothrow;
    double drand48() @nogc nothrow;
    double erand48(ushort*) @nogc nothrow;
    c_long lrand48() @nogc nothrow;
    c_long nrand48(ushort*) @nogc nothrow;
    c_long mrand48() @nogc nothrow;
    c_long jrand48(ushort*) @nogc nothrow;
    void srand48(c_long) @nogc nothrow;
    ushort* seed48(ushort*) @nogc nothrow;
    void lcong48(ushort*) @nogc nothrow;
    struct drand48_data
    {
        ushort[3] __x;
        ushort[3] __old_x;
        ushort __c;
        ushort __init;
        ulong __a;
    }
    int drand48_r(drand48_data*, double*) @nogc nothrow;
    int erand48_r(ushort*, drand48_data*, double*) @nogc nothrow;
    int lrand48_r(drand48_data*, c_long*) @nogc nothrow;
    int nrand48_r(ushort*, drand48_data*, c_long*) @nogc nothrow;
    int mrand48_r(drand48_data*, c_long*) @nogc nothrow;
    int jrand48_r(ushort*, drand48_data*, c_long*) @nogc nothrow;
    int srand48_r(c_long, drand48_data*) @nogc nothrow;
    int seed48_r(ushort*, drand48_data*) @nogc nothrow;
    int lcong48_r(ushort*, drand48_data*) @nogc nothrow;
    void* malloc(c_ulong) @nogc nothrow;
    void* calloc(c_ulong, c_ulong) @nogc nothrow;
    void* realloc(void*, c_ulong) @nogc nothrow;
    void* reallocarray(void*, c_ulong, c_ulong) @nogc nothrow;
    void free(void*) @nogc nothrow;
    void* valloc(c_ulong) @nogc nothrow;
    int posix_memalign(void**, c_ulong, c_ulong) @nogc nothrow;
    void* aligned_alloc(c_ulong, c_ulong) @nogc nothrow;
    void abort() @nogc nothrow;
    int atexit(void function()) @nogc nothrow;
    int at_quick_exit(void function()) @nogc nothrow;
    int on_exit(void function(int, void*), void*) @nogc nothrow;
    void exit(int) @nogc nothrow;
    void quick_exit(int) @nogc nothrow;
    void _Exit(int) @nogc nothrow;
    char* getenv(const(char)*) @nogc nothrow;
    int putenv(char*) @nogc nothrow;
    int setenv(const(char)*, const(char)*, int) @nogc nothrow;
    int unsetenv(const(char)*) @nogc nothrow;
    int clearenv() @nogc nothrow;
    char* mktemp(char*) @nogc nothrow;
    int mkstemp(char*) @nogc nothrow;
    int mkstemps(char*, int) @nogc nothrow;
    char* mkdtemp(char*) @nogc nothrow;
    int system(const(char)*) @nogc nothrow;
    char* realpath(const(char)*, char*) @nogc nothrow;
    static core.simd.long4 _mm256_mask_sllv_epi64(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    alias __compar_fn_t = int function(const(void)*, const(void)*);
    void* bsearch(const(void)*, const(void)*, c_ulong, c_ulong, int function(const(void)*, const(void)*)) @nogc nothrow;
    void qsort(void*, c_ulong, c_ulong, int function(const(void)*, const(void)*)) @nogc nothrow;
    int abs(int) @nogc nothrow;
    c_long labs(c_long) @nogc nothrow;
    long llabs(long) @nogc nothrow;
    div_t div(int, int) @nogc nothrow;
    ldiv_t ldiv(c_long, c_long) @nogc nothrow;
    lldiv_t lldiv(long, long) @nogc nothrow;
    char* ecvt(double, int, int*, int*) @nogc nothrow;
    char* fcvt(double, int, int*, int*) @nogc nothrow;
    char* gcvt(double, int, char*) @nogc nothrow;
    char* qecvt(real, int, int*, int*) @nogc nothrow;
    char* qfcvt(real, int, int*, int*) @nogc nothrow;
    char* qgcvt(real, int, char*) @nogc nothrow;
    int ecvt_r(double, int, int*, int*, char*, c_ulong) @nogc nothrow;
    int fcvt_r(double, int, int*, int*, char*, c_ulong) @nogc nothrow;
    int qecvt_r(real, int, int*, int*, char*, c_ulong) @nogc nothrow;
    int qfcvt_r(real, int, int*, int*, char*, c_ulong) @nogc nothrow;
    int mblen(const(char)*, c_ulong) @nogc nothrow;
    int mbtowc(int*, const(char)*, c_ulong) @nogc nothrow;
    int wctomb(char*, int) @nogc nothrow;
    c_ulong mbstowcs(int*, const(char)*, c_ulong) @nogc nothrow;
    c_ulong wcstombs(char*, const(int)*, c_ulong) @nogc nothrow;
    int rpmatch(const(char)*) @nogc nothrow;
    int getsubopt(char**, char**, char**) @nogc nothrow;
    int getloadavg(double*, int) @nogc nothrow;
    static core.simd.long2 _mm_maskz_sllv_epi64(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_sllv_epi64(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    void* memcpy(void*, const(void)*, c_ulong) @nogc nothrow;
    void* memmove(void*, const(void)*, c_ulong) @nogc nothrow;
    void* memccpy(void*, const(void)*, int, c_ulong) @nogc nothrow;
    void* memset(void*, int, c_ulong) @nogc nothrow;
    int memcmp(const(void)*, const(void)*, c_ulong) @nogc nothrow;
    void* memchr(const(void)*, int, c_ulong) @nogc nothrow;
    char* strcpy(char*, const(char)*) @nogc nothrow;
    char* strncpy(char*, const(char)*, c_ulong) @nogc nothrow;
    char* strcat(char*, const(char)*) @nogc nothrow;
    char* strncat(char*, const(char)*, c_ulong) @nogc nothrow;
    int strcmp(const(char)*, const(char)*) @nogc nothrow;
    int strncmp(const(char)*, const(char)*, c_ulong) @nogc nothrow;
    int strcoll(const(char)*, const(char)*) @nogc nothrow;
    c_ulong strxfrm(char*, const(char)*, c_ulong) @nogc nothrow;
    int strcoll_l(const(char)*, const(char)*, __locale_struct*) @nogc nothrow;
    c_ulong strxfrm_l(char*, const(char)*, c_ulong, __locale_struct*) @nogc nothrow;
    char* strdup(const(char)*) @nogc nothrow;
    char* strndup(const(char)*, c_ulong) @nogc nothrow;
    char* strchr(const(char)*, int) @nogc nothrow;
    char* strrchr(const(char)*, int) @nogc nothrow;
    c_ulong strcspn(const(char)*, const(char)*) @nogc nothrow;
    c_ulong strspn(const(char)*, const(char)*) @nogc nothrow;
    char* strpbrk(const(char)*, const(char)*) @nogc nothrow;
    char* strstr(const(char)*, const(char)*) @nogc nothrow;
    char* strtok(char*, const(char)*) @nogc nothrow;
    char* __strtok_r(char*, const(char)*, char**) @nogc nothrow;
    char* strtok_r(char*, const(char)*, char**) @nogc nothrow;
    c_ulong strlen(const(char)*) @nogc nothrow;
    c_ulong strnlen(const(char)*, c_ulong) @nogc nothrow;
    char* strerror(int) @nogc nothrow;
    int strerror_r(int, char*, c_ulong) @nogc nothrow;
    char* strerror_l(int, __locale_struct*) @nogc nothrow;
    void explicit_bzero(void*, c_ulong) @nogc nothrow;
    char* strsep(char**, const(char)*) @nogc nothrow;
    char* strsignal(int) @nogc nothrow;
    char* __stpcpy(char*, const(char)*) @nogc nothrow;
    char* stpcpy(char*, const(char)*) @nogc nothrow;
    char* __stpncpy(char*, const(char)*, c_ulong) @nogc nothrow;
    char* stpncpy(char*, const(char)*, c_ulong) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_rorv_epi64(ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    int bcmp(const(void)*, const(void)*, c_ulong) @nogc nothrow;
    void bcopy(const(void)*, void*, c_ulong) @nogc nothrow;
    void bzero(void*, c_ulong) @nogc nothrow;
    char* index(const(char)*, int) @nogc nothrow;
    char* rindex(const(char)*, int) @nogc nothrow;
    int ffs(int) @nogc nothrow;
    int ffsl(c_long) @nogc nothrow;
    int ffsll(long) @nogc nothrow;
    int strcasecmp(const(char)*, const(char)*) @nogc nothrow;
    int strncasecmp(const(char)*, const(char)*, c_ulong) @nogc nothrow;
    int strcasecmp_l(const(char)*, const(char)*, __locale_struct*) @nogc nothrow;
    int strncasecmp_l(const(char)*, const(char)*, c_ulong, __locale_struct*) @nogc nothrow;
    static core.simd.long4 _mm256_mask_rorv_epi64(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_rorv_epi64(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_rorv_epi64(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_rorv_epi64(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_rorv_epi64(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_rorv_epi32(ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_rorv_epi32(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_rorv_epi32(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_rorv_epi32(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_rorv_epi32(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_rorv_epi32(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_slli_epi64(ubyte, core.simd.long4, int) @nogc nothrow;
    static core.simd.long4 _mm256_mask_slli_epi64(core.simd.long4, ubyte, core.simd.long4, int) @nogc nothrow;
    static core.simd.long2 _mm_maskz_slli_epi64(ubyte, core.simd.long2, int) @nogc nothrow;
    static core.simd.long2 _mm_mask_slli_epi64(core.simd.long2, ubyte, core.simd.long2, int) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_sll_epi64(ubyte, core.simd.long4, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_sll_epi64(core.simd.long4, ubyte, core.simd.long4, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_sll_epi64(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_sll_epi64(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_slli_epi32(ubyte, core.simd.long4, int) @nogc nothrow;
    static core.simd.long4 _mm256_mask_slli_epi32(core.simd.long4, ubyte, core.simd.long4, int) @nogc nothrow;
    static core.simd.long2 _mm_maskz_slli_epi32(ubyte, core.simd.long2, int) @nogc nothrow;
    static core.simd.long2 _mm_mask_slli_epi32(core.simd.long2, ubyte, core.simd.long2, int) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_sll_epi32(ubyte, core.simd.long4, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_sll_epi32(core.simd.long4, ubyte, core.simd.long4, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_sll_epi32(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_sll_epi32(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_rolv_epi64(ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_rolv_epi64(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_rolv_epi64(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_rolv_epi64(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    alias suseconds_t = c_long;
    alias __fd_mask = c_long;
    static core.simd.long2 _mm_mask_rolv_epi64(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_rolv_epi64(core.simd.long2, core.simd.long2) @nogc nothrow;
    struct fd_set
    {
        c_long[16] __fds_bits;
    }
    static core.simd.long4 _mm256_maskz_rolv_epi32(ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    alias fd_mask = c_long;
    static core.simd.long4 _mm256_mask_rolv_epi32(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_rolv_epi32(core.simd.long4, core.simd.long4) @nogc nothrow;
    int select(int, fd_set*, fd_set*, fd_set*, timeval*) @nogc nothrow;
    int pselect(int, fd_set*, fd_set*, fd_set*, const(timespec)*, const(__sigset_t)*) @nogc nothrow;
    static core.simd.long2 _mm_maskz_rolv_epi32(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    enum _Anonymous_82
    {
        SHUT_RD = 0,
        SHUT_WR = 1,
        SHUT_RDWR = 2,
    }
    enum SHUT_RD = _Anonymous_82.SHUT_RD;
    enum SHUT_WR = _Anonymous_82.SHUT_WR;
    enum SHUT_RDWR = _Anonymous_82.SHUT_RDWR;
    static core.simd.long2 _mm_mask_rolv_epi32(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_rolv_epi32(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_cvtepu16_epi64(ubyte, core.simd.long2) @nogc nothrow;
    int socket(int, int, int) @nogc nothrow;
    int socketpair(int, int, int, int*) @nogc nothrow;
    int bind(int, const(sockaddr)*, uint) @nogc nothrow;
    int getsockname(int, sockaddr*, uint*) @nogc nothrow;
    int connect(int, const(sockaddr)*, uint) @nogc nothrow;
    int getpeername(int, sockaddr*, uint*) @nogc nothrow;
    c_long send(int, const(void)*, c_ulong, int) @nogc nothrow;
    c_long recv(int, void*, c_ulong, int) @nogc nothrow;
    c_long sendto(int, const(void)*, c_ulong, int, const(sockaddr)*, uint) @nogc nothrow;
    c_long recvfrom(int, void*, c_ulong, int, sockaddr*, uint*) @nogc nothrow;
    c_long sendmsg(int, const(msghdr)*, int) @nogc nothrow;
    c_long recvmsg(int, msghdr*, int) @nogc nothrow;
    int getsockopt(int, int, int, void*, uint*) @nogc nothrow;
    int setsockopt(int, int, int, const(void)*, uint) @nogc nothrow;
    int listen(int, int) @nogc nothrow;
    int accept(int, sockaddr*, uint*) @nogc nothrow;
    int shutdown(int, int) @nogc nothrow;
    int sockatmark(int) @nogc nothrow;
    int isfdtype(int, int) @nogc nothrow;
    static core.simd.long4 _mm256_mask_cvtepu16_epi64(core.simd.long4, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_cvtepu16_epi64(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_cvtepu16_epi64(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_cvtepu16_epi32(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_cvtepu16_epi32(core.simd.long4, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_cvtepu16_epi32(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_cvtepu16_epi32(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_cvtepu32_epi64(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_cvtepu32_epi64(core.simd.long4, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_cvtepu32_epi64(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_cvtepu32_epi64(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_cvtepu8_epi64(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_cvtepu8_epi64(core.simd.long4, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_cvtepu8_epi64(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_cvtepu8_epi64(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_cvtepu8_epi32(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_cvtepu8_epi32(core.simd.long4, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_cvtepu8_epi32(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_cvtepu8_epi32(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_cvtepi16_epi64(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_cvtepi16_epi64(core.simd.long4, ubyte, core.simd.long2) @nogc nothrow;
    pragma(mangle, "stat") int stat_(const(char)*, stat*) @nogc nothrow;
    int fstat(int, stat*) @nogc nothrow;
    int fstatat(int, const(char)*, stat*, int) @nogc nothrow;
    int lstat(const(char)*, stat*) @nogc nothrow;
    int chmod(const(char)*, uint) @nogc nothrow;
    int lchmod(const(char)*, uint) @nogc nothrow;
    int fchmod(int, uint) @nogc nothrow;
    int fchmodat(int, const(char)*, uint, int) @nogc nothrow;
    uint umask(uint) @nogc nothrow;
    int mkdir(const(char)*, uint) @nogc nothrow;
    int mkdirat(int, const(char)*, uint) @nogc nothrow;
    int mknod(const(char)*, uint, c_ulong) @nogc nothrow;
    int mknodat(int, const(char)*, uint, c_ulong) @nogc nothrow;
    int mkfifo(const(char)*, uint) @nogc nothrow;
    int mkfifoat(int, const(char)*, uint) @nogc nothrow;
    int utimensat(int, const(char)*, const(timespec)*, int) @nogc nothrow;
    int futimens(int, const(timespec)*) @nogc nothrow;
    int __fxstat(int, int, stat*) @nogc nothrow;
    int __xstat(int, const(char)*, stat*) @nogc nothrow;
    int __lxstat(int, const(char)*, stat*) @nogc nothrow;
    int __fxstatat(int, int, const(char)*, stat*, int) @nogc nothrow;
    int __xmknod(int, const(char)*, uint, c_ulong*) @nogc nothrow;
    int __xmknodat(int, int, const(char)*, uint, c_ulong*) @nogc nothrow;
    static core.simd.long2 _mm_maskz_cvtepi16_epi64(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_cvtepi16_epi64(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_cvtepi16_epi32(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_cvtepi16_epi32(core.simd.long4, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_cvtepi16_epi32(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_cvtepi16_epi32(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_cvtepi32_epi64(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_cvtepi32_epi64(core.simd.long4, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_cvtepi32_epi64(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_cvtepi32_epi64(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_cvtepi8_epi64(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_cvtepi8_epi64(core.simd.long4, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_cvtepi8_epi64(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_cvtepi8_epi64(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_cvtepi8_epi32(ubyte, core.simd.long2) @nogc nothrow;
    alias u_char = ubyte;
    alias u_short = ushort;
    alias u_int = uint;
    alias u_long = c_ulong;
    alias quad_t = c_long;
    alias u_quad_t = c_ulong;
    alias fsid_t = __fsid_t;
    alias loff_t = c_long;
    alias ino_t = c_ulong;
    static core.simd.long4 _mm256_mask_cvtepi8_epi32(core.simd.long4, ubyte, core.simd.long2) @nogc nothrow;
    alias dev_t = c_ulong;
    alias gid_t = uint;
    static core.simd.long2 _mm_maskz_cvtepi8_epi32(ubyte, core.simd.long2) @nogc nothrow;
    alias mode_t = uint;
    alias nlink_t = c_ulong;
    static core.simd.long2 _mm_mask_cvtepi8_epi32(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    alias uid_t = uint;
    alias off_t = c_long;
    static core.simd.long4 _mm256_maskz_permutex2var_epi64(ubyte, core.simd.long4, core.simd.long4, core.simd.long4) @nogc nothrow;
    alias pid_t = int;
    alias id_t = uint;
    static core.simd.long4 _mm256_mask2_permutex2var_epi64(core.simd.long4, core.simd.long4, ubyte, core.simd.long4) @nogc nothrow;
    alias ssize_t = c_long;
    alias daddr_t = int;
    alias caddr_t = char*;
    static core.simd.long4 _mm256_mask_permutex2var_epi64(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    alias key_t = int;
    static core.simd.long4 _mm256_permutex2var_epi64(core.simd.long4, core.simd.long4, core.simd.long4) @nogc nothrow;
    alias u_int8_t = ubyte;
    alias u_int16_t = ushort;
    alias u_int32_t = uint;
    alias u_int64_t = c_ulong;
    alias register_t = c_long;
    alias blksize_t = c_long;
    static core.simd.long2 _mm_maskz_permutex2var_epi64(ubyte, core.simd.long2, core.simd.long2, core.simd.long2) @nogc nothrow;
    alias blkcnt_t = c_long;
    alias fsblkcnt_t = c_ulong;
    static core.simd.long2 _mm_mask2_permutex2var_epi64(core.simd.long2, core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    alias fsfilcnt_t = c_ulong;
    static core.simd.long2 _mm_mask_permutex2var_epi64(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    alias greg_t = long;
    static core.simd.long2 _mm_permutex2var_epi64(core.simd.long2, core.simd.long2, core.simd.long2) @nogc nothrow;
    alias gregset_t = long[23];
    struct _libc_fpxreg
    {
        ushort[4] significand;
        ushort exponent;
        ushort[3] __glibc_reserved1;
    }
    struct _libc_xmmreg
    {
        uint[4] element;
    }
    struct _libc_fpstate
    {
        ushort cwd;
        ushort swd;
        ushort ftw;
        ushort fop;
        c_ulong rip;
        c_ulong rdp;
        uint mxcsr;
        uint mxcr_mask;
        _libc_fpxreg[8] _st;
        _libc_xmmreg[16] _xmm;
        uint[24] __glibc_reserved1;
    }
    alias fpregset_t = _libc_fpstate*;
    struct mcontext_t
    {
        long[23] gregs;
        _libc_fpstate* fpregs;
        ulong[8] __reserved1;
    }
    struct ucontext_t
    {
        c_ulong uc_flags;
        ucontext_t* uc_link;
        stack_t uc_stack;
        mcontext_t uc_mcontext;
        __sigset_t uc_sigmask;
        _libc_fpstate __fpregs_mem;
        ulong[4] __ssp;
    }
    static core.simd.float8 _mm256_maskz_permutex2var_ps(ubyte, core.simd.float8, core.simd.long4, core.simd.float8) @nogc nothrow;
    uint cfgetospeed(const(termios)*) @nogc nothrow;
    uint cfgetispeed(const(termios)*) @nogc nothrow;
    int cfsetospeed(termios*, uint) @nogc nothrow;
    int cfsetispeed(termios*, uint) @nogc nothrow;
    int cfsetspeed(termios*, uint) @nogc nothrow;
    int tcgetattr(int, termios*) @nogc nothrow;
    int tcsetattr(int, int, const(termios)*) @nogc nothrow;
    void cfmakeraw(termios*) @nogc nothrow;
    int tcsendbreak(int, int) @nogc nothrow;
    int tcdrain(int) @nogc nothrow;
    int tcflush(int, int) @nogc nothrow;
    int tcflow(int, int) @nogc nothrow;
    int tcgetsid(int) @nogc nothrow;
    static core.simd.float8 _mm256_mask2_permutex2var_ps(core.simd.float8, core.simd.long4, ubyte, core.simd.float8) @nogc nothrow;
    static core.simd.float8 _mm256_mask_permutex2var_ps(core.simd.float8, ubyte, core.simd.long4, core.simd.float8) @nogc nothrow;
    struct sigevent
    {
        sigval sigev_value;
        int sigev_signo;
        int sigev_notify;
        static union _Anonymous_83
        {
            int[12] _pad;
            int _tid;
            static struct _Anonymous_84
            {
                void function(sigval) _function;
                pthread_attr_t* _attribute;
            }
            _Anonymous_84 _sigev_thread;
        }
        _Anonymous_83 _sigev_un;
    }
    c_long clock() @nogc nothrow;
    c_long time(c_long*) @nogc nothrow;
    double difftime(c_long, c_long) @nogc nothrow;
    c_long mktime(tm*) @nogc nothrow;
    c_ulong strftime(char*, c_ulong, const(char)*, const(tm)*) @nogc nothrow;
    c_ulong strftime_l(char*, c_ulong, const(char)*, const(tm)*, __locale_struct*) @nogc nothrow;
    tm* gmtime(const(c_long)*) @nogc nothrow;
    tm* localtime(const(c_long)*) @nogc nothrow;
    tm* gmtime_r(const(c_long)*, tm*) @nogc nothrow;
    tm* localtime_r(const(c_long)*, tm*) @nogc nothrow;
    char* asctime(const(tm)*) @nogc nothrow;
    char* ctime(const(c_long)*) @nogc nothrow;
    char* asctime_r(const(tm)*, char*) @nogc nothrow;
    char* ctime_r(const(c_long)*, char*) @nogc nothrow;
    extern __gshared char*[2] __tzname;
    extern __gshared int __daylight;
    extern __gshared c_long __timezone;
    extern __gshared char*[2] tzname;
    void tzset() @nogc nothrow;
    extern __gshared int daylight;
    extern __gshared c_long timezone;
    int stime(const(c_long)*) @nogc nothrow;
    static core.simd.float8 _mm256_permutex2var_ps(core.simd.float8, core.simd.long4, core.simd.float8) @nogc nothrow;
    c_long timegm(tm*) @nogc nothrow;
    c_long timelocal(tm*) @nogc nothrow;
    int dysize(int) @nogc nothrow;
    int nanosleep(const(timespec)*, timespec*) @nogc nothrow;
    int clock_getres(int, timespec*) @nogc nothrow;
    int clock_gettime(int, timespec*) @nogc nothrow;
    int clock_settime(int, const(timespec)*) @nogc nothrow;
    int clock_nanosleep(int, int, const(timespec)*, timespec*) @nogc nothrow;
    int clock_getcpuclockid(int, int*) @nogc nothrow;
    int timer_create(int, sigevent*, void**) @nogc nothrow;
    int timer_delete(void*) @nogc nothrow;
    int timer_settime(void*, int, const(itimerspec)*, itimerspec*) @nogc nothrow;
    int timer_gettime(void*, itimerspec*) @nogc nothrow;
    int timer_getoverrun(void*) @nogc nothrow;
    int timespec_get(timespec*, int) @nogc nothrow;
    struct max_align_t
    {
        long __clang_max_align_nonce1;
        real __clang_max_align_nonce2;
    }
    static core.simd.float4 _mm_maskz_permutex2var_ps(ubyte, core.simd.float4, core.simd.long2, core.simd.float4) @nogc nothrow;
    static core.simd.long2 _mm_aesenc_si128(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_aesenclast_si128(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_aesdec_si128(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_aesdeclast_si128(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_aesimc_si128(core.simd.long2) @nogc nothrow;
    static core.simd.float4 _mm_mask2_permutex2var_ps(core.simd.float4, core.simd.long2, ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_mask_permutex2var_ps(core.simd.float4, ubyte, core.simd.long2, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_permutex2var_ps(core.simd.float4, core.simd.long2, core.simd.float4) @nogc nothrow;
    static ubyte _addcarryx_u32(ubyte, uint, uint, uint*) @nogc nothrow;
    static ubyte _addcarryx_u64(ubyte, ulong, ulong, ulong*) @nogc nothrow;
    static ubyte _addcarry_u32(ubyte, uint, uint, uint*) @nogc nothrow;
    static ubyte _addcarry_u64(ubyte, ulong, ulong, ulong*) @nogc nothrow;
    static ubyte _subborrow_u32(ubyte, uint, uint, uint*) @nogc nothrow;
    static ubyte _subborrow_u64(ubyte, ulong, ulong, ulong*) @nogc nothrow;
    static core.simd.double4 _mm256_maskz_permutex2var_pd(ubyte, core.simd.double4, core.simd.long4, core.simd.double4) @nogc nothrow;
    static core.simd.double4 _mm256_mask2_permutex2var_pd(core.simd.double4, core.simd.long4, ubyte, core.simd.double4) @nogc nothrow;
    static core.simd.long4 _mm256_abs_epi8(core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_abs_epi16(core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_abs_epi32(core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_packs_epi16(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_packs_epi32(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_packus_epi16(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_packus_epi32(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_add_epi8(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_add_epi16(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_add_epi32(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_add_epi64(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_adds_epi8(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_adds_epi16(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_adds_epu8(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_adds_epu16(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_and_si256(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_andnot_si256(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_avg_epu8(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_avg_epu16(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_blendv_epi8(core.simd.long4, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.double4 _mm256_mask_permutex2var_pd(core.simd.double4, ubyte, core.simd.long4, core.simd.double4) @nogc nothrow;
    static core.simd.long4 _mm256_cmpeq_epi8(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_cmpeq_epi16(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_cmpeq_epi32(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_cmpeq_epi64(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_cmpgt_epi8(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_cmpgt_epi16(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_cmpgt_epi32(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_cmpgt_epi64(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_hadd_epi16(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_hadd_epi32(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_hadds_epi16(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_hsub_epi16(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_hsub_epi32(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_hsubs_epi16(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maddubs_epi16(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_madd_epi16(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_max_epi8(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_max_epi16(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_max_epi32(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_max_epu8(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_max_epu16(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_max_epu32(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_min_epi8(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_min_epi16(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_min_epi32(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_min_epu8(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_min_epu16(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_min_epu32(core.simd.long4, core.simd.long4) @nogc nothrow;
    static int _mm256_movemask_epi8(core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_cvtepi8_epi16(core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_cvtepi8_epi32(core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_cvtepi8_epi64(core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_cvtepi16_epi32(core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_cvtepi16_epi64(core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_cvtepi32_epi64(core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_cvtepu8_epi16(core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_cvtepu8_epi32(core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_cvtepu8_epi64(core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_cvtepu16_epi32(core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_cvtepu16_epi64(core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_cvtepu32_epi64(core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mul_epi32(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mulhrs_epi16(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mulhi_epu16(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mulhi_epi16(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mullo_epi16(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mullo_epi32(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mul_epu32(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_or_si256(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_sad_epu8(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_shuffle_epi8(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.double4 _mm256_permutex2var_pd(core.simd.double4, core.simd.long4, core.simd.double4) @nogc nothrow;
    static core.simd.long4 _mm256_sign_epi8(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_sign_epi16(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_sign_epi32(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.double2 _mm_maskz_permutex2var_pd(ubyte, core.simd.double2, core.simd.long2, core.simd.double2) @nogc nothrow;
    static core.simd.long4 _mm256_slli_epi16(core.simd.long4, int) @nogc nothrow;
    static core.simd.long4 _mm256_sll_epi16(core.simd.long4, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_slli_epi32(core.simd.long4, int) @nogc nothrow;
    static core.simd.long4 _mm256_sll_epi32(core.simd.long4, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_slli_epi64(core.simd.long4, int) @nogc nothrow;
    static core.simd.long4 _mm256_sll_epi64(core.simd.long4, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_srai_epi16(core.simd.long4, int) @nogc nothrow;
    static core.simd.long4 _mm256_sra_epi16(core.simd.long4, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_srai_epi32(core.simd.long4, int) @nogc nothrow;
    static core.simd.long4 _mm256_sra_epi32(core.simd.long4, core.simd.long2) @nogc nothrow;
    static core.simd.double2 _mm_mask2_permutex2var_pd(core.simd.double2, core.simd.long2, ubyte, core.simd.double2) @nogc nothrow;
    static core.simd.long4 _mm256_srli_epi16(core.simd.long4, int) @nogc nothrow;
    static core.simd.long4 _mm256_srl_epi16(core.simd.long4, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_srli_epi32(core.simd.long4, int) @nogc nothrow;
    static core.simd.long4 _mm256_srl_epi32(core.simd.long4, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_srli_epi64(core.simd.long4, int) @nogc nothrow;
    static core.simd.long4 _mm256_srl_epi64(core.simd.long4, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_sub_epi8(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_sub_epi16(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_sub_epi32(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_sub_epi64(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_subs_epi8(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_subs_epi16(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_subs_epu8(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_subs_epu16(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_unpackhi_epi8(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_unpackhi_epi16(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_unpackhi_epi32(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_unpackhi_epi64(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_unpacklo_epi8(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_unpacklo_epi16(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_unpacklo_epi32(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_unpacklo_epi64(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_xor_si256(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_stream_load_si256(const(core.simd.long4)*) @nogc nothrow;
    static core.simd.float4 _mm_broadcastss_ps(core.simd.float4) @nogc nothrow;
    static core.simd.double2 _mm_broadcastsd_pd(core.simd.double2) @nogc nothrow;
    static core.simd.float8 _mm256_broadcastss_ps(core.simd.float4) @nogc nothrow;
    static core.simd.double4 _mm256_broadcastsd_pd(core.simd.double2) @nogc nothrow;
    static core.simd.long4 _mm256_broadcastsi128_si256(core.simd.long2) @nogc nothrow;
    static core.simd.double2 _mm_mask_permutex2var_pd(core.simd.double2, ubyte, core.simd.long2, core.simd.double2) @nogc nothrow;
    static core.simd.long4 _mm256_broadcastb_epi8(core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_broadcastw_epi16(core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_broadcastd_epi32(core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_broadcastq_epi64(core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_broadcastb_epi8(core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_broadcastw_epi16(core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_broadcastd_epi32(core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_broadcastq_epi64(core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_permutevar8x32_epi32(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.double2 _mm_permutex2var_pd(core.simd.double2, core.simd.long2, core.simd.double2) @nogc nothrow;
    static core.simd.float8 _mm256_permutevar8x32_ps(core.simd.float8, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_permutex2var_epi32(ubyte, core.simd.long4, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask2_permutex2var_epi32(core.simd.long4, core.simd.long4, ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskload_epi32(const(int)*, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskload_epi64(const(long)*, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskload_epi32(const(int)*, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskload_epi64(const(long)*, core.simd.long2) @nogc nothrow;
    static void _mm256_maskstore_epi32(int*, core.simd.long4, core.simd.long4) @nogc nothrow;
    static void _mm256_maskstore_epi64(long*, core.simd.long4, core.simd.long4) @nogc nothrow;
    static void _mm_maskstore_epi32(int*, core.simd.long2, core.simd.long2) @nogc nothrow;
    static void _mm_maskstore_epi64(long*, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_sllv_epi32(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_sllv_epi32(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_sllv_epi64(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_sllv_epi64(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_srav_epi32(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_srav_epi32(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_srlv_epi32(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_srlv_epi32(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_srlv_epi64(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_srlv_epi64(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_permutex2var_epi32(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_permutex2var_epi32(core.simd.long4, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_permutex2var_epi32(ubyte, core.simd.long2, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask2_permutex2var_epi32(core.simd.long2, core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_permutex2var_epi32(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_permutex2var_epi32(core.simd.long2, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.float8 _mm256_maskz_sub_ps(ubyte, core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.float8 _mm256_mask_sub_ps(core.simd.float8, ubyte, core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.float4 _mm_maskz_sub_ps(ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_mask_sub_ps(core.simd.float4, ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.double4 _mm256_maskz_sub_pd(ubyte, core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.double4 _mm256_mask_sub_pd(core.simd.double4, ubyte, core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.double2 _mm_maskz_sub_pd(ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_mask_sub_pd(core.simd.double2, ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.float8 _mm256_maskz_sqrt_ps(ubyte, core.simd.float8) @nogc nothrow;
    static core.simd.float8 _mm256_mask_sqrt_ps(core.simd.float8, ubyte, core.simd.float8) @nogc nothrow;
    static core.simd.float4 _mm_maskz_sqrt_ps(ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.long8 _mm512_popcnt_epi16(core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_popcnt_epi16(core.simd.long8, uint, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_popcnt_epi16(uint, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_popcnt_epi8(core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_popcnt_epi8(core.simd.long8, ulong, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_popcnt_epi8(ulong, core.simd.long8) @nogc nothrow;
    static ulong _mm512_mask_bitshuffle_epi64_mask(ulong, core.simd.long8, core.simd.long8) @nogc nothrow;
    static ulong _mm512_bitshuffle_epi64_mask(core.simd.long8, core.simd.long8) @nogc nothrow;
    alias __mmask32 = uint;
    alias __mmask64 = ulong;
    static core.simd.float4 _mm_mask_sqrt_ps(core.simd.float4, ubyte, core.simd.float4) @nogc nothrow;
    static uint _knot_mask32(uint) @nogc nothrow;
    static ulong _knot_mask64(ulong) @nogc nothrow;
    static uint _kand_mask32(uint, uint) @nogc nothrow;
    static ulong _kand_mask64(ulong, ulong) @nogc nothrow;
    static uint _kandn_mask32(uint, uint) @nogc nothrow;
    static ulong _kandn_mask64(ulong, ulong) @nogc nothrow;
    static uint _kor_mask32(uint, uint) @nogc nothrow;
    static ulong _kor_mask64(ulong, ulong) @nogc nothrow;
    static uint _kxnor_mask32(uint, uint) @nogc nothrow;
    static ulong _kxnor_mask64(ulong, ulong) @nogc nothrow;
    static uint _kxor_mask32(uint, uint) @nogc nothrow;
    static ulong _kxor_mask64(ulong, ulong) @nogc nothrow;
    static ubyte _kortestc_mask32_u8(uint, uint) @nogc nothrow;
    static ubyte _kortestz_mask32_u8(uint, uint) @nogc nothrow;
    static ubyte _kortest_mask32_u8(uint, uint, ubyte*) @nogc nothrow;
    static ubyte _kortestc_mask64_u8(ulong, ulong) @nogc nothrow;
    static ubyte _kortestz_mask64_u8(ulong, ulong) @nogc nothrow;
    static ubyte _kortest_mask64_u8(ulong, ulong, ubyte*) @nogc nothrow;
    static ubyte _ktestc_mask32_u8(uint, uint) @nogc nothrow;
    static ubyte _ktestz_mask32_u8(uint, uint) @nogc nothrow;
    static ubyte _ktest_mask32_u8(uint, uint, ubyte*) @nogc nothrow;
    static ubyte _ktestc_mask64_u8(ulong, ulong) @nogc nothrow;
    static ubyte _ktestz_mask64_u8(ulong, ulong) @nogc nothrow;
    static ubyte _ktest_mask64_u8(ulong, ulong, ubyte*) @nogc nothrow;
    static uint _kadd_mask32(uint, uint) @nogc nothrow;
    static ulong _kadd_mask64(ulong, ulong) @nogc nothrow;
    static core.simd.double4 _mm256_maskz_sqrt_pd(ubyte, core.simd.double4) @nogc nothrow;
    static core.simd.double4 _mm256_mask_sqrt_pd(core.simd.double4, ubyte, core.simd.double4) @nogc nothrow;
    static uint _cvtmask32_u32(uint) @nogc nothrow;
    static ulong _cvtmask64_u64(ulong) @nogc nothrow;
    static uint _cvtu32_mask32(uint) @nogc nothrow;
    static ulong _cvtu64_mask64(ulong) @nogc nothrow;
    static uint _load_mask32(uint*) @nogc nothrow;
    static ulong _load_mask64(ulong*) @nogc nothrow;
    static void _store_mask32(uint*, uint) @nogc nothrow;
    static void _store_mask64(ulong*, ulong) @nogc nothrow;
    static core.simd.double2 _mm_maskz_sqrt_pd(ubyte, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_mask_sqrt_pd(core.simd.double2, ubyte, core.simd.double2) @nogc nothrow;
    static core.simd.float8 _mm256_maskz_scalef_ps(ubyte, core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.float8 _mm256_mask_scalef_ps(core.simd.float8, ubyte, core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.float8 _mm256_scalef_ps(core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.float4 _mm_maskz_scalef_ps(ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_mask_scalef_ps(core.simd.float4, ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_scalef_ps(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.double4 _mm256_maskz_scalef_pd(ubyte, core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.double4 _mm256_mask_scalef_pd(core.simd.double4, ubyte, core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.double4 _mm256_scalef_pd(core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.double2 _mm_maskz_scalef_pd(ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_mask_scalef_pd(core.simd.double2, ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_scalef_pd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_min_epu64(ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_min_epu64(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_min_epu64(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_min_epu64(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_min_epu64(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_min_epu64(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_min_epu32(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_min_epu32(ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_mask_min_epu32(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_min_epu32(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_min_epi64(ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_min_epi64(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_min_epi64(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_min_epi64(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_add_epi8(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_add_epi8(core.simd.long8, ulong, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_add_epi8(ulong, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_sub_epi8(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_sub_epi8(core.simd.long8, ulong, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_sub_epi8(ulong, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_add_epi16(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_add_epi16(core.simd.long8, uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_add_epi16(uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_sub_epi16(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_sub_epi16(core.simd.long8, uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_sub_epi16(uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mullo_epi16(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_mullo_epi16(core.simd.long8, uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_mullo_epi16(uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_blend_epi8(ulong, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_blend_epi16(uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_abs_epi8(core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_abs_epi8(core.simd.long8, ulong, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_abs_epi8(ulong, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_abs_epi16(core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_abs_epi16(core.simd.long8, uint, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_abs_epi16(uint, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_packs_epi32(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_packs_epi32(uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_packs_epi32(core.simd.long8, uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_packs_epi16(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_packs_epi16(core.simd.long8, ulong, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_packs_epi16(ulong, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_packus_epi32(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_packus_epi32(uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_packus_epi32(core.simd.long8, uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_packus_epi16(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_packus_epi16(core.simd.long8, ulong, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_packus_epi16(ulong, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_adds_epi8(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_adds_epi8(core.simd.long8, ulong, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_adds_epi8(ulong, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_adds_epi16(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_adds_epi16(core.simd.long8, uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_adds_epi16(uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_adds_epu8(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_adds_epu8(core.simd.long8, ulong, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_adds_epu8(ulong, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_adds_epu16(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_adds_epu16(core.simd.long8, uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_adds_epu16(uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_avg_epu8(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_avg_epu8(core.simd.long8, ulong, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_avg_epu8(ulong, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_avg_epu16(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_avg_epu16(core.simd.long8, uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_avg_epu16(uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_max_epi8(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_max_epi8(ulong, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_max_epi8(core.simd.long8, ulong, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_max_epi16(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_max_epi16(uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_max_epi16(core.simd.long8, uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_max_epu8(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_max_epu8(ulong, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_max_epu8(core.simd.long8, ulong, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_max_epu16(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_max_epu16(uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_max_epu16(core.simd.long8, uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_min_epi8(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_min_epi8(ulong, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_min_epi8(core.simd.long8, ulong, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_min_epi16(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_min_epi16(uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_min_epi16(core.simd.long8, uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_min_epu8(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_min_epu8(ulong, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_min_epu8(core.simd.long8, ulong, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_min_epu16(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_min_epu16(uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_min_epu16(core.simd.long8, uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_shuffle_epi8(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_shuffle_epi8(core.simd.long8, ulong, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_shuffle_epi8(ulong, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_subs_epi8(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_subs_epi8(core.simd.long8, ulong, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_subs_epi8(ulong, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_subs_epi16(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_subs_epi16(core.simd.long8, uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_subs_epi16(uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_subs_epu8(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_subs_epu8(core.simd.long8, ulong, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_subs_epu8(ulong, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_subs_epu16(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_subs_epu16(core.simd.long8, uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_subs_epu16(uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_permutex2var_epi16(core.simd.long8, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_permutex2var_epi16(core.simd.long8, uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask2_permutex2var_epi16(core.simd.long8, core.simd.long8, uint, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_permutex2var_epi16(uint, core.simd.long8, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mulhrs_epi16(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_mulhrs_epi16(core.simd.long8, uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_mulhrs_epi16(uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mulhi_epi16(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_mulhi_epi16(core.simd.long8, uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_mulhi_epi16(uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mulhi_epu16(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_mulhi_epu16(core.simd.long8, uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_mulhi_epu16(uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maddubs_epi16(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_maddubs_epi16(core.simd.long8, uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_maddubs_epi16(uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_madd_epi16(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_madd_epi16(core.simd.long8, ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_madd_epi16(ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long4 _mm512_cvtsepi16_epi8(core.simd.long8) @nogc nothrow;
    static core.simd.long4 _mm512_mask_cvtsepi16_epi8(core.simd.long4, uint, core.simd.long8) @nogc nothrow;
    static core.simd.long4 _mm512_maskz_cvtsepi16_epi8(uint, core.simd.long8) @nogc nothrow;
    static core.simd.long4 _mm512_cvtusepi16_epi8(core.simd.long8) @nogc nothrow;
    static core.simd.long4 _mm512_mask_cvtusepi16_epi8(core.simd.long4, uint, core.simd.long8) @nogc nothrow;
    static core.simd.long4 _mm512_maskz_cvtusepi16_epi8(uint, core.simd.long8) @nogc nothrow;
    static core.simd.long4 _mm512_cvtepi16_epi8(core.simd.long8) @nogc nothrow;
    static core.simd.long4 _mm512_mask_cvtepi16_epi8(core.simd.long4, uint, core.simd.long8) @nogc nothrow;
    static core.simd.long4 _mm512_maskz_cvtepi16_epi8(uint, core.simd.long8) @nogc nothrow;
    static void _mm512_mask_cvtepi16_storeu_epi8(void*, uint, core.simd.long8) @nogc nothrow;
    static void _mm512_mask_cvtsepi16_storeu_epi8(void*, uint, core.simd.long8) @nogc nothrow;
    static void _mm512_mask_cvtusepi16_storeu_epi8(void*, uint, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_unpackhi_epi8(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_unpackhi_epi8(core.simd.long8, ulong, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_unpackhi_epi8(ulong, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_unpackhi_epi16(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_unpackhi_epi16(core.simd.long8, uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_unpackhi_epi16(uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_unpacklo_epi8(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_unpacklo_epi8(core.simd.long8, ulong, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_unpacklo_epi8(ulong, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_unpacklo_epi16(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_unpacklo_epi16(core.simd.long8, uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_unpacklo_epi16(uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_cvtepi8_epi16(core.simd.long4) @nogc nothrow;
    static core.simd.long8 _mm512_mask_cvtepi8_epi16(core.simd.long8, uint, core.simd.long4) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_cvtepi8_epi16(uint, core.simd.long4) @nogc nothrow;
    static core.simd.long8 _mm512_cvtepu8_epi16(core.simd.long4) @nogc nothrow;
    static core.simd.long8 _mm512_mask_cvtepu8_epi16(core.simd.long8, uint, core.simd.long4) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_cvtepu8_epi16(uint, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_mask_min_epi64(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_min_epi64(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_min_epi32(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long8 _mm512_sllv_epi16(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_sllv_epi16(core.simd.long8, uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_sllv_epi16(uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_sll_epi16(core.simd.long8, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_mask_sll_epi16(core.simd.long8, uint, core.simd.long8, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_sll_epi16(uint, core.simd.long8, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_slli_epi16(core.simd.long8, int) @nogc nothrow;
    static core.simd.long8 _mm512_mask_slli_epi16(core.simd.long8, uint, core.simd.long8, int) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_slli_epi16(uint, core.simd.long8, int) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_min_epi32(ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long8 _mm512_srlv_epi16(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_srlv_epi16(core.simd.long8, uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_srlv_epi16(uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_srav_epi16(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_srav_epi16(core.simd.long8, uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_srav_epi16(uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_sra_epi16(core.simd.long8, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_mask_sra_epi16(core.simd.long8, uint, core.simd.long8, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_sra_epi16(uint, core.simd.long8, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_srai_epi16(core.simd.long8, int) @nogc nothrow;
    static core.simd.long8 _mm512_mask_srai_epi16(core.simd.long8, uint, core.simd.long8, int) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_srai_epi16(uint, core.simd.long8, int) @nogc nothrow;
    static core.simd.long8 _mm512_srl_epi16(core.simd.long8, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_mask_srl_epi16(core.simd.long8, uint, core.simd.long8, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_srl_epi16(uint, core.simd.long8, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_srli_epi16(core.simd.long8, int) @nogc nothrow;
    static core.simd.long8 _mm512_mask_srli_epi16(core.simd.long8, uint, core.simd.long8, int) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_srli_epi16(uint, core.simd.long8, int) @nogc nothrow;
    static core.simd.long8 _mm512_mask_mov_epi16(core.simd.long8, uint, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_mov_epi16(uint, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_mov_epi8(core.simd.long8, ulong, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_mov_epi8(ulong, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_set1_epi8(core.simd.long8, ulong, char) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_set1_epi8(ulong, char) @nogc nothrow;
    static ulong _mm512_kunpackd(ulong, ulong) @nogc nothrow;
    static uint _mm512_kunpackw(uint, uint) @nogc nothrow;
    static core.simd.long8 _mm512_loadu_epi16(const(void)*) @nogc nothrow;
    static core.simd.long8 _mm512_mask_loadu_epi16(core.simd.long8, uint, const(void)*) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_loadu_epi16(uint, const(void)*) @nogc nothrow;
    static core.simd.long8 _mm512_loadu_epi8(const(void)*) @nogc nothrow;
    static core.simd.long8 _mm512_mask_loadu_epi8(core.simd.long8, ulong, const(void)*) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_loadu_epi8(ulong, const(void)*) @nogc nothrow;
    static void _mm512_storeu_epi16(void*, core.simd.long8) @nogc nothrow;
    static void _mm512_mask_storeu_epi16(void*, uint, core.simd.long8) @nogc nothrow;
    static void _mm512_storeu_epi8(void*, core.simd.long8) @nogc nothrow;
    static void _mm512_mask_storeu_epi8(void*, ulong, core.simd.long8) @nogc nothrow;
    static ulong _mm512_test_epi8_mask(core.simd.long8, core.simd.long8) @nogc nothrow;
    static ulong _mm512_mask_test_epi8_mask(ulong, core.simd.long8, core.simd.long8) @nogc nothrow;
    static uint _mm512_test_epi16_mask(core.simd.long8, core.simd.long8) @nogc nothrow;
    static uint _mm512_mask_test_epi16_mask(uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static ulong _mm512_testn_epi8_mask(core.simd.long8, core.simd.long8) @nogc nothrow;
    static ulong _mm512_mask_testn_epi8_mask(ulong, core.simd.long8, core.simd.long8) @nogc nothrow;
    static uint _mm512_testn_epi16_mask(core.simd.long8, core.simd.long8) @nogc nothrow;
    static uint _mm512_mask_testn_epi16_mask(uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static ulong _mm512_movepi8_mask(core.simd.long8) @nogc nothrow;
    static uint _mm512_movepi16_mask(core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_movm_epi8(ulong) @nogc nothrow;
    static core.simd.long8 _mm512_movm_epi16(uint) @nogc nothrow;
    static core.simd.long8 _mm512_broadcastb_epi8(core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_mask_broadcastb_epi8(core.simd.long8, ulong, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_broadcastb_epi8(ulong, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_mask_set1_epi16(core.simd.long8, uint, short) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_set1_epi16(uint, short) @nogc nothrow;
    static core.simd.long8 _mm512_broadcastw_epi16(core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_mask_broadcastw_epi16(core.simd.long8, uint, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_broadcastw_epi16(uint, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_permutexvar_epi16(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_permutexvar_epi16(uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_permutexvar_epi16(core.simd.long8, uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long2 _mm_mask_min_epi32(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_min_epi32(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_max_epu64(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long8 _mm512_sad_epu8(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_max_epu64(ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long8 _mm512_conflict_epi64(core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_conflict_epi64(core.simd.long8, ubyte, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_conflict_epi64(ubyte, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_conflict_epi32(core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_conflict_epi32(core.simd.long8, ushort, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_conflict_epi32(ushort, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_lzcnt_epi32(core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_lzcnt_epi32(core.simd.long8, ushort, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_lzcnt_epi32(ushort, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_lzcnt_epi64(core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_lzcnt_epi64(core.simd.long8, ubyte, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_lzcnt_epi64(ubyte, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_broadcastmb_epi64(ubyte) @nogc nothrow;
    static core.simd.long8 _mm512_broadcastmw_epi32(ushort) @nogc nothrow;
    static core.simd.long4 _mm256_max_epu64(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_mask_max_epu64(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static ubyte _knot_mask8(ubyte) @nogc nothrow;
    static ubyte _kand_mask8(ubyte, ubyte) @nogc nothrow;
    static ubyte _kandn_mask8(ubyte, ubyte) @nogc nothrow;
    static ubyte _kor_mask8(ubyte, ubyte) @nogc nothrow;
    static ubyte _kxnor_mask8(ubyte, ubyte) @nogc nothrow;
    static ubyte _kxor_mask8(ubyte, ubyte) @nogc nothrow;
    static ubyte _kortestc_mask8_u8(ubyte, ubyte) @nogc nothrow;
    static ubyte _kortestz_mask8_u8(ubyte, ubyte) @nogc nothrow;
    static ubyte _kortest_mask8_u8(ubyte, ubyte, ubyte*) @nogc nothrow;
    static ubyte _ktestc_mask8_u8(ubyte, ubyte) @nogc nothrow;
    static ubyte _ktestz_mask8_u8(ubyte, ubyte) @nogc nothrow;
    static ubyte _ktest_mask8_u8(ubyte, ubyte, ubyte*) @nogc nothrow;
    static ubyte _ktestc_mask16_u8(ushort, ushort) @nogc nothrow;
    static ubyte _ktestz_mask16_u8(ushort, ushort) @nogc nothrow;
    static ubyte _ktest_mask16_u8(ushort, ushort, ubyte*) @nogc nothrow;
    static ubyte _kadd_mask8(ubyte, ubyte) @nogc nothrow;
    static ushort _kadd_mask16(ushort, ushort) @nogc nothrow;
    static core.simd.long2 _mm_maskz_max_epu64(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static uint _cvtmask8_u32(ubyte) @nogc nothrow;
    static ubyte _cvtu32_mask8(uint) @nogc nothrow;
    static ubyte _load_mask8(ubyte*) @nogc nothrow;
    static void _store_mask8(ubyte*, ubyte) @nogc nothrow;
    static core.simd.long8 _mm512_mullo_epi64(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_mullo_epi64(core.simd.long8, ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_mullo_epi64(ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.double8 _mm512_xor_pd(core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_mask_xor_pd(core.simd.double8, ubyte, core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_maskz_xor_pd(ubyte, core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.float16 _mm512_xor_ps(core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_mask_xor_ps(core.simd.float16, ushort, core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_maskz_xor_ps(ushort, core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.double8 _mm512_or_pd(core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_mask_or_pd(core.simd.double8, ubyte, core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_maskz_or_pd(ubyte, core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.float16 _mm512_or_ps(core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_mask_or_ps(core.simd.float16, ushort, core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_maskz_or_ps(ushort, core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.double8 _mm512_and_pd(core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_mask_and_pd(core.simd.double8, ubyte, core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_maskz_and_pd(ubyte, core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.float16 _mm512_and_ps(core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_mask_and_ps(core.simd.float16, ushort, core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_maskz_and_ps(ushort, core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.double8 _mm512_andnot_pd(core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_mask_andnot_pd(core.simd.double8, ubyte, core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_maskz_andnot_pd(ubyte, core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.float16 _mm512_andnot_ps(core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_mask_andnot_ps(core.simd.float16, ushort, core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_maskz_andnot_ps(ushort, core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.long8 _mm512_cvtpd_epi64(core.simd.double8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_cvtpd_epi64(core.simd.long8, ubyte, core.simd.double8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_cvtpd_epi64(ubyte, core.simd.double8) @nogc nothrow;
    static core.simd.long2 _mm_max_epu64(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_cvtpd_epu64(core.simd.double8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_cvtpd_epu64(core.simd.long8, ubyte, core.simd.double8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_cvtpd_epu64(ubyte, core.simd.double8) @nogc nothrow;
    static core.simd.long4 _mm256_mask_max_epu32(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_max_epu32(ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long8 _mm512_cvtps_epi64(core.simd.float8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_cvtps_epi64(core.simd.long8, ubyte, core.simd.float8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_cvtps_epi64(ubyte, core.simd.float8) @nogc nothrow;
    static core.simd.long2 _mm_mask_max_epu32(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_cvtps_epu64(core.simd.float8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_cvtps_epu64(core.simd.long8, ubyte, core.simd.float8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_cvtps_epu64(ubyte, core.simd.float8) @nogc nothrow;
    static core.simd.long2 _mm_maskz_max_epu32(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_max_epi64(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.double8 _mm512_cvtepi64_pd(core.simd.long8) @nogc nothrow;
    static core.simd.double8 _mm512_mask_cvtepi64_pd(core.simd.double8, ubyte, core.simd.long8) @nogc nothrow;
    static core.simd.double8 _mm512_maskz_cvtepi64_pd(ubyte, core.simd.long8) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_max_epi64(ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.float8 _mm512_cvtepi64_ps(core.simd.long8) @nogc nothrow;
    static core.simd.float8 _mm512_mask_cvtepi64_ps(core.simd.float8, ubyte, core.simd.long8) @nogc nothrow;
    static core.simd.float8 _mm512_maskz_cvtepi64_ps(ubyte, core.simd.long8) @nogc nothrow;
    static core.simd.long4 _mm256_max_epi64(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_mask_max_epi64(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_cvttpd_epi64(core.simd.double8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_cvttpd_epi64(core.simd.long8, ubyte, core.simd.double8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_cvttpd_epi64(ubyte, core.simd.double8) @nogc nothrow;
    static core.simd.long2 _mm_maskz_max_epi64(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_cvttpd_epu64(core.simd.double8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_cvttpd_epu64(core.simd.long8, ubyte, core.simd.double8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_cvttpd_epu64(ubyte, core.simd.double8) @nogc nothrow;
    static core.simd.long2 _mm_max_epi64(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_max_epi32(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long8 _mm512_cvttps_epi64(core.simd.float8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_cvttps_epi64(core.simd.long8, ubyte, core.simd.float8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_cvttps_epi64(ubyte, core.simd.float8) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_max_epi32(ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long8 _mm512_cvttps_epu64(core.simd.float8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_cvttps_epu64(core.simd.long8, ubyte, core.simd.float8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_cvttps_epu64(ubyte, core.simd.float8) @nogc nothrow;
    static core.simd.long2 _mm_mask_max_epi32(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_max_epi32(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.double8 _mm512_cvtepu64_pd(core.simd.long8) @nogc nothrow;
    static core.simd.double8 _mm512_mask_cvtepu64_pd(core.simd.double8, ubyte, core.simd.long8) @nogc nothrow;
    static core.simd.double8 _mm512_maskz_cvtepu64_pd(ubyte, core.simd.long8) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_abs_epi64(ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.float8 _mm512_cvtepu64_ps(core.simd.long8) @nogc nothrow;
    static core.simd.float8 _mm512_mask_cvtepu64_ps(core.simd.float8, ubyte, core.simd.long8) @nogc nothrow;
    static core.simd.float8 _mm512_maskz_cvtepu64_ps(ubyte, core.simd.long8) @nogc nothrow;
    static core.simd.long4 _mm256_mask_abs_epi64(core.simd.long4, ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_abs_epi64(core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_abs_epi64(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_abs_epi64(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_abs_epi64(core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_abs_epi32(ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_abs_epi32(core.simd.long4, ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_abs_epi32(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_abs_epi32(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.float8 _mm256_maskz_mul_ps(ubyte, core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.float8 _mm256_mask_mul_ps(core.simd.float8, ubyte, core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.float4 _mm_maskz_mul_ps(ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_mask_mul_ps(core.simd.float4, ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.double4 _mm256_maskz_mul_pd(ubyte, core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.double4 _mm256_mask_mul_pd(core.simd.double4, ubyte, core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.double2 _mm_maskz_mul_pd(ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_mask_mul_pd(core.simd.double2, ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.float8 _mm256_maskz_min_ps(ubyte, core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.float8 _mm256_mask_min_ps(core.simd.float8, ubyte, core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.float4 _mm_maskz_min_ps(ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_mask_min_ps(core.simd.float4, ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.double4 _mm256_maskz_min_pd(ubyte, core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.double4 _mm256_mask_min_pd(core.simd.double4, ubyte, core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.double2 _mm_maskz_min_pd(ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_mask_min_pd(core.simd.double2, ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.float8 _mm256_maskz_max_ps(ubyte, core.simd.float8, core.simd.float8) @nogc nothrow;
    static ushort _mm512_movepi32_mask(core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_movm_epi32(ushort) @nogc nothrow;
    static core.simd.long8 _mm512_movm_epi64(ubyte) @nogc nothrow;
    static ubyte _mm512_movepi64_mask(core.simd.long8) @nogc nothrow;
    static core.simd.float16 _mm512_broadcast_f32x2(core.simd.float4) @nogc nothrow;
    static core.simd.float16 _mm512_mask_broadcast_f32x2(core.simd.float16, ushort, core.simd.float4) @nogc nothrow;
    static core.simd.float16 _mm512_maskz_broadcast_f32x2(ushort, core.simd.float4) @nogc nothrow;
    static core.simd.float16 _mm512_broadcast_f32x8(core.simd.float8) @nogc nothrow;
    static core.simd.float16 _mm512_mask_broadcast_f32x8(core.simd.float16, ushort, core.simd.float8) @nogc nothrow;
    static core.simd.float16 _mm512_maskz_broadcast_f32x8(ushort, core.simd.float8) @nogc nothrow;
    static core.simd.double8 _mm512_broadcast_f64x2(core.simd.double2) @nogc nothrow;
    static core.simd.double8 _mm512_mask_broadcast_f64x2(core.simd.double8, ubyte, core.simd.double2) @nogc nothrow;
    static core.simd.double8 _mm512_maskz_broadcast_f64x2(ubyte, core.simd.double2) @nogc nothrow;
    static core.simd.long8 _mm512_broadcast_i32x2(core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_mask_broadcast_i32x2(core.simd.long8, ushort, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_broadcast_i32x2(ushort, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_broadcast_i32x8(core.simd.long4) @nogc nothrow;
    static core.simd.long8 _mm512_mask_broadcast_i32x8(core.simd.long8, ushort, core.simd.long4) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_broadcast_i32x8(ushort, core.simd.long4) @nogc nothrow;
    static core.simd.long8 _mm512_broadcast_i64x2(core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_mask_broadcast_i64x2(core.simd.long8, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_broadcast_i64x2(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.float8 _mm256_mask_max_ps(core.simd.float8, ubyte, core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.float4 _mm_maskz_max_ps(ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_mask_max_ps(core.simd.float4, ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.double4 _mm256_maskz_max_pd(ubyte, core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.double4 _mm256_mask_max_pd(core.simd.double4, ubyte, core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.double2 _mm_maskz_max_pd(ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_mask_max_pd(core.simd.double2, ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.float8 _mm256_maskz_getexp_ps(ubyte, core.simd.float8) @nogc nothrow;
    static core.simd.float8 _mm256_mask_getexp_ps(core.simd.float8, ubyte, core.simd.float8) @nogc nothrow;
    static core.simd.float8 _mm256_getexp_ps(core.simd.float8) @nogc nothrow;
    static core.simd.float4 _mm_maskz_getexp_ps(ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_mask_getexp_ps(core.simd.float4, ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_getexp_ps(core.simd.float4) @nogc nothrow;
    static core.simd.double4 _mm256_maskz_getexp_pd(ubyte, core.simd.double4) @nogc nothrow;
    static core.simd.double4 _mm256_mask_getexp_pd(core.simd.double4, ubyte, core.simd.double4) @nogc nothrow;
    static core.simd.double4 _mm256_getexp_pd(core.simd.double4) @nogc nothrow;
    static core.simd.double2 _mm_maskz_getexp_pd(ubyte, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_mask_getexp_pd(core.simd.double2, ubyte, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_getexp_pd(core.simd.double2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_expand_epi32(ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_expand_epi32(core.simd.long4, ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_expand_epi32(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_expand_epi32(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.float8 _mm256_maskz_expand_ps(ubyte, core.simd.float8) @nogc nothrow;
    static core.simd.float8 _mm256_mask_expand_ps(core.simd.float8, ubyte, core.simd.float8) @nogc nothrow;
    static core.simd.float4 _mm_maskz_expand_ps(ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_mask_expand_ps(core.simd.float4, ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_expandloadu_epi32(ubyte, const(void)*) @nogc nothrow;
    static core.simd.long4 _mm256_mask_expandloadu_epi32(core.simd.long4, ubyte, const(void)*) @nogc nothrow;
    static core.simd.long2 _mm_maskz_expandloadu_epi32(ubyte, const(void)*) @nogc nothrow;
    static core.simd.long2 _mm_mask_expandloadu_epi32(core.simd.long2, ubyte, const(void)*) @nogc nothrow;
    static core.simd.float8 _mm256_maskz_expandloadu_ps(ubyte, const(void)*) @nogc nothrow;
    static core.simd.float8 _mm256_mask_expandloadu_ps(core.simd.float8, ubyte, const(void)*) @nogc nothrow;
    static core.simd.float4 _mm_maskz_expandloadu_ps(ubyte, const(void)*) @nogc nothrow;
    static core.simd.float4 _mm_mask_expandloadu_ps(core.simd.float4, ubyte, const(void)*) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_expandloadu_epi64(ubyte, const(void)*) @nogc nothrow;
    static core.simd.long4 _mm256_mask_expandloadu_epi64(core.simd.long4, ubyte, const(void)*) @nogc nothrow;
    static core.simd.long2 _mm_maskz_expandloadu_epi64(ubyte, const(void)*) @nogc nothrow;
    static core.simd.long2 _mm_mask_expandloadu_epi64(core.simd.long2, ubyte, const(void)*) @nogc nothrow;
    static core.simd.double4 _mm256_maskz_expandloadu_pd(ubyte, const(void)*) @nogc nothrow;
    static core.simd.double4 _mm256_mask_expandloadu_pd(core.simd.double4, ubyte, const(void)*) @nogc nothrow;
    static core.simd.double2 _mm_maskz_expandloadu_pd(ubyte, const(void)*) @nogc nothrow;
    static core.simd.double2 _mm_mask_expandloadu_pd(core.simd.double2, ubyte, const(void)*) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_expand_epi64(ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_expand_epi64(core.simd.long4, ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_expand_epi64(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_expand_epi64(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    alias __v64qi = core.simd.char64;
    alias __v32hi = core.simd.short32;
    alias __v8df = core.simd.double8;
    alias __v16sf = core.simd.float16;
    alias __v8di = core.simd.long8;
    alias __v16si = core.simd.int16;
    alias __v64qu = core.simd.ubyte64;
    alias __v32hu = core.simd.ushort32;
    alias __v8du = core.simd.ulong8;
    alias __v16su = core.simd.uint16;
    alias __m512 = core.simd.float16;
    alias __m512d = core.simd.double8;
    alias __m512i = core.simd.long8;
    alias __mmask8 = ubyte;
    alias __mmask16 = ushort;
    static core.simd.double4 _mm256_maskz_expand_pd(ubyte, core.simd.double4) @nogc nothrow;
    static core.simd.double4 _mm256_mask_expand_pd(core.simd.double4, ubyte, core.simd.double4) @nogc nothrow;
    alias _MM_CMPINT_ENUM = _Anonymous_85;
    enum _Anonymous_85
    {
        _MM_CMPINT_EQ = 0,
        _MM_CMPINT_LT = 1,
        _MM_CMPINT_LE = 2,
        _MM_CMPINT_UNUSED = 3,
        _MM_CMPINT_NE = 4,
        _MM_CMPINT_NLT = 5,
        _MM_CMPINT_NLE = 6,
    }
    enum _MM_CMPINT_EQ = _Anonymous_85._MM_CMPINT_EQ;
    enum _MM_CMPINT_LT = _Anonymous_85._MM_CMPINT_LT;
    enum _MM_CMPINT_LE = _Anonymous_85._MM_CMPINT_LE;
    enum _MM_CMPINT_UNUSED = _Anonymous_85._MM_CMPINT_UNUSED;
    enum _MM_CMPINT_NE = _Anonymous_85._MM_CMPINT_NE;
    enum _MM_CMPINT_NLT = _Anonymous_85._MM_CMPINT_NLT;
    enum _MM_CMPINT_NLE = _Anonymous_85._MM_CMPINT_NLE;
    static core.simd.double2 _mm_maskz_expand_pd(ubyte, core.simd.double2) @nogc nothrow;
    alias _MM_PERM_ENUM = _Anonymous_86;
    enum _Anonymous_86
    {
        _MM_PERM_AAAA = 0,
        _MM_PERM_AAAB = 1,
        _MM_PERM_AAAC = 2,
        _MM_PERM_AAAD = 3,
        _MM_PERM_AABA = 4,
        _MM_PERM_AABB = 5,
        _MM_PERM_AABC = 6,
        _MM_PERM_AABD = 7,
        _MM_PERM_AACA = 8,
        _MM_PERM_AACB = 9,
        _MM_PERM_AACC = 10,
        _MM_PERM_AACD = 11,
        _MM_PERM_AADA = 12,
        _MM_PERM_AADB = 13,
        _MM_PERM_AADC = 14,
        _MM_PERM_AADD = 15,
        _MM_PERM_ABAA = 16,
        _MM_PERM_ABAB = 17,
        _MM_PERM_ABAC = 18,
        _MM_PERM_ABAD = 19,
        _MM_PERM_ABBA = 20,
        _MM_PERM_ABBB = 21,
        _MM_PERM_ABBC = 22,
        _MM_PERM_ABBD = 23,
        _MM_PERM_ABCA = 24,
        _MM_PERM_ABCB = 25,
        _MM_PERM_ABCC = 26,
        _MM_PERM_ABCD = 27,
        _MM_PERM_ABDA = 28,
        _MM_PERM_ABDB = 29,
        _MM_PERM_ABDC = 30,
        _MM_PERM_ABDD = 31,
        _MM_PERM_ACAA = 32,
        _MM_PERM_ACAB = 33,
        _MM_PERM_ACAC = 34,
        _MM_PERM_ACAD = 35,
        _MM_PERM_ACBA = 36,
        _MM_PERM_ACBB = 37,
        _MM_PERM_ACBC = 38,
        _MM_PERM_ACBD = 39,
        _MM_PERM_ACCA = 40,
        _MM_PERM_ACCB = 41,
        _MM_PERM_ACCC = 42,
        _MM_PERM_ACCD = 43,
        _MM_PERM_ACDA = 44,
        _MM_PERM_ACDB = 45,
        _MM_PERM_ACDC = 46,
        _MM_PERM_ACDD = 47,
        _MM_PERM_ADAA = 48,
        _MM_PERM_ADAB = 49,
        _MM_PERM_ADAC = 50,
        _MM_PERM_ADAD = 51,
        _MM_PERM_ADBA = 52,
        _MM_PERM_ADBB = 53,
        _MM_PERM_ADBC = 54,
        _MM_PERM_ADBD = 55,
        _MM_PERM_ADCA = 56,
        _MM_PERM_ADCB = 57,
        _MM_PERM_ADCC = 58,
        _MM_PERM_ADCD = 59,
        _MM_PERM_ADDA = 60,
        _MM_PERM_ADDB = 61,
        _MM_PERM_ADDC = 62,
        _MM_PERM_ADDD = 63,
        _MM_PERM_BAAA = 64,
        _MM_PERM_BAAB = 65,
        _MM_PERM_BAAC = 66,
        _MM_PERM_BAAD = 67,
        _MM_PERM_BABA = 68,
        _MM_PERM_BABB = 69,
        _MM_PERM_BABC = 70,
        _MM_PERM_BABD = 71,
        _MM_PERM_BACA = 72,
        _MM_PERM_BACB = 73,
        _MM_PERM_BACC = 74,
        _MM_PERM_BACD = 75,
        _MM_PERM_BADA = 76,
        _MM_PERM_BADB = 77,
        _MM_PERM_BADC = 78,
        _MM_PERM_BADD = 79,
        _MM_PERM_BBAA = 80,
        _MM_PERM_BBAB = 81,
        _MM_PERM_BBAC = 82,
        _MM_PERM_BBAD = 83,
        _MM_PERM_BBBA = 84,
        _MM_PERM_BBBB = 85,
        _MM_PERM_BBBC = 86,
        _MM_PERM_BBBD = 87,
        _MM_PERM_BBCA = 88,
        _MM_PERM_BBCB = 89,
        _MM_PERM_BBCC = 90,
        _MM_PERM_BBCD = 91,
        _MM_PERM_BBDA = 92,
        _MM_PERM_BBDB = 93,
        _MM_PERM_BBDC = 94,
        _MM_PERM_BBDD = 95,
        _MM_PERM_BCAA = 96,
        _MM_PERM_BCAB = 97,
        _MM_PERM_BCAC = 98,
        _MM_PERM_BCAD = 99,
        _MM_PERM_BCBA = 100,
        _MM_PERM_BCBB = 101,
        _MM_PERM_BCBC = 102,
        _MM_PERM_BCBD = 103,
        _MM_PERM_BCCA = 104,
        _MM_PERM_BCCB = 105,
        _MM_PERM_BCCC = 106,
        _MM_PERM_BCCD = 107,
        _MM_PERM_BCDA = 108,
        _MM_PERM_BCDB = 109,
        _MM_PERM_BCDC = 110,
        _MM_PERM_BCDD = 111,
        _MM_PERM_BDAA = 112,
        _MM_PERM_BDAB = 113,
        _MM_PERM_BDAC = 114,
        _MM_PERM_BDAD = 115,
        _MM_PERM_BDBA = 116,
        _MM_PERM_BDBB = 117,
        _MM_PERM_BDBC = 118,
        _MM_PERM_BDBD = 119,
        _MM_PERM_BDCA = 120,
        _MM_PERM_BDCB = 121,
        _MM_PERM_BDCC = 122,
        _MM_PERM_BDCD = 123,
        _MM_PERM_BDDA = 124,
        _MM_PERM_BDDB = 125,
        _MM_PERM_BDDC = 126,
        _MM_PERM_BDDD = 127,
        _MM_PERM_CAAA = 128,
        _MM_PERM_CAAB = 129,
        _MM_PERM_CAAC = 130,
        _MM_PERM_CAAD = 131,
        _MM_PERM_CABA = 132,
        _MM_PERM_CABB = 133,
        _MM_PERM_CABC = 134,
        _MM_PERM_CABD = 135,
        _MM_PERM_CACA = 136,
        _MM_PERM_CACB = 137,
        _MM_PERM_CACC = 138,
        _MM_PERM_CACD = 139,
        _MM_PERM_CADA = 140,
        _MM_PERM_CADB = 141,
        _MM_PERM_CADC = 142,
        _MM_PERM_CADD = 143,
        _MM_PERM_CBAA = 144,
        _MM_PERM_CBAB = 145,
        _MM_PERM_CBAC = 146,
        _MM_PERM_CBAD = 147,
        _MM_PERM_CBBA = 148,
        _MM_PERM_CBBB = 149,
        _MM_PERM_CBBC = 150,
        _MM_PERM_CBBD = 151,
        _MM_PERM_CBCA = 152,
        _MM_PERM_CBCB = 153,
        _MM_PERM_CBCC = 154,
        _MM_PERM_CBCD = 155,
        _MM_PERM_CBDA = 156,
        _MM_PERM_CBDB = 157,
        _MM_PERM_CBDC = 158,
        _MM_PERM_CBDD = 159,
        _MM_PERM_CCAA = 160,
        _MM_PERM_CCAB = 161,
        _MM_PERM_CCAC = 162,
        _MM_PERM_CCAD = 163,
        _MM_PERM_CCBA = 164,
        _MM_PERM_CCBB = 165,
        _MM_PERM_CCBC = 166,
        _MM_PERM_CCBD = 167,
        _MM_PERM_CCCA = 168,
        _MM_PERM_CCCB = 169,
        _MM_PERM_CCCC = 170,
        _MM_PERM_CCCD = 171,
        _MM_PERM_CCDA = 172,
        _MM_PERM_CCDB = 173,
        _MM_PERM_CCDC = 174,
        _MM_PERM_CCDD = 175,
        _MM_PERM_CDAA = 176,
        _MM_PERM_CDAB = 177,
        _MM_PERM_CDAC = 178,
        _MM_PERM_CDAD = 179,
        _MM_PERM_CDBA = 180,
        _MM_PERM_CDBB = 181,
        _MM_PERM_CDBC = 182,
        _MM_PERM_CDBD = 183,
        _MM_PERM_CDCA = 184,
        _MM_PERM_CDCB = 185,
        _MM_PERM_CDCC = 186,
        _MM_PERM_CDCD = 187,
        _MM_PERM_CDDA = 188,
        _MM_PERM_CDDB = 189,
        _MM_PERM_CDDC = 190,
        _MM_PERM_CDDD = 191,
        _MM_PERM_DAAA = 192,
        _MM_PERM_DAAB = 193,
        _MM_PERM_DAAC = 194,
        _MM_PERM_DAAD = 195,
        _MM_PERM_DABA = 196,
        _MM_PERM_DABB = 197,
        _MM_PERM_DABC = 198,
        _MM_PERM_DABD = 199,
        _MM_PERM_DACA = 200,
        _MM_PERM_DACB = 201,
        _MM_PERM_DACC = 202,
        _MM_PERM_DACD = 203,
        _MM_PERM_DADA = 204,
        _MM_PERM_DADB = 205,
        _MM_PERM_DADC = 206,
        _MM_PERM_DADD = 207,
        _MM_PERM_DBAA = 208,
        _MM_PERM_DBAB = 209,
        _MM_PERM_DBAC = 210,
        _MM_PERM_DBAD = 211,
        _MM_PERM_DBBA = 212,
        _MM_PERM_DBBB = 213,
        _MM_PERM_DBBC = 214,
        _MM_PERM_DBBD = 215,
        _MM_PERM_DBCA = 216,
        _MM_PERM_DBCB = 217,
        _MM_PERM_DBCC = 218,
        _MM_PERM_DBCD = 219,
        _MM_PERM_DBDA = 220,
        _MM_PERM_DBDB = 221,
        _MM_PERM_DBDC = 222,
        _MM_PERM_DBDD = 223,
        _MM_PERM_DCAA = 224,
        _MM_PERM_DCAB = 225,
        _MM_PERM_DCAC = 226,
        _MM_PERM_DCAD = 227,
        _MM_PERM_DCBA = 228,
        _MM_PERM_DCBB = 229,
        _MM_PERM_DCBC = 230,
        _MM_PERM_DCBD = 231,
        _MM_PERM_DCCA = 232,
        _MM_PERM_DCCB = 233,
        _MM_PERM_DCCC = 234,
        _MM_PERM_DCCD = 235,
        _MM_PERM_DCDA = 236,
        _MM_PERM_DCDB = 237,
        _MM_PERM_DCDC = 238,
        _MM_PERM_DCDD = 239,
        _MM_PERM_DDAA = 240,
        _MM_PERM_DDAB = 241,
        _MM_PERM_DDAC = 242,
        _MM_PERM_DDAD = 243,
        _MM_PERM_DDBA = 244,
        _MM_PERM_DDBB = 245,
        _MM_PERM_DDBC = 246,
        _MM_PERM_DDBD = 247,
        _MM_PERM_DDCA = 248,
        _MM_PERM_DDCB = 249,
        _MM_PERM_DDCC = 250,
        _MM_PERM_DDCD = 251,
        _MM_PERM_DDDA = 252,
        _MM_PERM_DDDB = 253,
        _MM_PERM_DDDC = 254,
        _MM_PERM_DDDD = 255,
    }
    enum _MM_PERM_AAAA = _Anonymous_86._MM_PERM_AAAA;
    enum _MM_PERM_AAAB = _Anonymous_86._MM_PERM_AAAB;
    enum _MM_PERM_AAAC = _Anonymous_86._MM_PERM_AAAC;
    enum _MM_PERM_AAAD = _Anonymous_86._MM_PERM_AAAD;
    enum _MM_PERM_AABA = _Anonymous_86._MM_PERM_AABA;
    enum _MM_PERM_AABB = _Anonymous_86._MM_PERM_AABB;
    enum _MM_PERM_AABC = _Anonymous_86._MM_PERM_AABC;
    enum _MM_PERM_AABD = _Anonymous_86._MM_PERM_AABD;
    enum _MM_PERM_AACA = _Anonymous_86._MM_PERM_AACA;
    enum _MM_PERM_AACB = _Anonymous_86._MM_PERM_AACB;
    enum _MM_PERM_AACC = _Anonymous_86._MM_PERM_AACC;
    enum _MM_PERM_AACD = _Anonymous_86._MM_PERM_AACD;
    enum _MM_PERM_AADA = _Anonymous_86._MM_PERM_AADA;
    enum _MM_PERM_AADB = _Anonymous_86._MM_PERM_AADB;
    enum _MM_PERM_AADC = _Anonymous_86._MM_PERM_AADC;
    enum _MM_PERM_AADD = _Anonymous_86._MM_PERM_AADD;
    enum _MM_PERM_ABAA = _Anonymous_86._MM_PERM_ABAA;
    enum _MM_PERM_ABAB = _Anonymous_86._MM_PERM_ABAB;
    enum _MM_PERM_ABAC = _Anonymous_86._MM_PERM_ABAC;
    enum _MM_PERM_ABAD = _Anonymous_86._MM_PERM_ABAD;
    enum _MM_PERM_ABBA = _Anonymous_86._MM_PERM_ABBA;
    enum _MM_PERM_ABBB = _Anonymous_86._MM_PERM_ABBB;
    enum _MM_PERM_ABBC = _Anonymous_86._MM_PERM_ABBC;
    enum _MM_PERM_ABBD = _Anonymous_86._MM_PERM_ABBD;
    enum _MM_PERM_ABCA = _Anonymous_86._MM_PERM_ABCA;
    enum _MM_PERM_ABCB = _Anonymous_86._MM_PERM_ABCB;
    enum _MM_PERM_ABCC = _Anonymous_86._MM_PERM_ABCC;
    enum _MM_PERM_ABCD = _Anonymous_86._MM_PERM_ABCD;
    enum _MM_PERM_ABDA = _Anonymous_86._MM_PERM_ABDA;
    enum _MM_PERM_ABDB = _Anonymous_86._MM_PERM_ABDB;
    enum _MM_PERM_ABDC = _Anonymous_86._MM_PERM_ABDC;
    enum _MM_PERM_ABDD = _Anonymous_86._MM_PERM_ABDD;
    enum _MM_PERM_ACAA = _Anonymous_86._MM_PERM_ACAA;
    enum _MM_PERM_ACAB = _Anonymous_86._MM_PERM_ACAB;
    enum _MM_PERM_ACAC = _Anonymous_86._MM_PERM_ACAC;
    enum _MM_PERM_ACAD = _Anonymous_86._MM_PERM_ACAD;
    enum _MM_PERM_ACBA = _Anonymous_86._MM_PERM_ACBA;
    enum _MM_PERM_ACBB = _Anonymous_86._MM_PERM_ACBB;
    enum _MM_PERM_ACBC = _Anonymous_86._MM_PERM_ACBC;
    enum _MM_PERM_ACBD = _Anonymous_86._MM_PERM_ACBD;
    enum _MM_PERM_ACCA = _Anonymous_86._MM_PERM_ACCA;
    enum _MM_PERM_ACCB = _Anonymous_86._MM_PERM_ACCB;
    enum _MM_PERM_ACCC = _Anonymous_86._MM_PERM_ACCC;
    enum _MM_PERM_ACCD = _Anonymous_86._MM_PERM_ACCD;
    enum _MM_PERM_ACDA = _Anonymous_86._MM_PERM_ACDA;
    enum _MM_PERM_ACDB = _Anonymous_86._MM_PERM_ACDB;
    enum _MM_PERM_ACDC = _Anonymous_86._MM_PERM_ACDC;
    enum _MM_PERM_ACDD = _Anonymous_86._MM_PERM_ACDD;
    enum _MM_PERM_ADAA = _Anonymous_86._MM_PERM_ADAA;
    enum _MM_PERM_ADAB = _Anonymous_86._MM_PERM_ADAB;
    enum _MM_PERM_ADAC = _Anonymous_86._MM_PERM_ADAC;
    enum _MM_PERM_ADAD = _Anonymous_86._MM_PERM_ADAD;
    enum _MM_PERM_ADBA = _Anonymous_86._MM_PERM_ADBA;
    enum _MM_PERM_ADBB = _Anonymous_86._MM_PERM_ADBB;
    enum _MM_PERM_ADBC = _Anonymous_86._MM_PERM_ADBC;
    enum _MM_PERM_ADBD = _Anonymous_86._MM_PERM_ADBD;
    enum _MM_PERM_ADCA = _Anonymous_86._MM_PERM_ADCA;
    enum _MM_PERM_ADCB = _Anonymous_86._MM_PERM_ADCB;
    enum _MM_PERM_ADCC = _Anonymous_86._MM_PERM_ADCC;
    enum _MM_PERM_ADCD = _Anonymous_86._MM_PERM_ADCD;
    enum _MM_PERM_ADDA = _Anonymous_86._MM_PERM_ADDA;
    enum _MM_PERM_ADDB = _Anonymous_86._MM_PERM_ADDB;
    enum _MM_PERM_ADDC = _Anonymous_86._MM_PERM_ADDC;
    enum _MM_PERM_ADDD = _Anonymous_86._MM_PERM_ADDD;
    enum _MM_PERM_BAAA = _Anonymous_86._MM_PERM_BAAA;
    enum _MM_PERM_BAAB = _Anonymous_86._MM_PERM_BAAB;
    enum _MM_PERM_BAAC = _Anonymous_86._MM_PERM_BAAC;
    enum _MM_PERM_BAAD = _Anonymous_86._MM_PERM_BAAD;
    enum _MM_PERM_BABA = _Anonymous_86._MM_PERM_BABA;
    enum _MM_PERM_BABB = _Anonymous_86._MM_PERM_BABB;
    enum _MM_PERM_BABC = _Anonymous_86._MM_PERM_BABC;
    enum _MM_PERM_BABD = _Anonymous_86._MM_PERM_BABD;
    enum _MM_PERM_BACA = _Anonymous_86._MM_PERM_BACA;
    enum _MM_PERM_BACB = _Anonymous_86._MM_PERM_BACB;
    enum _MM_PERM_BACC = _Anonymous_86._MM_PERM_BACC;
    enum _MM_PERM_BACD = _Anonymous_86._MM_PERM_BACD;
    enum _MM_PERM_BADA = _Anonymous_86._MM_PERM_BADA;
    enum _MM_PERM_BADB = _Anonymous_86._MM_PERM_BADB;
    enum _MM_PERM_BADC = _Anonymous_86._MM_PERM_BADC;
    enum _MM_PERM_BADD = _Anonymous_86._MM_PERM_BADD;
    enum _MM_PERM_BBAA = _Anonymous_86._MM_PERM_BBAA;
    enum _MM_PERM_BBAB = _Anonymous_86._MM_PERM_BBAB;
    enum _MM_PERM_BBAC = _Anonymous_86._MM_PERM_BBAC;
    enum _MM_PERM_BBAD = _Anonymous_86._MM_PERM_BBAD;
    enum _MM_PERM_BBBA = _Anonymous_86._MM_PERM_BBBA;
    enum _MM_PERM_BBBB = _Anonymous_86._MM_PERM_BBBB;
    enum _MM_PERM_BBBC = _Anonymous_86._MM_PERM_BBBC;
    enum _MM_PERM_BBBD = _Anonymous_86._MM_PERM_BBBD;
    enum _MM_PERM_BBCA = _Anonymous_86._MM_PERM_BBCA;
    enum _MM_PERM_BBCB = _Anonymous_86._MM_PERM_BBCB;
    enum _MM_PERM_BBCC = _Anonymous_86._MM_PERM_BBCC;
    enum _MM_PERM_BBCD = _Anonymous_86._MM_PERM_BBCD;
    enum _MM_PERM_BBDA = _Anonymous_86._MM_PERM_BBDA;
    enum _MM_PERM_BBDB = _Anonymous_86._MM_PERM_BBDB;
    enum _MM_PERM_BBDC = _Anonymous_86._MM_PERM_BBDC;
    enum _MM_PERM_BBDD = _Anonymous_86._MM_PERM_BBDD;
    enum _MM_PERM_BCAA = _Anonymous_86._MM_PERM_BCAA;
    enum _MM_PERM_BCAB = _Anonymous_86._MM_PERM_BCAB;
    enum _MM_PERM_BCAC = _Anonymous_86._MM_PERM_BCAC;
    enum _MM_PERM_BCAD = _Anonymous_86._MM_PERM_BCAD;
    enum _MM_PERM_BCBA = _Anonymous_86._MM_PERM_BCBA;
    enum _MM_PERM_BCBB = _Anonymous_86._MM_PERM_BCBB;
    enum _MM_PERM_BCBC = _Anonymous_86._MM_PERM_BCBC;
    enum _MM_PERM_BCBD = _Anonymous_86._MM_PERM_BCBD;
    enum _MM_PERM_BCCA = _Anonymous_86._MM_PERM_BCCA;
    enum _MM_PERM_BCCB = _Anonymous_86._MM_PERM_BCCB;
    enum _MM_PERM_BCCC = _Anonymous_86._MM_PERM_BCCC;
    enum _MM_PERM_BCCD = _Anonymous_86._MM_PERM_BCCD;
    enum _MM_PERM_BCDA = _Anonymous_86._MM_PERM_BCDA;
    enum _MM_PERM_BCDB = _Anonymous_86._MM_PERM_BCDB;
    enum _MM_PERM_BCDC = _Anonymous_86._MM_PERM_BCDC;
    enum _MM_PERM_BCDD = _Anonymous_86._MM_PERM_BCDD;
    enum _MM_PERM_BDAA = _Anonymous_86._MM_PERM_BDAA;
    enum _MM_PERM_BDAB = _Anonymous_86._MM_PERM_BDAB;
    enum _MM_PERM_BDAC = _Anonymous_86._MM_PERM_BDAC;
    enum _MM_PERM_BDAD = _Anonymous_86._MM_PERM_BDAD;
    enum _MM_PERM_BDBA = _Anonymous_86._MM_PERM_BDBA;
    enum _MM_PERM_BDBB = _Anonymous_86._MM_PERM_BDBB;
    enum _MM_PERM_BDBC = _Anonymous_86._MM_PERM_BDBC;
    enum _MM_PERM_BDBD = _Anonymous_86._MM_PERM_BDBD;
    enum _MM_PERM_BDCA = _Anonymous_86._MM_PERM_BDCA;
    enum _MM_PERM_BDCB = _Anonymous_86._MM_PERM_BDCB;
    enum _MM_PERM_BDCC = _Anonymous_86._MM_PERM_BDCC;
    enum _MM_PERM_BDCD = _Anonymous_86._MM_PERM_BDCD;
    enum _MM_PERM_BDDA = _Anonymous_86._MM_PERM_BDDA;
    enum _MM_PERM_BDDB = _Anonymous_86._MM_PERM_BDDB;
    enum _MM_PERM_BDDC = _Anonymous_86._MM_PERM_BDDC;
    enum _MM_PERM_BDDD = _Anonymous_86._MM_PERM_BDDD;
    enum _MM_PERM_CAAA = _Anonymous_86._MM_PERM_CAAA;
    enum _MM_PERM_CAAB = _Anonymous_86._MM_PERM_CAAB;
    enum _MM_PERM_CAAC = _Anonymous_86._MM_PERM_CAAC;
    enum _MM_PERM_CAAD = _Anonymous_86._MM_PERM_CAAD;
    enum _MM_PERM_CABA = _Anonymous_86._MM_PERM_CABA;
    enum _MM_PERM_CABB = _Anonymous_86._MM_PERM_CABB;
    enum _MM_PERM_CABC = _Anonymous_86._MM_PERM_CABC;
    enum _MM_PERM_CABD = _Anonymous_86._MM_PERM_CABD;
    enum _MM_PERM_CACA = _Anonymous_86._MM_PERM_CACA;
    enum _MM_PERM_CACB = _Anonymous_86._MM_PERM_CACB;
    enum _MM_PERM_CACC = _Anonymous_86._MM_PERM_CACC;
    enum _MM_PERM_CACD = _Anonymous_86._MM_PERM_CACD;
    enum _MM_PERM_CADA = _Anonymous_86._MM_PERM_CADA;
    enum _MM_PERM_CADB = _Anonymous_86._MM_PERM_CADB;
    enum _MM_PERM_CADC = _Anonymous_86._MM_PERM_CADC;
    enum _MM_PERM_CADD = _Anonymous_86._MM_PERM_CADD;
    enum _MM_PERM_CBAA = _Anonymous_86._MM_PERM_CBAA;
    enum _MM_PERM_CBAB = _Anonymous_86._MM_PERM_CBAB;
    enum _MM_PERM_CBAC = _Anonymous_86._MM_PERM_CBAC;
    enum _MM_PERM_CBAD = _Anonymous_86._MM_PERM_CBAD;
    enum _MM_PERM_CBBA = _Anonymous_86._MM_PERM_CBBA;
    enum _MM_PERM_CBBB = _Anonymous_86._MM_PERM_CBBB;
    enum _MM_PERM_CBBC = _Anonymous_86._MM_PERM_CBBC;
    enum _MM_PERM_CBBD = _Anonymous_86._MM_PERM_CBBD;
    enum _MM_PERM_CBCA = _Anonymous_86._MM_PERM_CBCA;
    enum _MM_PERM_CBCB = _Anonymous_86._MM_PERM_CBCB;
    enum _MM_PERM_CBCC = _Anonymous_86._MM_PERM_CBCC;
    enum _MM_PERM_CBCD = _Anonymous_86._MM_PERM_CBCD;
    enum _MM_PERM_CBDA = _Anonymous_86._MM_PERM_CBDA;
    enum _MM_PERM_CBDB = _Anonymous_86._MM_PERM_CBDB;
    enum _MM_PERM_CBDC = _Anonymous_86._MM_PERM_CBDC;
    enum _MM_PERM_CBDD = _Anonymous_86._MM_PERM_CBDD;
    enum _MM_PERM_CCAA = _Anonymous_86._MM_PERM_CCAA;
    enum _MM_PERM_CCAB = _Anonymous_86._MM_PERM_CCAB;
    enum _MM_PERM_CCAC = _Anonymous_86._MM_PERM_CCAC;
    enum _MM_PERM_CCAD = _Anonymous_86._MM_PERM_CCAD;
    enum _MM_PERM_CCBA = _Anonymous_86._MM_PERM_CCBA;
    enum _MM_PERM_CCBB = _Anonymous_86._MM_PERM_CCBB;
    enum _MM_PERM_CCBC = _Anonymous_86._MM_PERM_CCBC;
    enum _MM_PERM_CCBD = _Anonymous_86._MM_PERM_CCBD;
    enum _MM_PERM_CCCA = _Anonymous_86._MM_PERM_CCCA;
    enum _MM_PERM_CCCB = _Anonymous_86._MM_PERM_CCCB;
    enum _MM_PERM_CCCC = _Anonymous_86._MM_PERM_CCCC;
    enum _MM_PERM_CCCD = _Anonymous_86._MM_PERM_CCCD;
    enum _MM_PERM_CCDA = _Anonymous_86._MM_PERM_CCDA;
    enum _MM_PERM_CCDB = _Anonymous_86._MM_PERM_CCDB;
    enum _MM_PERM_CCDC = _Anonymous_86._MM_PERM_CCDC;
    enum _MM_PERM_CCDD = _Anonymous_86._MM_PERM_CCDD;
    enum _MM_PERM_CDAA = _Anonymous_86._MM_PERM_CDAA;
    enum _MM_PERM_CDAB = _Anonymous_86._MM_PERM_CDAB;
    enum _MM_PERM_CDAC = _Anonymous_86._MM_PERM_CDAC;
    enum _MM_PERM_CDAD = _Anonymous_86._MM_PERM_CDAD;
    enum _MM_PERM_CDBA = _Anonymous_86._MM_PERM_CDBA;
    enum _MM_PERM_CDBB = _Anonymous_86._MM_PERM_CDBB;
    enum _MM_PERM_CDBC = _Anonymous_86._MM_PERM_CDBC;
    enum _MM_PERM_CDBD = _Anonymous_86._MM_PERM_CDBD;
    enum _MM_PERM_CDCA = _Anonymous_86._MM_PERM_CDCA;
    enum _MM_PERM_CDCB = _Anonymous_86._MM_PERM_CDCB;
    enum _MM_PERM_CDCC = _Anonymous_86._MM_PERM_CDCC;
    enum _MM_PERM_CDCD = _Anonymous_86._MM_PERM_CDCD;
    enum _MM_PERM_CDDA = _Anonymous_86._MM_PERM_CDDA;
    enum _MM_PERM_CDDB = _Anonymous_86._MM_PERM_CDDB;
    enum _MM_PERM_CDDC = _Anonymous_86._MM_PERM_CDDC;
    enum _MM_PERM_CDDD = _Anonymous_86._MM_PERM_CDDD;
    enum _MM_PERM_DAAA = _Anonymous_86._MM_PERM_DAAA;
    enum _MM_PERM_DAAB = _Anonymous_86._MM_PERM_DAAB;
    enum _MM_PERM_DAAC = _Anonymous_86._MM_PERM_DAAC;
    enum _MM_PERM_DAAD = _Anonymous_86._MM_PERM_DAAD;
    enum _MM_PERM_DABA = _Anonymous_86._MM_PERM_DABA;
    enum _MM_PERM_DABB = _Anonymous_86._MM_PERM_DABB;
    enum _MM_PERM_DABC = _Anonymous_86._MM_PERM_DABC;
    enum _MM_PERM_DABD = _Anonymous_86._MM_PERM_DABD;
    enum _MM_PERM_DACA = _Anonymous_86._MM_PERM_DACA;
    enum _MM_PERM_DACB = _Anonymous_86._MM_PERM_DACB;
    enum _MM_PERM_DACC = _Anonymous_86._MM_PERM_DACC;
    enum _MM_PERM_DACD = _Anonymous_86._MM_PERM_DACD;
    enum _MM_PERM_DADA = _Anonymous_86._MM_PERM_DADA;
    enum _MM_PERM_DADB = _Anonymous_86._MM_PERM_DADB;
    enum _MM_PERM_DADC = _Anonymous_86._MM_PERM_DADC;
    enum _MM_PERM_DADD = _Anonymous_86._MM_PERM_DADD;
    enum _MM_PERM_DBAA = _Anonymous_86._MM_PERM_DBAA;
    enum _MM_PERM_DBAB = _Anonymous_86._MM_PERM_DBAB;
    enum _MM_PERM_DBAC = _Anonymous_86._MM_PERM_DBAC;
    enum _MM_PERM_DBAD = _Anonymous_86._MM_PERM_DBAD;
    enum _MM_PERM_DBBA = _Anonymous_86._MM_PERM_DBBA;
    enum _MM_PERM_DBBB = _Anonymous_86._MM_PERM_DBBB;
    enum _MM_PERM_DBBC = _Anonymous_86._MM_PERM_DBBC;
    enum _MM_PERM_DBBD = _Anonymous_86._MM_PERM_DBBD;
    enum _MM_PERM_DBCA = _Anonymous_86._MM_PERM_DBCA;
    enum _MM_PERM_DBCB = _Anonymous_86._MM_PERM_DBCB;
    enum _MM_PERM_DBCC = _Anonymous_86._MM_PERM_DBCC;
    enum _MM_PERM_DBCD = _Anonymous_86._MM_PERM_DBCD;
    enum _MM_PERM_DBDA = _Anonymous_86._MM_PERM_DBDA;
    enum _MM_PERM_DBDB = _Anonymous_86._MM_PERM_DBDB;
    enum _MM_PERM_DBDC = _Anonymous_86._MM_PERM_DBDC;
    enum _MM_PERM_DBDD = _Anonymous_86._MM_PERM_DBDD;
    enum _MM_PERM_DCAA = _Anonymous_86._MM_PERM_DCAA;
    enum _MM_PERM_DCAB = _Anonymous_86._MM_PERM_DCAB;
    enum _MM_PERM_DCAC = _Anonymous_86._MM_PERM_DCAC;
    enum _MM_PERM_DCAD = _Anonymous_86._MM_PERM_DCAD;
    enum _MM_PERM_DCBA = _Anonymous_86._MM_PERM_DCBA;
    enum _MM_PERM_DCBB = _Anonymous_86._MM_PERM_DCBB;
    enum _MM_PERM_DCBC = _Anonymous_86._MM_PERM_DCBC;
    enum _MM_PERM_DCBD = _Anonymous_86._MM_PERM_DCBD;
    enum _MM_PERM_DCCA = _Anonymous_86._MM_PERM_DCCA;
    enum _MM_PERM_DCCB = _Anonymous_86._MM_PERM_DCCB;
    enum _MM_PERM_DCCC = _Anonymous_86._MM_PERM_DCCC;
    enum _MM_PERM_DCCD = _Anonymous_86._MM_PERM_DCCD;
    enum _MM_PERM_DCDA = _Anonymous_86._MM_PERM_DCDA;
    enum _MM_PERM_DCDB = _Anonymous_86._MM_PERM_DCDB;
    enum _MM_PERM_DCDC = _Anonymous_86._MM_PERM_DCDC;
    enum _MM_PERM_DCDD = _Anonymous_86._MM_PERM_DCDD;
    enum _MM_PERM_DDAA = _Anonymous_86._MM_PERM_DDAA;
    enum _MM_PERM_DDAB = _Anonymous_86._MM_PERM_DDAB;
    enum _MM_PERM_DDAC = _Anonymous_86._MM_PERM_DDAC;
    enum _MM_PERM_DDAD = _Anonymous_86._MM_PERM_DDAD;
    enum _MM_PERM_DDBA = _Anonymous_86._MM_PERM_DDBA;
    enum _MM_PERM_DDBB = _Anonymous_86._MM_PERM_DDBB;
    enum _MM_PERM_DDBC = _Anonymous_86._MM_PERM_DDBC;
    enum _MM_PERM_DDBD = _Anonymous_86._MM_PERM_DDBD;
    enum _MM_PERM_DDCA = _Anonymous_86._MM_PERM_DDCA;
    enum _MM_PERM_DDCB = _Anonymous_86._MM_PERM_DDCB;
    enum _MM_PERM_DDCC = _Anonymous_86._MM_PERM_DDCC;
    enum _MM_PERM_DDCD = _Anonymous_86._MM_PERM_DDCD;
    enum _MM_PERM_DDDA = _Anonymous_86._MM_PERM_DDDA;
    enum _MM_PERM_DDDB = _Anonymous_86._MM_PERM_DDDB;
    enum _MM_PERM_DDDC = _Anonymous_86._MM_PERM_DDDC;
    enum _MM_PERM_DDDD = _Anonymous_86._MM_PERM_DDDD;
    alias _MM_MANTISSA_NORM_ENUM = _Anonymous_87;
    enum _Anonymous_87
    {
        _MM_MANT_NORM_1_2 = 0,
        _MM_MANT_NORM_p5_2 = 1,
        _MM_MANT_NORM_p5_1 = 2,
        _MM_MANT_NORM_p75_1p5 = 3,
    }
    enum _MM_MANT_NORM_1_2 = _Anonymous_87._MM_MANT_NORM_1_2;
    enum _MM_MANT_NORM_p5_2 = _Anonymous_87._MM_MANT_NORM_p5_2;
    enum _MM_MANT_NORM_p5_1 = _Anonymous_87._MM_MANT_NORM_p5_1;
    enum _MM_MANT_NORM_p75_1p5 = _Anonymous_87._MM_MANT_NORM_p75_1p5;
    alias _MM_MANTISSA_SIGN_ENUM = _Anonymous_88;
    enum _Anonymous_88
    {
        _MM_MANT_SIGN_src = 0,
        _MM_MANT_SIGN_zero = 1,
        _MM_MANT_SIGN_nan = 2,
    }
    enum _MM_MANT_SIGN_src = _Anonymous_88._MM_MANT_SIGN_src;
    enum _MM_MANT_SIGN_zero = _Anonymous_88._MM_MANT_SIGN_zero;
    enum _MM_MANT_SIGN_nan = _Anonymous_88._MM_MANT_SIGN_nan;
    static core.simd.double2 _mm_mask_expand_pd(core.simd.double2, ubyte, core.simd.double2) @nogc nothrow;
    static core.simd.float8 _mm256_maskz_div_ps(ubyte, core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.long8 _mm512_setzero_si512() @nogc nothrow;
    static core.simd.double8 _mm512_undefined_pd() @nogc nothrow;
    static core.simd.float16 _mm512_undefined() @nogc nothrow;
    static core.simd.float16 _mm512_undefined_ps() @nogc nothrow;
    static core.simd.long8 _mm512_undefined_epi32() @nogc nothrow;
    static core.simd.long8 _mm512_broadcastd_epi32(core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_mask_broadcastd_epi32(core.simd.long8, ushort, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_broadcastd_epi32(ushort, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_broadcastq_epi64(core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_mask_broadcastq_epi64(core.simd.long8, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_broadcastq_epi64(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.float16 _mm512_setzero_ps() @nogc nothrow;
    static core.simd.float8 _mm256_mask_div_ps(core.simd.float8, ubyte, core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.double8 _mm512_setzero_pd() @nogc nothrow;
    static core.simd.float16 _mm512_set1_ps(float) @nogc nothrow;
    static core.simd.double8 _mm512_set1_pd(double) @nogc nothrow;
    static core.simd.long8 _mm512_set1_epi8(char) @nogc nothrow;
    static core.simd.long8 _mm512_set1_epi16(short) @nogc nothrow;
    static core.simd.long8 _mm512_set1_epi32(int) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_set1_epi32(ushort, int) @nogc nothrow;
    static core.simd.long8 _mm512_set1_epi64(long) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_set1_epi64(ubyte, long) @nogc nothrow;
    static core.simd.float16 _mm512_broadcastss_ps(core.simd.float4) @nogc nothrow;
    static core.simd.long8 _mm512_set4_epi32(int, int, int, int) @nogc nothrow;
    static core.simd.long8 _mm512_set4_epi64(long, long, long, long) @nogc nothrow;
    static core.simd.double8 _mm512_set4_pd(double, double, double, double) @nogc nothrow;
    static core.simd.float16 _mm512_set4_ps(float, float, float, float) @nogc nothrow;
    static core.simd.float4 _mm_maskz_div_ps(ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_mask_div_ps(core.simd.float4, ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.double8 _mm512_broadcastsd_pd(core.simd.double2) @nogc nothrow;
    static core.simd.double8 _mm512_castpd256_pd512(core.simd.double4) @nogc nothrow;
    static core.simd.float16 _mm512_castps256_ps512(core.simd.float8) @nogc nothrow;
    static core.simd.double2 _mm512_castpd512_pd128(core.simd.double8) @nogc nothrow;
    static core.simd.double4 _mm512_castpd512_pd256(core.simd.double8) @nogc nothrow;
    static core.simd.float4 _mm512_castps512_ps128(core.simd.float16) @nogc nothrow;
    static core.simd.float8 _mm512_castps512_ps256(core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_castpd_ps(core.simd.double8) @nogc nothrow;
    static core.simd.long8 _mm512_castpd_si512(core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_castpd128_pd512(core.simd.double2) @nogc nothrow;
    static core.simd.double8 _mm512_castps_pd(core.simd.float16) @nogc nothrow;
    static core.simd.long8 _mm512_castps_si512(core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_castps128_ps512(core.simd.float4) @nogc nothrow;
    static core.simd.long8 _mm512_castsi128_si512(core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_castsi256_si512(core.simd.long4) @nogc nothrow;
    static core.simd.float16 _mm512_castsi512_ps(core.simd.long8) @nogc nothrow;
    static core.simd.double8 _mm512_castsi512_pd(core.simd.long8) @nogc nothrow;
    static core.simd.long2 _mm512_castsi512_si128(core.simd.long8) @nogc nothrow;
    static core.simd.long4 _mm512_castsi512_si256(core.simd.long8) @nogc nothrow;
    static ushort _mm512_int2mask(int) @nogc nothrow;
    static int _mm512_mask2int(ushort) @nogc nothrow;
    static core.simd.double8 _mm512_zextpd128_pd512(core.simd.double2) @nogc nothrow;
    static core.simd.double8 _mm512_zextpd256_pd512(core.simd.double4) @nogc nothrow;
    static core.simd.float16 _mm512_zextps128_ps512(core.simd.float4) @nogc nothrow;
    static core.simd.float16 _mm512_zextps256_ps512(core.simd.float8) @nogc nothrow;
    static core.simd.long8 _mm512_zextsi128_si512(core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_zextsi256_si512(core.simd.long4) @nogc nothrow;
    static core.simd.long8 _mm512_and_epi32(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_and_epi32(core.simd.long8, ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_and_epi32(ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_and_epi64(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_and_epi64(core.simd.long8, ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_and_epi64(ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_andnot_si512(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_andnot_epi32(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_andnot_epi32(core.simd.long8, ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_andnot_epi32(ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_andnot_epi64(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_andnot_epi64(core.simd.long8, ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_andnot_epi64(ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_or_epi32(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_or_epi32(core.simd.long8, ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_or_epi32(ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_or_epi64(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_or_epi64(core.simd.long8, ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_or_epi64(ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_xor_epi32(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_xor_epi32(core.simd.long8, ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_xor_epi32(ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_xor_epi64(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_xor_epi64(core.simd.long8, ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_xor_epi64(ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_and_si512(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_or_si512(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_xor_si512(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.double8 _mm512_add_pd(core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.float16 _mm512_add_ps(core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.double8 _mm512_mul_pd(core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.float16 _mm512_mul_ps(core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.double8 _mm512_sub_pd(core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.float16 _mm512_sub_ps(core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.long8 _mm512_add_epi64(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_add_epi64(core.simd.long8, ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_add_epi64(ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_sub_epi64(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_sub_epi64(core.simd.long8, ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_sub_epi64(ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_add_epi32(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_add_epi32(core.simd.long8, ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_add_epi32(ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_sub_epi32(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_sub_epi32(core.simd.long8, ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_sub_epi32(ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.double4 _mm256_maskz_div_pd(ubyte, core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.double8 _mm512_max_pd(core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_mask_max_pd(core.simd.double8, ubyte, core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_maskz_max_pd(ubyte, core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.double4 _mm256_mask_div_pd(core.simd.double4, ubyte, core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.double2 _mm_maskz_div_pd(ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.float16 _mm512_max_ps(core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_mask_max_ps(core.simd.float16, ushort, core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_maskz_max_ps(ushort, core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.float4 _mm_mask_max_ss(core.simd.float4, ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_maskz_max_ss(ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.double2 _mm_mask_div_pd(core.simd.double2, ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_mask_max_sd(core.simd.double2, ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_maskz_max_sd(ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.float8 _mm256_maskz_cvtepu32_ps(ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.float8 _mm256_mask_cvtepu32_ps(core.simd.float8, ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long8 _mm512_max_epi32(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_max_epi32(core.simd.long8, ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_max_epi32(ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_max_epu32(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_max_epu32(core.simd.long8, ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_max_epu32(ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_max_epi64(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_max_epi64(core.simd.long8, ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_max_epi64(ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_max_epu64(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_max_epu64(core.simd.long8, ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_max_epu64(ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.float8 _mm256_cvtepu32_ps(core.simd.long4) @nogc nothrow;
    static core.simd.double8 _mm512_min_pd(core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_mask_min_pd(core.simd.double8, ubyte, core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_maskz_min_pd(ubyte, core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.float4 _mm_maskz_cvtepu32_ps(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.float4 _mm_mask_cvtepu32_ps(core.simd.float4, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.float16 _mm512_min_ps(core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_mask_min_ps(core.simd.float16, ushort, core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_maskz_min_ps(ushort, core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.float4 _mm_mask_min_ss(core.simd.float4, ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_maskz_min_ss(ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_cvtepu32_ps(core.simd.long2) @nogc nothrow;
    static core.simd.double2 _mm_mask_min_sd(core.simd.double2, ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_maskz_min_sd(ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double4 _mm256_maskz_cvtepu32_pd(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.double4 _mm256_mask_cvtepu32_pd(core.simd.double4, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_min_epi32(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_min_epi32(core.simd.long8, ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_min_epi32(ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_min_epu32(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_min_epu32(core.simd.long8, ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_min_epu32(ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_min_epi64(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_min_epi64(core.simd.long8, ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_min_epi64(ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_min_epu64(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_min_epu64(core.simd.long8, ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_min_epu64(ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mul_epi32(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_mul_epi32(core.simd.long8, ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_mul_epi32(ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mul_epu32(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_mul_epu32(core.simd.long8, ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_mul_epu32(ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mullo_epi32(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_mullo_epi32(ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_mullo_epi32(core.simd.long8, ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mullox_epi64(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_mullox_epi64(core.simd.long8, ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.double4 _mm256_cvtepu32_pd(core.simd.long2) @nogc nothrow;
    static core.simd.double8 _mm512_sqrt_pd(core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_mask_sqrt_pd(core.simd.double8, ubyte, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_maskz_sqrt_pd(ubyte, core.simd.double8) @nogc nothrow;
    static core.simd.double2 _mm_maskz_cvtepu32_pd(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.double2 _mm_mask_cvtepu32_pd(core.simd.double2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.float16 _mm512_sqrt_ps(core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_mask_sqrt_ps(core.simd.float16, ushort, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_maskz_sqrt_ps(ushort, core.simd.float16) @nogc nothrow;
    static core.simd.double8 _mm512_rsqrt14_pd(core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_mask_rsqrt14_pd(core.simd.double8, ubyte, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_maskz_rsqrt14_pd(ubyte, core.simd.double8) @nogc nothrow;
    static core.simd.float16 _mm512_rsqrt14_ps(core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_mask_rsqrt14_ps(core.simd.float16, ushort, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_maskz_rsqrt14_ps(ushort, core.simd.float16) @nogc nothrow;
    static core.simd.float4 _mm_rsqrt14_ss(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_mask_rsqrt14_ss(core.simd.float4, ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_maskz_rsqrt14_ss(ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.double2 _mm_rsqrt14_sd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_mask_rsqrt14_sd(core.simd.double2, ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_maskz_rsqrt14_sd(ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double8 _mm512_rcp14_pd(core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_mask_rcp14_pd(core.simd.double8, ubyte, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_maskz_rcp14_pd(ubyte, core.simd.double8) @nogc nothrow;
    static core.simd.float16 _mm512_rcp14_ps(core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_mask_rcp14_ps(core.simd.float16, ushort, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_maskz_rcp14_ps(ushort, core.simd.float16) @nogc nothrow;
    static core.simd.float4 _mm_rcp14_ss(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_mask_rcp14_ss(core.simd.float4, ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_maskz_rcp14_ss(ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.double2 _mm_rcp14_sd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_mask_rcp14_sd(core.simd.double2, ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_maskz_rcp14_sd(ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.float16 _mm512_floor_ps(core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_mask_floor_ps(core.simd.float16, ushort, core.simd.float16) @nogc nothrow;
    static core.simd.double8 _mm512_floor_pd(core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_mask_floor_pd(core.simd.double8, ubyte, core.simd.double8) @nogc nothrow;
    static core.simd.float16 _mm512_mask_ceil_ps(core.simd.float16, ushort, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_ceil_ps(core.simd.float16) @nogc nothrow;
    static core.simd.double8 _mm512_ceil_pd(core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_mask_ceil_pd(core.simd.double8, ubyte, core.simd.double8) @nogc nothrow;
    static core.simd.long8 _mm512_abs_epi64(core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_abs_epi64(core.simd.long8, ubyte, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_abs_epi64(ubyte, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_abs_epi32(core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_abs_epi32(core.simd.long8, ushort, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_abs_epi32(ushort, core.simd.long8) @nogc nothrow;
    static core.simd.float4 _mm_mask_add_ss(core.simd.float4, ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_maskz_add_ss(ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.double2 _mm_cvtepu32_pd(core.simd.long2) @nogc nothrow;
    static core.simd.double2 _mm_mask_add_sd(core.simd.double2, ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_maskz_add_sd(ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_cvttps_epu32(ubyte, core.simd.float8) @nogc nothrow;
    static core.simd.long4 _mm256_mask_cvttps_epu32(core.simd.long4, ubyte, core.simd.float8) @nogc nothrow;
    static core.simd.double8 _mm512_mask_add_pd(core.simd.double8, ubyte, core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_maskz_add_pd(ubyte, core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.float16 _mm512_mask_add_ps(core.simd.float16, ushort, core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_maskz_add_ps(ushort, core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.long4 _mm256_cvttps_epu32(core.simd.float8) @nogc nothrow;
    static core.simd.long2 _mm_maskz_cvttps_epu32(ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.long2 _mm_mask_cvttps_epu32(core.simd.long2, ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_mask_sub_ss(core.simd.float4, ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_maskz_sub_ss(ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.long2 _mm_cvttps_epu32(core.simd.float4) @nogc nothrow;
    static core.simd.double2 _mm_mask_sub_sd(core.simd.double2, ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_maskz_sub_sd(ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_cvttps_epi32(ubyte, core.simd.float8) @nogc nothrow;
    static core.simd.long4 _mm256_mask_cvttps_epi32(core.simd.long4, ubyte, core.simd.float8) @nogc nothrow;
    static core.simd.double8 _mm512_mask_sub_pd(core.simd.double8, ubyte, core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_maskz_sub_pd(ubyte, core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.float16 _mm512_mask_sub_ps(core.simd.float16, ushort, core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_maskz_sub_ps(ushort, core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.long2 _mm_maskz_cvttps_epi32(ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.long2 _mm_mask_cvttps_epi32(core.simd.long2, ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.long2 _mm256_maskz_cvttpd_epu32(ubyte, core.simd.double4) @nogc nothrow;
    static core.simd.float4 _mm_mask_mul_ss(core.simd.float4, ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_maskz_mul_ss(ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.long2 _mm256_mask_cvttpd_epu32(core.simd.long2, ubyte, core.simd.double4) @nogc nothrow;
    static core.simd.double2 _mm_mask_mul_sd(core.simd.double2, ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_maskz_mul_sd(ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.long2 _mm256_cvttpd_epu32(core.simd.double4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_cvttpd_epu32(ubyte, core.simd.double2) @nogc nothrow;
    static core.simd.double8 _mm512_mask_mul_pd(core.simd.double8, ubyte, core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_maskz_mul_pd(ubyte, core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.float16 _mm512_mask_mul_ps(core.simd.float16, ushort, core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_maskz_mul_ps(ushort, core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.long2 _mm_mask_cvttpd_epu32(core.simd.long2, ubyte, core.simd.double2) @nogc nothrow;
    static core.simd.long2 _mm_cvttpd_epu32(core.simd.double2) @nogc nothrow;
    static core.simd.long2 _mm256_maskz_cvttpd_epi32(ubyte, core.simd.double4) @nogc nothrow;
    static core.simd.float4 _mm_mask_div_ss(core.simd.float4, ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_maskz_div_ss(ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.long2 _mm256_mask_cvttpd_epi32(core.simd.long2, ubyte, core.simd.double4) @nogc nothrow;
    static core.simd.double2 _mm_mask_div_sd(core.simd.double2, ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_maskz_div_sd(ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_cvttpd_epi32(ubyte, core.simd.double2) @nogc nothrow;
    static core.simd.long2 _mm_mask_cvttpd_epi32(core.simd.long2, ubyte, core.simd.double2) @nogc nothrow;
    static core.simd.double8 _mm512_div_pd(core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_mask_div_pd(core.simd.double8, ubyte, core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_maskz_div_pd(ubyte, core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.float16 _mm512_div_ps(core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_mask_div_ps(core.simd.float16, ushort, core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_maskz_div_ps(ushort, core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_cvtps_epu32(ubyte, core.simd.float8) @nogc nothrow;
    static core.simd.long4 _mm256_mask_cvtps_epu32(core.simd.long4, ubyte, core.simd.float8) @nogc nothrow;
    static core.simd.long4 _mm256_cvtps_epu32(core.simd.float8) @nogc nothrow;
    static core.simd.long2 _mm_maskz_cvtps_epu32(ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.long2 _mm_mask_cvtps_epu32(core.simd.long2, ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.long2 _mm_cvtps_epu32(core.simd.float4) @nogc nothrow;
    static core.simd.double4 _mm256_maskz_cvtps_pd(ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.double4 _mm256_mask_cvtps_pd(core.simd.double4, ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.double2 _mm_maskz_cvtps_pd(ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.double2 _mm_mask_cvtps_pd(core.simd.double2, ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_cvtps_epi32(ubyte, core.simd.float8) @nogc nothrow;
    static core.simd.long4 _mm256_mask_cvtps_epi32(core.simd.long4, ubyte, core.simd.float8) @nogc nothrow;
    static core.simd.long2 _mm_maskz_cvtps_epi32(ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.long2 _mm_mask_cvtps_epi32(core.simd.long2, ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.long2 _mm256_maskz_cvtpd_epu32(ubyte, core.simd.double4) @nogc nothrow;
    static core.simd.double8 _mm512_fmadd_pd(core.simd.double8, core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_mask_fmadd_pd(core.simd.double8, ubyte, core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_mask3_fmadd_pd(core.simd.double8, core.simd.double8, core.simd.double8, ubyte) @nogc nothrow;
    static core.simd.double8 _mm512_maskz_fmadd_pd(ubyte, core.simd.double8, core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_fmsub_pd(core.simd.double8, core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_mask_fmsub_pd(core.simd.double8, ubyte, core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_maskz_fmsub_pd(ubyte, core.simd.double8, core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_fnmadd_pd(core.simd.double8, core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_mask3_fnmadd_pd(core.simd.double8, core.simd.double8, core.simd.double8, ubyte) @nogc nothrow;
    static core.simd.double8 _mm512_maskz_fnmadd_pd(ubyte, core.simd.double8, core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_fnmsub_pd(core.simd.double8, core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_maskz_fnmsub_pd(ubyte, core.simd.double8, core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.long2 _mm256_mask_cvtpd_epu32(core.simd.long2, ubyte, core.simd.double4) @nogc nothrow;
    static core.simd.long2 _mm256_cvtpd_epu32(core.simd.double4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_cvtpd_epu32(ubyte, core.simd.double2) @nogc nothrow;
    static core.simd.long2 _mm_mask_cvtpd_epu32(core.simd.long2, ubyte, core.simd.double2) @nogc nothrow;
    static core.simd.long2 _mm_cvtpd_epu32(core.simd.double2) @nogc nothrow;
    static core.simd.float4 _mm256_maskz_cvtpd_ps(ubyte, core.simd.double4) @nogc nothrow;
    static core.simd.float16 _mm512_fmadd_ps(core.simd.float16, core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_mask_fmadd_ps(core.simd.float16, ushort, core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_mask3_fmadd_ps(core.simd.float16, core.simd.float16, core.simd.float16, ushort) @nogc nothrow;
    static core.simd.float16 _mm512_maskz_fmadd_ps(ushort, core.simd.float16, core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_fmsub_ps(core.simd.float16, core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_mask_fmsub_ps(core.simd.float16, ushort, core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_maskz_fmsub_ps(ushort, core.simd.float16, core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_fnmadd_ps(core.simd.float16, core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_mask3_fnmadd_ps(core.simd.float16, core.simd.float16, core.simd.float16, ushort) @nogc nothrow;
    static core.simd.float16 _mm512_maskz_fnmadd_ps(ushort, core.simd.float16, core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_fnmsub_ps(core.simd.float16, core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_maskz_fnmsub_ps(ushort, core.simd.float16, core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.float4 _mm256_mask_cvtpd_ps(core.simd.float4, ubyte, core.simd.double4) @nogc nothrow;
    static core.simd.float4 _mm_maskz_cvtpd_ps(ubyte, core.simd.double2) @nogc nothrow;
    static core.simd.float4 _mm_mask_cvtpd_ps(core.simd.float4, ubyte, core.simd.double2) @nogc nothrow;
    static core.simd.double8 _mm512_fmaddsub_pd(core.simd.double8, core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_mask_fmaddsub_pd(core.simd.double8, ubyte, core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_mask3_fmaddsub_pd(core.simd.double8, core.simd.double8, core.simd.double8, ubyte) @nogc nothrow;
    static core.simd.double8 _mm512_maskz_fmaddsub_pd(ubyte, core.simd.double8, core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_fmsubadd_pd(core.simd.double8, core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_mask_fmsubadd_pd(core.simd.double8, ubyte, core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_maskz_fmsubadd_pd(ubyte, core.simd.double8, core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.long2 _mm256_maskz_cvtpd_epi32(ubyte, core.simd.double4) @nogc nothrow;
    static core.simd.long2 _mm256_mask_cvtpd_epi32(core.simd.long2, ubyte, core.simd.double4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_cvtpd_epi32(ubyte, core.simd.double2) @nogc nothrow;
    static core.simd.long2 _mm_mask_cvtpd_epi32(core.simd.long2, ubyte, core.simd.double2) @nogc nothrow;
    static core.simd.float16 _mm512_fmaddsub_ps(core.simd.float16, core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_mask_fmaddsub_ps(core.simd.float16, ushort, core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_mask3_fmaddsub_ps(core.simd.float16, core.simd.float16, core.simd.float16, ushort) @nogc nothrow;
    static core.simd.float16 _mm512_maskz_fmaddsub_ps(ushort, core.simd.float16, core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_fmsubadd_ps(core.simd.float16, core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_mask_fmsubadd_ps(core.simd.float16, ushort, core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_maskz_fmsubadd_ps(ushort, core.simd.float16, core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.double8 _mm512_mask3_fmsub_pd(core.simd.double8, core.simd.double8, core.simd.double8, ubyte) @nogc nothrow;
    static core.simd.float8 _mm256_maskz_cvtepi32_ps(ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.float16 _mm512_mask3_fmsub_ps(core.simd.float16, core.simd.float16, core.simd.float16, ushort) @nogc nothrow;
    static core.simd.double8 _mm512_mask3_fmsubadd_pd(core.simd.double8, core.simd.double8, core.simd.double8, ubyte) @nogc nothrow;
    static core.simd.float8 _mm256_mask_cvtepi32_ps(core.simd.float8, ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.float16 _mm512_mask3_fmsubadd_ps(core.simd.float16, core.simd.float16, core.simd.float16, ushort) @nogc nothrow;
    static core.simd.double8 _mm512_mask_fnmadd_pd(core.simd.double8, ubyte, core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.float4 _mm_maskz_cvtepi32_ps(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.float16 _mm512_mask_fnmadd_ps(core.simd.float16, ushort, core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.float4 _mm_mask_cvtepi32_ps(core.simd.float4, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.double8 _mm512_mask_fnmsub_pd(core.simd.double8, ubyte, core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_mask3_fnmsub_pd(core.simd.double8, core.simd.double8, core.simd.double8, ubyte) @nogc nothrow;
    static core.simd.double4 _mm256_maskz_cvtepi32_pd(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.float16 _mm512_mask_fnmsub_ps(core.simd.float16, ushort, core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_mask3_fnmsub_ps(core.simd.float16, core.simd.float16, core.simd.float16, ushort) @nogc nothrow;
    static core.simd.long8 _mm512_permutex2var_epi32(core.simd.long8, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_permutex2var_epi32(core.simd.long8, ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask2_permutex2var_epi32(core.simd.long8, core.simd.long8, ushort, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_permutex2var_epi32(ushort, core.simd.long8, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_permutex2var_epi64(core.simd.long8, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_permutex2var_epi64(core.simd.long8, ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask2_permutex2var_epi64(core.simd.long8, core.simd.long8, ubyte, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_permutex2var_epi64(ubyte, core.simd.long8, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.double4 _mm256_mask_cvtepi32_pd(core.simd.double4, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.double2 _mm_maskz_cvtepi32_pd(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.double2 _mm_mask_cvtepi32_pd(core.simd.double2, ubyte, core.simd.long2) @nogc nothrow;
    static void _mm256_mask_compressstoreu_epi32(void*, ubyte, core.simd.long4) @nogc nothrow;
    static void _mm_mask_compressstoreu_epi32(void*, ubyte, core.simd.long2) @nogc nothrow;
    static void _mm256_mask_compressstoreu_ps(void*, ubyte, core.simd.float8) @nogc nothrow;
    static core.simd.double8 _mm512_mask_blend_pd(ubyte, core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.float16 _mm512_mask_blend_ps(ushort, core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.long8 _mm512_mask_blend_epi64(ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_blend_epi32(ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static void _mm_mask_compressstoreu_ps(void*, ubyte, core.simd.float4) @nogc nothrow;
    static void _mm256_mask_compressstoreu_epi64(void*, ubyte, core.simd.long4) @nogc nothrow;
    static void _mm_mask_compressstoreu_epi64(void*, ubyte, core.simd.long2) @nogc nothrow;
    static void _mm256_mask_compressstoreu_pd(void*, ubyte, core.simd.double4) @nogc nothrow;
    static void _mm_mask_compressstoreu_pd(void*, ubyte, core.simd.double2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_compress_epi32(ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_compress_epi32(core.simd.long4, ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_compress_epi32(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_compress_epi32(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.float8 _mm256_maskz_compress_ps(ubyte, core.simd.float8) @nogc nothrow;
    static core.simd.float8 _mm256_mask_compress_ps(core.simd.float8, ubyte, core.simd.float8) @nogc nothrow;
    static core.simd.float4 _mm_maskz_compress_ps(ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_mask_compress_ps(core.simd.float4, ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_compress_epi64(ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_compress_epi64(core.simd.long4, ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_compress_epi64(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_compress_epi64(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.double4 _mm256_maskz_compress_pd(ubyte, core.simd.double4) @nogc nothrow;
    static core.simd.double4 _mm256_mask_compress_pd(core.simd.double4, ubyte, core.simd.double4) @nogc nothrow;
    static core.simd.double2 _mm_maskz_compress_pd(ubyte, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_mask_compress_pd(core.simd.double2, ubyte, core.simd.double2) @nogc nothrow;
    static core.simd.long8 _mm512_cvttps_epu32(core.simd.float16) @nogc nothrow;
    static core.simd.long8 _mm512_mask_cvttps_epu32(core.simd.long8, ushort, core.simd.float16) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_cvttps_epu32(ushort, core.simd.float16) @nogc nothrow;
    static core.simd.long4 _mm256_mask_blend_epi64(ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_mask_blend_epi64(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.float8 _mm256_mask_blend_ps(ubyte, core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.float16 _mm512_cvtepu32_ps(core.simd.long8) @nogc nothrow;
    static core.simd.float16 _mm512_mask_cvtepu32_ps(core.simd.float16, ushort, core.simd.long8) @nogc nothrow;
    static core.simd.float16 _mm512_maskz_cvtepu32_ps(ushort, core.simd.long8) @nogc nothrow;
    static core.simd.double8 _mm512_cvtepi32_pd(core.simd.long4) @nogc nothrow;
    static core.simd.double8 _mm512_mask_cvtepi32_pd(core.simd.double8, ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.double8 _mm512_maskz_cvtepi32_pd(ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.double8 _mm512_cvtepi32lo_pd(core.simd.long8) @nogc nothrow;
    static core.simd.double8 _mm512_mask_cvtepi32lo_pd(core.simd.double8, ubyte, core.simd.long8) @nogc nothrow;
    static core.simd.float16 _mm512_cvtepi32_ps(core.simd.long8) @nogc nothrow;
    static core.simd.float16 _mm512_mask_cvtepi32_ps(core.simd.float16, ushort, core.simd.long8) @nogc nothrow;
    static core.simd.float16 _mm512_maskz_cvtepi32_ps(ushort, core.simd.long8) @nogc nothrow;
    static core.simd.double8 _mm512_cvtepu32_pd(core.simd.long4) @nogc nothrow;
    static core.simd.double8 _mm512_mask_cvtepu32_pd(core.simd.double8, ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.double8 _mm512_maskz_cvtepu32_pd(ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.double8 _mm512_cvtepu32lo_pd(core.simd.long8) @nogc nothrow;
    static core.simd.double8 _mm512_mask_cvtepu32lo_pd(core.simd.double8, ubyte, core.simd.long8) @nogc nothrow;
    static core.simd.float4 _mm_mask_blend_ps(ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.double4 _mm256_mask_blend_pd(ubyte, core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.float8 _mm512_cvtpd_ps(core.simd.double8) @nogc nothrow;
    static core.simd.float8 _mm512_mask_cvtpd_ps(core.simd.float8, ubyte, core.simd.double8) @nogc nothrow;
    static core.simd.float8 _mm512_maskz_cvtpd_ps(ubyte, core.simd.double8) @nogc nothrow;
    static core.simd.float16 _mm512_cvtpd_pslo(core.simd.double8) @nogc nothrow;
    static core.simd.float16 _mm512_mask_cvtpd_pslo(core.simd.float16, ubyte, core.simd.double8) @nogc nothrow;
    static core.simd.double2 _mm_mask_blend_pd(ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_blend_epi32(ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_mask_blend_epi32(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.float8 _mm256_maskz_add_ps(ubyte, core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.float16 _mm512_cvtph_ps(core.simd.long4) @nogc nothrow;
    static core.simd.float16 _mm512_mask_cvtph_ps(core.simd.float16, ushort, core.simd.long4) @nogc nothrow;
    static core.simd.float16 _mm512_maskz_cvtph_ps(ushort, core.simd.long4) @nogc nothrow;
    static core.simd.float8 _mm256_mask_add_ps(core.simd.float8, ubyte, core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.float4 _mm_maskz_add_ps(ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.long4 _mm512_cvttpd_epi32(core.simd.double8) @nogc nothrow;
    static core.simd.long4 _mm512_mask_cvttpd_epi32(core.simd.long4, ubyte, core.simd.double8) @nogc nothrow;
    static core.simd.long4 _mm512_maskz_cvttpd_epi32(ubyte, core.simd.double8) @nogc nothrow;
    static core.simd.float4 _mm_mask_add_ps(core.simd.float4, ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.long8 _mm512_cvttps_epi32(core.simd.float16) @nogc nothrow;
    static core.simd.long8 _mm512_mask_cvttps_epi32(core.simd.long8, ushort, core.simd.float16) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_cvttps_epi32(ushort, core.simd.float16) @nogc nothrow;
    static core.simd.double4 _mm256_maskz_add_pd(ubyte, core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.double4 _mm256_mask_add_pd(core.simd.double4, ubyte, core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.long8 _mm512_cvtps_epi32(core.simd.float16) @nogc nothrow;
    static core.simd.long8 _mm512_mask_cvtps_epi32(core.simd.long8, ushort, core.simd.float16) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_cvtps_epi32(ushort, core.simd.float16) @nogc nothrow;
    static core.simd.double2 _mm_maskz_add_pd(ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.long4 _mm512_cvtpd_epi32(core.simd.double8) @nogc nothrow;
    static core.simd.long4 _mm512_mask_cvtpd_epi32(core.simd.long4, ubyte, core.simd.double8) @nogc nothrow;
    static core.simd.long4 _mm512_maskz_cvtpd_epi32(ubyte, core.simd.double8) @nogc nothrow;
    static core.simd.double2 _mm_mask_add_pd(core.simd.double2, ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.float8 _mm256_mask3_fnmsub_ps(core.simd.float8, core.simd.float8, core.simd.float8, ubyte) @nogc nothrow;
    static core.simd.long8 _mm512_cvtps_epu32(core.simd.float16) @nogc nothrow;
    static core.simd.long8 _mm512_mask_cvtps_epu32(core.simd.long8, ushort, core.simd.float16) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_cvtps_epu32(ushort, core.simd.float16) @nogc nothrow;
    static core.simd.float8 _mm256_mask_fnmsub_ps(core.simd.float8, ubyte, core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.long4 _mm512_cvtpd_epu32(core.simd.double8) @nogc nothrow;
    static core.simd.long4 _mm512_mask_cvtpd_epu32(core.simd.long4, ubyte, core.simd.double8) @nogc nothrow;
    static core.simd.long4 _mm512_maskz_cvtpd_epu32(ubyte, core.simd.double8) @nogc nothrow;
    static double _mm512_cvtsd_f64(core.simd.double8) @nogc nothrow;
    static float _mm512_cvtss_f32(core.simd.float16) @nogc nothrow;
    static core.simd.double8 _mm512_unpackhi_pd(core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_mask_unpackhi_pd(core.simd.double8, ubyte, core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_maskz_unpackhi_pd(ubyte, core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_unpacklo_pd(core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_mask_unpacklo_pd(core.simd.double8, ubyte, core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_maskz_unpacklo_pd(ubyte, core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.float16 _mm512_unpackhi_ps(core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_mask_unpackhi_ps(core.simd.float16, ushort, core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_maskz_unpackhi_ps(ushort, core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_unpacklo_ps(core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_mask_unpacklo_ps(core.simd.float16, ushort, core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_maskz_unpacklo_ps(ushort, core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.long8 _mm512_unpackhi_epi32(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_unpackhi_epi32(core.simd.long8, ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_unpackhi_epi32(ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_unpacklo_epi32(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_unpacklo_epi32(core.simd.long8, ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_unpacklo_epi32(ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_unpackhi_epi64(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_unpackhi_epi64(core.simd.long8, ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_unpackhi_epi64(ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_unpacklo_epi64(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_unpacklo_epi64(core.simd.long8, ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_unpacklo_epi64(ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_loadu_si512(const(void)*) @nogc nothrow;
    static core.simd.long8 _mm512_loadu_epi32(const(void)*) @nogc nothrow;
    static core.simd.long8 _mm512_mask_loadu_epi32(core.simd.long8, ushort, const(void)*) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_loadu_epi32(ushort, const(void)*) @nogc nothrow;
    static core.simd.long8 _mm512_loadu_epi64(const(void)*) @nogc nothrow;
    static core.simd.long8 _mm512_mask_loadu_epi64(core.simd.long8, ubyte, const(void)*) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_loadu_epi64(ubyte, const(void)*) @nogc nothrow;
    static core.simd.float16 _mm512_mask_loadu_ps(core.simd.float16, ushort, const(void)*) @nogc nothrow;
    static core.simd.float16 _mm512_maskz_loadu_ps(ushort, const(void)*) @nogc nothrow;
    static core.simd.double8 _mm512_mask_loadu_pd(core.simd.double8, ubyte, const(void)*) @nogc nothrow;
    static core.simd.double8 _mm512_maskz_loadu_pd(ubyte, const(void)*) @nogc nothrow;
    static core.simd.double8 _mm512_loadu_pd(const(void)*) @nogc nothrow;
    static core.simd.float16 _mm512_loadu_ps(const(void)*) @nogc nothrow;
    static core.simd.float16 _mm512_load_ps(const(void)*) @nogc nothrow;
    static core.simd.float16 _mm512_mask_load_ps(core.simd.float16, ushort, const(void)*) @nogc nothrow;
    static core.simd.float16 _mm512_maskz_load_ps(ushort, const(void)*) @nogc nothrow;
    static core.simd.double8 _mm512_load_pd(const(void)*) @nogc nothrow;
    static core.simd.double8 _mm512_mask_load_pd(core.simd.double8, ubyte, const(void)*) @nogc nothrow;
    static core.simd.double8 _mm512_maskz_load_pd(ubyte, const(void)*) @nogc nothrow;
    static core.simd.long8 _mm512_load_si512(const(void)*) @nogc nothrow;
    static core.simd.long8 _mm512_load_epi32(const(void)*) @nogc nothrow;
    static core.simd.long8 _mm512_load_epi64(const(void)*) @nogc nothrow;
    static void _mm512_storeu_epi64(void*, core.simd.long8) @nogc nothrow;
    static void _mm512_mask_storeu_epi64(void*, ubyte, core.simd.long8) @nogc nothrow;
    static void _mm512_storeu_si512(void*, core.simd.long8) @nogc nothrow;
    static void _mm512_storeu_epi32(void*, core.simd.long8) @nogc nothrow;
    static void _mm512_mask_storeu_epi32(void*, ushort, core.simd.long8) @nogc nothrow;
    static void _mm512_mask_storeu_pd(void*, ubyte, core.simd.double8) @nogc nothrow;
    static void _mm512_storeu_pd(void*, core.simd.double8) @nogc nothrow;
    static void _mm512_mask_storeu_ps(void*, ushort, core.simd.float16) @nogc nothrow;
    static void _mm512_storeu_ps(void*, core.simd.float16) @nogc nothrow;
    static void _mm512_mask_store_pd(void*, ubyte, core.simd.double8) @nogc nothrow;
    static void _mm512_store_pd(void*, core.simd.double8) @nogc nothrow;
    static void _mm512_mask_store_ps(void*, ushort, core.simd.float16) @nogc nothrow;
    static void _mm512_store_ps(void*, core.simd.float16) @nogc nothrow;
    static void _mm512_store_si512(void*, core.simd.long8) @nogc nothrow;
    static void _mm512_store_epi32(void*, core.simd.long8) @nogc nothrow;
    static void _mm512_store_epi64(void*, core.simd.long8) @nogc nothrow;
    static ushort _mm512_knot(ushort) @nogc nothrow;
    static core.simd.float4 _mm_mask3_fnmsub_ps(core.simd.float4, core.simd.float4, core.simd.float4, ubyte) @nogc nothrow;
    static core.simd.float4 _mm_mask_fnmsub_ps(core.simd.float4, ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.double4 _mm256_mask3_fnmsub_pd(core.simd.double4, core.simd.double4, core.simd.double4, ubyte) @nogc nothrow;
    static core.simd.double4 _mm256_mask_fnmsub_pd(core.simd.double4, ubyte, core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.double2 _mm_mask3_fnmsub_pd(core.simd.double2, core.simd.double2, core.simd.double2, ubyte) @nogc nothrow;
    static core.simd.double2 _mm_mask_fnmsub_pd(core.simd.double2, ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.float8 _mm256_mask_fnmadd_ps(core.simd.float8, ubyte, core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.float4 _mm_mask_fnmadd_ps(core.simd.float4, ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.double4 _mm256_mask_fnmadd_pd(core.simd.double4, ubyte, core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.double2 _mm_mask_fnmadd_pd(core.simd.double2, ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.float8 _mm256_mask3_fmsubadd_ps(core.simd.float8, core.simd.float8, core.simd.float8, ubyte) @nogc nothrow;
    static core.simd.float4 _mm_mask3_fmsubadd_ps(core.simd.float4, core.simd.float4, core.simd.float4, ubyte) @nogc nothrow;
    static core.simd.double4 _mm256_mask3_fmsubadd_pd(core.simd.double4, core.simd.double4, core.simd.double4, ubyte) @nogc nothrow;
    static core.simd.double2 _mm_mask3_fmsubadd_pd(core.simd.double2, core.simd.double2, core.simd.double2, ubyte) @nogc nothrow;
    static core.simd.float8 _mm256_mask3_fmsub_ps(core.simd.float8, core.simd.float8, core.simd.float8, ubyte) @nogc nothrow;
    static core.simd.float4 _mm_mask3_fmsub_ps(core.simd.float4, core.simd.float4, core.simd.float4, ubyte) @nogc nothrow;
    static core.simd.double4 _mm256_mask3_fmsub_pd(core.simd.double4, core.simd.double4, core.simd.double4, ubyte) @nogc nothrow;
    static core.simd.double2 _mm_mask3_fmsub_pd(core.simd.double2, core.simd.double2, core.simd.double2, ubyte) @nogc nothrow;
    static core.simd.float8 _mm256_maskz_fmsubadd_ps(ubyte, core.simd.float8, core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.float8 _mm256_mask_fmsubadd_ps(core.simd.float8, ubyte, core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.float8 _mm256_maskz_fmaddsub_ps(ubyte, core.simd.float8, core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.float8 _mm256_mask3_fmaddsub_ps(core.simd.float8, core.simd.float8, core.simd.float8, ubyte) @nogc nothrow;
    static core.simd.float8 _mm256_mask_fmaddsub_ps(core.simd.float8, ubyte, core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.float4 _mm_maskz_fmsubadd_ps(ubyte, core.simd.float4, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.long8 _mm512_cvtepi8_epi32(core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_mask_cvtepi8_epi32(core.simd.long8, ushort, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_cvtepi8_epi32(ushort, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_cvtepi8_epi64(core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_mask_cvtepi8_epi64(core.simd.long8, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_cvtepi8_epi64(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_cvtepi32_epi64(core.simd.long4) @nogc nothrow;
    static core.simd.long8 _mm512_mask_cvtepi32_epi64(core.simd.long8, ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_cvtepi32_epi64(ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long8 _mm512_cvtepi16_epi32(core.simd.long4) @nogc nothrow;
    static core.simd.long8 _mm512_mask_cvtepi16_epi32(core.simd.long8, ushort, core.simd.long4) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_cvtepi16_epi32(ushort, core.simd.long4) @nogc nothrow;
    static core.simd.long8 _mm512_cvtepi16_epi64(core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_mask_cvtepi16_epi64(core.simd.long8, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_cvtepi16_epi64(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_cvtepu8_epi32(core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_mask_cvtepu8_epi32(core.simd.long8, ushort, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_cvtepu8_epi32(ushort, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_cvtepu8_epi64(core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_mask_cvtepu8_epi64(core.simd.long8, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_cvtepu8_epi64(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_cvtepu32_epi64(core.simd.long4) @nogc nothrow;
    static core.simd.long8 _mm512_mask_cvtepu32_epi64(core.simd.long8, ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_cvtepu32_epi64(ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long8 _mm512_cvtepu16_epi32(core.simd.long4) @nogc nothrow;
    static core.simd.long8 _mm512_mask_cvtepu16_epi32(core.simd.long8, ushort, core.simd.long4) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_cvtepu16_epi32(ushort, core.simd.long4) @nogc nothrow;
    static core.simd.long8 _mm512_cvtepu16_epi64(core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_mask_cvtepu16_epi64(core.simd.long8, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_cvtepu16_epi64(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_rorv_epi32(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_rorv_epi32(core.simd.long8, ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_rorv_epi32(ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_rorv_epi64(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_rorv_epi64(core.simd.long8, ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_rorv_epi64(ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.float4 _mm_mask_fmsubadd_ps(core.simd.float4, ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_maskz_fmaddsub_ps(ubyte, core.simd.float4, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_mask3_fmaddsub_ps(core.simd.float4, core.simd.float4, core.simd.float4, ubyte) @nogc nothrow;
    static core.simd.float4 _mm_mask_fmaddsub_ps(core.simd.float4, ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.double4 _mm256_maskz_fmsubadd_pd(ubyte, core.simd.double4, core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.double4 _mm256_mask_fmsubadd_pd(core.simd.double4, ubyte, core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.double4 _mm256_maskz_fmaddsub_pd(ubyte, core.simd.double4, core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.long8 _mm512_rolv_epi32(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_rolv_epi32(core.simd.long8, ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_rolv_epi32(ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_rolv_epi64(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_rolv_epi64(core.simd.long8, ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_rolv_epi64(ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.double4 _mm256_mask3_fmaddsub_pd(core.simd.double4, core.simd.double4, core.simd.double4, ubyte) @nogc nothrow;
    static core.simd.double4 _mm256_mask_fmaddsub_pd(core.simd.double4, ubyte, core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.double2 _mm_maskz_fmsubadd_pd(ubyte, core.simd.double2, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.long8 _mm512_slli_epi32(core.simd.long8, int) @nogc nothrow;
    static core.simd.long8 _mm512_mask_slli_epi32(core.simd.long8, ushort, core.simd.long8, int) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_slli_epi32(ushort, core.simd.long8, int) @nogc nothrow;
    static core.simd.long8 _mm512_slli_epi64(core.simd.long8, int) @nogc nothrow;
    static core.simd.long8 _mm512_mask_slli_epi64(core.simd.long8, ubyte, core.simd.long8, int) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_slli_epi64(ubyte, core.simd.long8, int) @nogc nothrow;
    static core.simd.long8 _mm512_srli_epi32(core.simd.long8, int) @nogc nothrow;
    static core.simd.long8 _mm512_mask_srli_epi32(core.simd.long8, ushort, core.simd.long8, int) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_srli_epi32(ushort, core.simd.long8, int) @nogc nothrow;
    static core.simd.long8 _mm512_srli_epi64(core.simd.long8, int) @nogc nothrow;
    static core.simd.long8 _mm512_mask_srli_epi64(core.simd.long8, ubyte, core.simd.long8, int) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_srli_epi64(ubyte, core.simd.long8, int) @nogc nothrow;
    static core.simd.long8 _mm512_mask_load_epi32(core.simd.long8, ushort, const(void)*) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_load_epi32(ushort, const(void)*) @nogc nothrow;
    static void _mm512_mask_store_epi32(void*, ushort, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_mov_epi32(core.simd.long8, ushort, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_mov_epi32(ushort, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_mov_epi64(core.simd.long8, ubyte, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_mov_epi64(ubyte, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_load_epi64(core.simd.long8, ubyte, const(void)*) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_load_epi64(ubyte, const(void)*) @nogc nothrow;
    static void _mm512_mask_store_epi64(void*, ubyte, core.simd.long8) @nogc nothrow;
    static core.simd.double8 _mm512_movedup_pd(core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_mask_movedup_pd(core.simd.double8, ubyte, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_maskz_movedup_pd(ubyte, core.simd.double8) @nogc nothrow;
    static core.simd.double2 _mm_mask_fmsubadd_pd(core.simd.double2, ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_maskz_fmaddsub_pd(ubyte, core.simd.double2, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_mask3_fmaddsub_pd(core.simd.double2, core.simd.double2, core.simd.double2, ubyte) @nogc nothrow;
    static core.simd.double2 _mm_mask_fmaddsub_pd(core.simd.double2, ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.float8 _mm256_maskz_fnmsub_ps(ubyte, core.simd.float8, core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.float8 _mm256_maskz_fnmadd_ps(ubyte, core.simd.float8, core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.float8 _mm256_mask3_fnmadd_ps(core.simd.float8, core.simd.float8, core.simd.float8, ubyte) @nogc nothrow;
    static core.simd.float8 _mm256_maskz_fmsub_ps(ubyte, core.simd.float8, core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.float8 _mm256_mask_fmsub_ps(core.simd.float8, ubyte, core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.float8 _mm256_maskz_fmadd_ps(ubyte, core.simd.float8, core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.float8 _mm256_mask3_fmadd_ps(core.simd.float8, core.simd.float8, core.simd.float8, ubyte) @nogc nothrow;
    static core.simd.float8 _mm256_mask_fmadd_ps(core.simd.float8, ubyte, core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.float4 _mm_maskz_fnmsub_ps(ubyte, core.simd.float4, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.double2 _mm_getexp_sd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_mask_getexp_sd(core.simd.double2, ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_maskz_getexp_sd(ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.float4 _mm_maskz_fnmadd_ps(ubyte, core.simd.float4, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_getexp_ss(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_mask_getexp_ss(core.simd.float4, ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_mask3_fnmadd_ps(core.simd.float4, core.simd.float4, core.simd.float4, ubyte) @nogc nothrow;
    static core.simd.float4 _mm_maskz_getexp_ss(ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_maskz_fmsub_ps(ubyte, core.simd.float4, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_mask_fmsub_ps(core.simd.float4, ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_maskz_fmadd_ps(ubyte, core.simd.float4, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_mask3_fmadd_ps(core.simd.float4, core.simd.float4, core.simd.float4, ubyte) @nogc nothrow;
    static core.simd.float4 _mm_mask_fmadd_ps(core.simd.float4, ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.double4 _mm256_maskz_fnmsub_pd(ubyte, core.simd.double4, core.simd.double4, core.simd.double4) @nogc nothrow;
    static ushort _mm512_kmov(ushort) @nogc nothrow;
    static core.simd.double4 _mm256_maskz_fnmadd_pd(ubyte, core.simd.double4, core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.double4 _mm256_mask3_fnmadd_pd(core.simd.double4, core.simd.double4, core.simd.double4, ubyte) @nogc nothrow;
    static core.simd.long8 _mm512_sll_epi32(core.simd.long8, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_mask_sll_epi32(core.simd.long8, ushort, core.simd.long8, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_sll_epi32(ushort, core.simd.long8, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_sll_epi64(core.simd.long8, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_mask_sll_epi64(core.simd.long8, ubyte, core.simd.long8, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_sll_epi64(ubyte, core.simd.long8, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_sllv_epi32(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_sllv_epi32(core.simd.long8, ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_sllv_epi32(ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_sllv_epi64(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_sllv_epi64(core.simd.long8, ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_sllv_epi64(ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_sra_epi32(core.simd.long8, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_mask_sra_epi32(core.simd.long8, ushort, core.simd.long8, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_sra_epi32(ushort, core.simd.long8, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_sra_epi64(core.simd.long8, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_mask_sra_epi64(core.simd.long8, ubyte, core.simd.long8, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_sra_epi64(ubyte, core.simd.long8, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_srav_epi32(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_srav_epi32(core.simd.long8, ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_srav_epi32(ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_srav_epi64(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_srav_epi64(core.simd.long8, ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_srav_epi64(ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_srl_epi32(core.simd.long8, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_mask_srl_epi32(core.simd.long8, ushort, core.simd.long8, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_srl_epi32(ushort, core.simd.long8, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_srl_epi64(core.simd.long8, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_mask_srl_epi64(core.simd.long8, ubyte, core.simd.long8, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_srl_epi64(ubyte, core.simd.long8, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_srlv_epi32(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_srlv_epi32(core.simd.long8, ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_srlv_epi32(ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_srlv_epi64(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_srlv_epi64(core.simd.long8, ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_srlv_epi64(ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.double4 _mm256_maskz_fmsub_pd(ubyte, core.simd.double4, core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.double4 _mm256_mask_fmsub_pd(core.simd.double4, ubyte, core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.double4 _mm256_maskz_fmadd_pd(ubyte, core.simd.double4, core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.double4 _mm256_mask3_fmadd_pd(core.simd.double4, core.simd.double4, core.simd.double4, ubyte) @nogc nothrow;
    static core.simd.double4 _mm256_mask_fmadd_pd(core.simd.double4, ubyte, core.simd.double4, core.simd.double4) @nogc nothrow;
    static uint _mm_cvtsd_u32(core.simd.double2) @nogc nothrow;
    static ulong _mm_cvtsd_u64(core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_maskz_fnmsub_pd(ubyte, core.simd.double2, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_maskz_fnmadd_pd(ubyte, core.simd.double2, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_mask3_fnmadd_pd(core.simd.double2, core.simd.double2, core.simd.double2, ubyte) @nogc nothrow;
    static uint _mm_cvtss_u32(core.simd.float4) @nogc nothrow;
    static ulong _mm_cvtss_u64(core.simd.float4) @nogc nothrow;
    static core.simd.double2 _mm_maskz_fmsub_pd(ubyte, core.simd.double2, core.simd.double2, core.simd.double2) @nogc nothrow;
    static int _mm_cvttsd_i32(core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_mask_fmsub_pd(core.simd.double2, ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static long _mm_cvttsd_i64(core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_maskz_fmadd_pd(ubyte, core.simd.double2, core.simd.double2, core.simd.double2) @nogc nothrow;
    static uint _mm_cvttsd_u32(core.simd.double2) @nogc nothrow;
    static ulong _mm_cvttsd_u64(core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_mask3_fmadd_pd(core.simd.double2, core.simd.double2, core.simd.double2, ubyte) @nogc nothrow;
    static int _mm_cvttss_i32(core.simd.float4) @nogc nothrow;
    static core.simd.double2 _mm_mask_fmadd_pd(core.simd.double2, ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static long _mm_cvttss_i64(core.simd.float4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_xor_epi64(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static uint _mm_cvttss_u32(core.simd.float4) @nogc nothrow;
    static ulong _mm_cvttss_u64(core.simd.float4) @nogc nothrow;
    static core.simd.long2 _mm_mask_xor_epi64(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_xor_epi64(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_xor_epi64(ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.double8 _mm512_permutevar_pd(core.simd.double8, core.simd.long8) @nogc nothrow;
    static core.simd.double8 _mm512_mask_permutevar_pd(core.simd.double8, ubyte, core.simd.double8, core.simd.long8) @nogc nothrow;
    static core.simd.double8 _mm512_maskz_permutevar_pd(ubyte, core.simd.double8, core.simd.long8) @nogc nothrow;
    static core.simd.float16 _mm512_permutevar_ps(core.simd.float16, core.simd.long8) @nogc nothrow;
    static core.simd.float16 _mm512_mask_permutevar_ps(core.simd.float16, ushort, core.simd.float16, core.simd.long8) @nogc nothrow;
    static core.simd.float16 _mm512_maskz_permutevar_ps(ushort, core.simd.float16, core.simd.long8) @nogc nothrow;
    static core.simd.double8 _mm512_permutex2var_pd(core.simd.double8, core.simd.long8, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_mask_permutex2var_pd(core.simd.double8, ubyte, core.simd.long8, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_mask2_permutex2var_pd(core.simd.double8, core.simd.long8, ubyte, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_maskz_permutex2var_pd(ubyte, core.simd.double8, core.simd.long8, core.simd.double8) @nogc nothrow;
    static core.simd.float16 _mm512_permutex2var_ps(core.simd.float16, core.simd.long8, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_mask_permutex2var_ps(core.simd.float16, ushort, core.simd.long8, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_mask2_permutex2var_ps(core.simd.float16, core.simd.long8, ushort, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_maskz_permutex2var_ps(ushort, core.simd.float16, core.simd.long8, core.simd.float16) @nogc nothrow;
    static core.simd.long4 _mm256_mask_xor_epi64(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_xor_epi64(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm512_cvttpd_epu32(core.simd.double8) @nogc nothrow;
    static core.simd.long4 _mm512_mask_cvttpd_epu32(core.simd.long4, ubyte, core.simd.double8) @nogc nothrow;
    static core.simd.long4 _mm512_maskz_cvttpd_epu32(ubyte, core.simd.double8) @nogc nothrow;
    static core.simd.long2 _mm_maskz_or_epi64(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_or_epi64(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_or_epi64(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_or_epi64(ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_or_epi64(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_or_epi64(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_andnot_epi64(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.double8 _mm512_scalef_pd(core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_mask_scalef_pd(core.simd.double8, ubyte, core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_maskz_scalef_pd(ubyte, core.simd.double8, core.simd.double8) @nogc nothrow;
    static core.simd.long2 _mm_mask_andnot_epi64(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_andnot_epi64(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.float16 _mm512_scalef_ps(core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_mask_scalef_ps(core.simd.float16, ushort, core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_maskz_scalef_ps(ushort, core.simd.float16, core.simd.float16) @nogc nothrow;
    static core.simd.double2 _mm_scalef_sd(core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_mask_scalef_sd(core.simd.double2, ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_andnot_epi64(ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.double2 _mm_maskz_scalef_sd(ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_andnot_epi64(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.float4 _mm_scalef_ss(core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_mask_scalef_ss(core.simd.float4, ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_maskz_scalef_ss(ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.long4 _mm256_andnot_epi64(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long8 _mm512_srai_epi32(core.simd.long8, int) @nogc nothrow;
    static core.simd.long8 _mm512_mask_srai_epi32(core.simd.long8, ushort, core.simd.long8, int) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_srai_epi32(ushort, core.simd.long8, int) @nogc nothrow;
    static core.simd.long8 _mm512_srai_epi64(core.simd.long8, int) @nogc nothrow;
    static core.simd.long8 _mm512_mask_srai_epi64(core.simd.long8, ubyte, core.simd.long8, int) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_srai_epi64(ubyte, core.simd.long8, int) @nogc nothrow;
    static core.simd.long2 _mm_maskz_and_epi64(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_and_epi64(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_and_epi64(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_and_epi64(ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_and_epi64(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_and_epi64(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_xor_epi32(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_xor_epi32(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_xor_epi32(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.double2 _mm_mask_sqrt_sd(core.simd.double2, ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_xor_epi32(ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.double2 _mm_maskz_sqrt_sd(ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_xor_epi32(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.float4 _mm_mask_sqrt_ss(core.simd.float4, ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_maskz_sqrt_ss(ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.long4 _mm256_xor_epi32(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.float16 _mm512_broadcast_f32x4(core.simd.float4) @nogc nothrow;
    static core.simd.float16 _mm512_mask_broadcast_f32x4(core.simd.float16, ushort, core.simd.float4) @nogc nothrow;
    static core.simd.float16 _mm512_maskz_broadcast_f32x4(ushort, core.simd.float4) @nogc nothrow;
    static core.simd.double8 _mm512_broadcast_f64x4(core.simd.double4) @nogc nothrow;
    static core.simd.double8 _mm512_mask_broadcast_f64x4(core.simd.double8, ubyte, core.simd.double4) @nogc nothrow;
    static core.simd.double8 _mm512_maskz_broadcast_f64x4(ubyte, core.simd.double4) @nogc nothrow;
    static core.simd.long8 _mm512_broadcast_i32x4(core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_mask_broadcast_i32x4(core.simd.long8, ushort, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_broadcast_i32x4(ushort, core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_broadcast_i64x4(core.simd.long4) @nogc nothrow;
    static core.simd.long8 _mm512_mask_broadcast_i64x4(core.simd.long8, ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_broadcast_i64x4(ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.double8 _mm512_mask_broadcastsd_pd(core.simd.double8, ubyte, core.simd.double2) @nogc nothrow;
    static core.simd.double8 _mm512_maskz_broadcastsd_pd(ubyte, core.simd.double2) @nogc nothrow;
    static core.simd.float16 _mm512_mask_broadcastss_ps(core.simd.float16, ushort, core.simd.float4) @nogc nothrow;
    static core.simd.float16 _mm512_maskz_broadcastss_ps(ushort, core.simd.float4) @nogc nothrow;
    static core.simd.long2 _mm512_cvtsepi32_epi8(core.simd.long8) @nogc nothrow;
    static core.simd.long2 _mm512_mask_cvtsepi32_epi8(core.simd.long2, ushort, core.simd.long8) @nogc nothrow;
    static core.simd.long2 _mm512_maskz_cvtsepi32_epi8(ushort, core.simd.long8) @nogc nothrow;
    static void _mm512_mask_cvtsepi32_storeu_epi8(void*, ushort, core.simd.long8) @nogc nothrow;
    static core.simd.long4 _mm512_cvtsepi32_epi16(core.simd.long8) @nogc nothrow;
    static core.simd.long4 _mm512_mask_cvtsepi32_epi16(core.simd.long4, ushort, core.simd.long8) @nogc nothrow;
    static core.simd.long4 _mm512_maskz_cvtsepi32_epi16(ushort, core.simd.long8) @nogc nothrow;
    static void _mm512_mask_cvtsepi32_storeu_epi16(void*, ushort, core.simd.long8) @nogc nothrow;
    static core.simd.long2 _mm512_cvtsepi64_epi8(core.simd.long8) @nogc nothrow;
    static core.simd.long2 _mm512_mask_cvtsepi64_epi8(core.simd.long2, ubyte, core.simd.long8) @nogc nothrow;
    static core.simd.long2 _mm512_maskz_cvtsepi64_epi8(ubyte, core.simd.long8) @nogc nothrow;
    static void _mm512_mask_cvtsepi64_storeu_epi8(void*, ubyte, core.simd.long8) @nogc nothrow;
    static core.simd.long4 _mm512_cvtsepi64_epi32(core.simd.long8) @nogc nothrow;
    static core.simd.long4 _mm512_mask_cvtsepi64_epi32(core.simd.long4, ubyte, core.simd.long8) @nogc nothrow;
    static core.simd.long4 _mm512_maskz_cvtsepi64_epi32(ubyte, core.simd.long8) @nogc nothrow;
    static void _mm512_mask_cvtsepi64_storeu_epi32(void*, ubyte, core.simd.long8) @nogc nothrow;
    static core.simd.long2 _mm512_cvtsepi64_epi16(core.simd.long8) @nogc nothrow;
    static core.simd.long2 _mm512_mask_cvtsepi64_epi16(core.simd.long2, ubyte, core.simd.long8) @nogc nothrow;
    static core.simd.long2 _mm512_maskz_cvtsepi64_epi16(ubyte, core.simd.long8) @nogc nothrow;
    static void _mm512_mask_cvtsepi64_storeu_epi16(void*, ubyte, core.simd.long8) @nogc nothrow;
    static core.simd.long2 _mm512_cvtusepi32_epi8(core.simd.long8) @nogc nothrow;
    static core.simd.long2 _mm512_mask_cvtusepi32_epi8(core.simd.long2, ushort, core.simd.long8) @nogc nothrow;
    static core.simd.long2 _mm512_maskz_cvtusepi32_epi8(ushort, core.simd.long8) @nogc nothrow;
    static void _mm512_mask_cvtusepi32_storeu_epi8(void*, ushort, core.simd.long8) @nogc nothrow;
    static core.simd.long4 _mm512_cvtusepi32_epi16(core.simd.long8) @nogc nothrow;
    static core.simd.long4 _mm512_mask_cvtusepi32_epi16(core.simd.long4, ushort, core.simd.long8) @nogc nothrow;
    static core.simd.long4 _mm512_maskz_cvtusepi32_epi16(ushort, core.simd.long8) @nogc nothrow;
    static void _mm512_mask_cvtusepi32_storeu_epi16(void*, ushort, core.simd.long8) @nogc nothrow;
    static core.simd.long2 _mm512_cvtusepi64_epi8(core.simd.long8) @nogc nothrow;
    static core.simd.long2 _mm512_mask_cvtusepi64_epi8(core.simd.long2, ubyte, core.simd.long8) @nogc nothrow;
    static core.simd.long2 _mm512_maskz_cvtusepi64_epi8(ubyte, core.simd.long8) @nogc nothrow;
    static void _mm512_mask_cvtusepi64_storeu_epi8(void*, ubyte, core.simd.long8) @nogc nothrow;
    static core.simd.long4 _mm512_cvtusepi64_epi32(core.simd.long8) @nogc nothrow;
    static core.simd.long4 _mm512_mask_cvtusepi64_epi32(core.simd.long4, ubyte, core.simd.long8) @nogc nothrow;
    static core.simd.long4 _mm512_maskz_cvtusepi64_epi32(ubyte, core.simd.long8) @nogc nothrow;
    static void _mm512_mask_cvtusepi64_storeu_epi32(void*, ubyte, core.simd.long8) @nogc nothrow;
    static core.simd.long2 _mm512_cvtusepi64_epi16(core.simd.long8) @nogc nothrow;
    static core.simd.long2 _mm512_mask_cvtusepi64_epi16(core.simd.long2, ubyte, core.simd.long8) @nogc nothrow;
    static core.simd.long2 _mm512_maskz_cvtusepi64_epi16(ubyte, core.simd.long8) @nogc nothrow;
    static void _mm512_mask_cvtusepi64_storeu_epi16(void*, ubyte, core.simd.long8) @nogc nothrow;
    static core.simd.long2 _mm512_cvtepi32_epi8(core.simd.long8) @nogc nothrow;
    static core.simd.long2 _mm512_mask_cvtepi32_epi8(core.simd.long2, ushort, core.simd.long8) @nogc nothrow;
    static core.simd.long2 _mm512_maskz_cvtepi32_epi8(ushort, core.simd.long8) @nogc nothrow;
    static void _mm512_mask_cvtepi32_storeu_epi8(void*, ushort, core.simd.long8) @nogc nothrow;
    static core.simd.long4 _mm512_cvtepi32_epi16(core.simd.long8) @nogc nothrow;
    static core.simd.long4 _mm512_mask_cvtepi32_epi16(core.simd.long4, ushort, core.simd.long8) @nogc nothrow;
    static core.simd.long4 _mm512_maskz_cvtepi32_epi16(ushort, core.simd.long8) @nogc nothrow;
    static void _mm512_mask_cvtepi32_storeu_epi16(void*, ushort, core.simd.long8) @nogc nothrow;
    static core.simd.long2 _mm512_cvtepi64_epi8(core.simd.long8) @nogc nothrow;
    static core.simd.long2 _mm512_mask_cvtepi64_epi8(core.simd.long2, ubyte, core.simd.long8) @nogc nothrow;
    static core.simd.long2 _mm512_maskz_cvtepi64_epi8(ubyte, core.simd.long8) @nogc nothrow;
    static void _mm512_mask_cvtepi64_storeu_epi8(void*, ubyte, core.simd.long8) @nogc nothrow;
    static core.simd.long4 _mm512_cvtepi64_epi32(core.simd.long8) @nogc nothrow;
    static core.simd.long4 _mm512_mask_cvtepi64_epi32(core.simd.long4, ubyte, core.simd.long8) @nogc nothrow;
    static core.simd.long4 _mm512_maskz_cvtepi64_epi32(ubyte, core.simd.long8) @nogc nothrow;
    static void _mm512_mask_cvtepi64_storeu_epi32(void*, ubyte, core.simd.long8) @nogc nothrow;
    static core.simd.long2 _mm512_cvtepi64_epi16(core.simd.long8) @nogc nothrow;
    static core.simd.long2 _mm512_mask_cvtepi64_epi16(core.simd.long2, ubyte, core.simd.long8) @nogc nothrow;
    static core.simd.long2 _mm512_maskz_cvtepi64_epi16(ubyte, core.simd.long8) @nogc nothrow;
    static void _mm512_mask_cvtepi64_storeu_epi16(void*, ubyte, core.simd.long8) @nogc nothrow;
    static core.simd.long2 _mm_maskz_or_epi32(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_or_epi32(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_or_epi32(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_or_epi32(ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_or_epi32(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_or_epi32(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_andnot_epi32(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_andnot_epi32(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_andnot_epi32(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_andnot_epi32(ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_andnot_epi32(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_andnot_epi32(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_and_epi32(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_and_epi32(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_and_epi32(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_and_epi32(ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.double8 _mm512_getexp_pd(core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_mask_getexp_pd(core.simd.double8, ubyte, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_maskz_getexp_pd(ubyte, core.simd.double8) @nogc nothrow;
    static core.simd.long4 _mm256_mask_and_epi32(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_and_epi32(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.float16 _mm512_getexp_ps(core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_mask_getexp_ps(core.simd.float16, ushort, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_maskz_getexp_ps(ushort, core.simd.float16) @nogc nothrow;
    static core.simd.long2 _mm_mask_mullo_epi32(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_mullo_epi32(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_mullo_epi32(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_mullo_epi32(ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_mul_epu32(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_mul_epu32(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_mul_epu32(ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_mul_epu32(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_mul_epi32(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_mul_epi32(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_mul_epi32(ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_mul_epi32(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_sub_epi64(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_sub_epi64(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_sub_epi32(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_sub_epi32(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.float4 _mm_mask_fmadd_ss(core.simd.float4, ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_add_epi64(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.float4 _mm_maskz_fmadd_ss(ubyte, core.simd.float4, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_mask3_fmadd_ss(core.simd.float4, core.simd.float4, core.simd.float4, ubyte) @nogc nothrow;
    static core.simd.long2 _mm_mask_add_epi64(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.float4 _mm_mask_fmsub_ss(core.simd.float4, ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_add_epi32(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.float4 _mm_maskz_fmsub_ss(ubyte, core.simd.float4, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_mask3_fmsub_ss(core.simd.float4, core.simd.float4, core.simd.float4, ubyte) @nogc nothrow;
    static core.simd.long2 _mm_mask_add_epi32(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.float4 _mm_mask_fnmadd_ss(core.simd.float4, ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_sub_epi64(ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.float4 _mm_maskz_fnmadd_ss(ubyte, core.simd.float4, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_mask3_fnmadd_ss(core.simd.float4, core.simd.float4, core.simd.float4, ubyte) @nogc nothrow;
    static core.simd.long4 _mm256_mask_sub_epi64(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.float4 _mm_mask_fnmsub_ss(core.simd.float4, ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_sub_epi32(ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.float4 _mm_maskz_fnmsub_ss(ubyte, core.simd.float4, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_mask3_fnmsub_ss(core.simd.float4, core.simd.float4, core.simd.float4, ubyte) @nogc nothrow;
    static core.simd.long4 _mm256_mask_sub_epi32(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.double2 _mm_mask_fmadd_sd(core.simd.double2, ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_add_epi64(ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.double2 _mm_maskz_fmadd_sd(ubyte, core.simd.double2, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_mask3_fmadd_sd(core.simd.double2, core.simd.double2, core.simd.double2, ubyte) @nogc nothrow;
    static core.simd.long4 _mm256_mask_add_epi64(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.double2 _mm_mask_fmsub_sd(core.simd.double2, ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_add_epi32(ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.double2 _mm_maskz_fmsub_sd(ubyte, core.simd.double2, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_mask3_fmsub_sd(core.simd.double2, core.simd.double2, core.simd.double2, ubyte) @nogc nothrow;
    static core.simd.long4 _mm256_mask_add_epi32(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.double2 _mm_mask_fnmadd_sd(core.simd.double2, ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    alias __v2qi = core.simd.char2;
    alias __v4qi = core.simd.char4;
    static core.simd.double2 _mm_maskz_fnmadd_sd(ubyte, core.simd.double2, core.simd.double2, core.simd.double2) @nogc nothrow;
    alias __v2hi = core.simd.short2;
    static core.simd.double2 _mm_mask3_fnmadd_sd(core.simd.double2, core.simd.double2, core.simd.double2, ubyte) @nogc nothrow;
    static core.simd.double2 _mm_mask_fnmsub_sd(core.simd.double2, ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_broadcast_i64x2(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.double2 _mm_maskz_fnmsub_sd(ubyte, core.simd.double2, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_mask3_fnmsub_sd(core.simd.double2, core.simd.double2, core.simd.double2, ubyte) @nogc nothrow;
    static core.simd.long4 _mm256_mask_broadcast_i64x2(core.simd.long4, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_broadcast_i64x2(core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_broadcast_i32x2(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_broadcast_i32x2(core.simd.long4, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.double8 _mm512_permutexvar_pd(core.simd.long8, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_mask_permutexvar_pd(core.simd.double8, ubyte, core.simd.long8, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_maskz_permutexvar_pd(ubyte, core.simd.long8, core.simd.double8) @nogc nothrow;
    static core.simd.long8 _mm512_permutexvar_epi64(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_permutexvar_epi64(ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_permutexvar_epi64(core.simd.long8, ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.float16 _mm512_permutexvar_ps(core.simd.long8, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_mask_permutexvar_ps(core.simd.float16, ushort, core.simd.long8, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_maskz_permutexvar_ps(ushort, core.simd.long8, core.simd.float16) @nogc nothrow;
    static core.simd.long8 _mm512_permutexvar_epi32(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_permutexvar_epi32(ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_permutexvar_epi32(core.simd.long8, ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long4 _mm256_broadcast_i32x2(core.simd.long2) @nogc nothrow;
    static ushort _mm512_kand(ushort, ushort) @nogc nothrow;
    static ushort _mm512_kandn(ushort, ushort) @nogc nothrow;
    static ushort _mm512_kor(ushort, ushort) @nogc nothrow;
    static int _mm512_kortestc(ushort, ushort) @nogc nothrow;
    static int _mm512_kortestz(ushort, ushort) @nogc nothrow;
    static ubyte _kortestc_mask16_u8(ushort, ushort) @nogc nothrow;
    static ubyte _kortestz_mask16_u8(ushort, ushort) @nogc nothrow;
    static ubyte _kortest_mask16_u8(ushort, ushort, ubyte*) @nogc nothrow;
    static ushort _mm512_kunpackb(ushort, ushort) @nogc nothrow;
    static ushort _mm512_kxnor(ushort, ushort) @nogc nothrow;
    static ushort _mm512_kxor(ushort, ushort) @nogc nothrow;
    static core.simd.long2 _mm_maskz_broadcast_i32x2(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_broadcast_i32x2(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_broadcast_i32x2(core.simd.long2) @nogc nothrow;
    static core.simd.double4 _mm256_maskz_broadcast_f64x2(ubyte, core.simd.double2) @nogc nothrow;
    static uint _cvtmask16_u32(ushort) @nogc nothrow;
    static ushort _cvtu32_mask16(uint) @nogc nothrow;
    static ushort _load_mask16(ushort*) @nogc nothrow;
    static void _store_mask16(ushort*, ushort) @nogc nothrow;
    static void _mm512_stream_si512(core.simd.long8*, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_stream_load_si512(const(void)*) @nogc nothrow;
    static void _mm512_stream_pd(double*, core.simd.double8) @nogc nothrow;
    static void _mm512_stream_ps(float*, core.simd.float16) @nogc nothrow;
    static core.simd.double8 _mm512_mask_compress_pd(core.simd.double8, ubyte, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_maskz_compress_pd(ubyte, core.simd.double8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_compress_epi64(core.simd.long8, ubyte, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_compress_epi64(ubyte, core.simd.long8) @nogc nothrow;
    static core.simd.float16 _mm512_mask_compress_ps(core.simd.float16, ushort, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_maskz_compress_ps(ushort, core.simd.float16) @nogc nothrow;
    static core.simd.long8 _mm512_mask_compress_epi32(core.simd.long8, ushort, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_compress_epi32(ushort, core.simd.long8) @nogc nothrow;
    static core.simd.double4 _mm256_mask_broadcast_f64x2(core.simd.double4, ubyte, core.simd.double2) @nogc nothrow;
    static core.simd.double4 _mm256_broadcast_f64x2(core.simd.double2) @nogc nothrow;
    static core.simd.float8 _mm256_maskz_broadcast_f32x2(ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.float8 _mm256_mask_broadcast_f32x2(core.simd.float8, ubyte, core.simd.float4) @nogc nothrow;
    static ushort _mm512_test_epi32_mask(core.simd.long8, core.simd.long8) @nogc nothrow;
    static ushort _mm512_mask_test_epi32_mask(ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static ubyte _mm512_test_epi64_mask(core.simd.long8, core.simd.long8) @nogc nothrow;
    static ubyte _mm512_mask_test_epi64_mask(ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static ushort _mm512_testn_epi32_mask(core.simd.long8, core.simd.long8) @nogc nothrow;
    static ushort _mm512_mask_testn_epi32_mask(ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static ubyte _mm512_testn_epi64_mask(core.simd.long8, core.simd.long8) @nogc nothrow;
    static ubyte _mm512_mask_testn_epi64_mask(ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.float16 _mm512_movehdup_ps(core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_mask_movehdup_ps(core.simd.float16, ushort, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_maskz_movehdup_ps(ushort, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_moveldup_ps(core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_mask_moveldup_ps(core.simd.float16, ushort, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_maskz_moveldup_ps(ushort, core.simd.float16) @nogc nothrow;
    static core.simd.float4 _mm_mask_move_ss(core.simd.float4, ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_maskz_move_ss(ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.double2 _mm_mask_move_sd(core.simd.double2, ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_maskz_move_sd(ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static void _mm_mask_store_ss(float*, ubyte, core.simd.float4) @nogc nothrow;
    static void _mm_mask_store_sd(double*, ubyte, core.simd.double2) @nogc nothrow;
    static core.simd.float4 _mm_mask_load_ss(core.simd.float4, ubyte, const(float)*) @nogc nothrow;
    static core.simd.float4 _mm_maskz_load_ss(ubyte, const(float)*) @nogc nothrow;
    static core.simd.double2 _mm_mask_load_sd(core.simd.double2, ubyte, const(double)*) @nogc nothrow;
    static core.simd.double2 _mm_maskz_load_sd(ubyte, const(double)*) @nogc nothrow;
    static core.simd.float8 _mm256_broadcast_f32x2(core.simd.float4) @nogc nothrow;
    static core.simd.double8 _mm512_mask_expand_pd(core.simd.double8, ubyte, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_maskz_expand_pd(ubyte, core.simd.double8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_expand_epi64(core.simd.long8, ubyte, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_expand_epi64(ubyte, core.simd.long8) @nogc nothrow;
    static core.simd.double8 _mm512_mask_expandloadu_pd(core.simd.double8, ubyte, const(void)*) @nogc nothrow;
    static core.simd.double8 _mm512_maskz_expandloadu_pd(ubyte, const(void)*) @nogc nothrow;
    static core.simd.long8 _mm512_mask_expandloadu_epi64(core.simd.long8, ubyte, const(void)*) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_expandloadu_epi64(ubyte, const(void)*) @nogc nothrow;
    static core.simd.float16 _mm512_mask_expandloadu_ps(core.simd.float16, ushort, const(void)*) @nogc nothrow;
    static core.simd.float16 _mm512_maskz_expandloadu_ps(ushort, const(void)*) @nogc nothrow;
    static core.simd.long8 _mm512_mask_expandloadu_epi32(core.simd.long8, ushort, const(void)*) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_expandloadu_epi32(ushort, const(void)*) @nogc nothrow;
    static core.simd.float16 _mm512_mask_expand_ps(core.simd.float16, ushort, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_maskz_expand_ps(ushort, core.simd.float16) @nogc nothrow;
    static core.simd.long8 _mm512_mask_expand_epi32(core.simd.long8, ushort, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_expand_epi32(ushort, core.simd.long8) @nogc nothrow;
    static ubyte _mm256_movepi64_mask(core.simd.long4) @nogc nothrow;
    static ubyte _mm_movepi64_mask(core.simd.long2) @nogc nothrow;
    static core.simd.double8 _mm512_cvtps_pd(core.simd.float8) @nogc nothrow;
    static core.simd.double8 _mm512_mask_cvtps_pd(core.simd.double8, ubyte, core.simd.float8) @nogc nothrow;
    static core.simd.double8 _mm512_maskz_cvtps_pd(ubyte, core.simd.float8) @nogc nothrow;
    static core.simd.double8 _mm512_cvtpslo_pd(core.simd.float16) @nogc nothrow;
    static core.simd.double8 _mm512_mask_cvtpslo_pd(core.simd.double8, ubyte, core.simd.float16) @nogc nothrow;
    static core.simd.double8 _mm512_mask_mov_pd(core.simd.double8, ubyte, core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_maskz_mov_pd(ubyte, core.simd.double8) @nogc nothrow;
    static core.simd.float16 _mm512_mask_mov_ps(core.simd.float16, ushort, core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_maskz_mov_ps(ushort, core.simd.float16) @nogc nothrow;
    static void _mm512_mask_compressstoreu_pd(void*, ubyte, core.simd.double8) @nogc nothrow;
    static void _mm512_mask_compressstoreu_epi64(void*, ubyte, core.simd.long8) @nogc nothrow;
    static void _mm512_mask_compressstoreu_ps(void*, ushort, core.simd.float16) @nogc nothrow;
    static void _mm512_mask_compressstoreu_epi32(void*, ushort, core.simd.long8) @nogc nothrow;
    static core.simd.long4 _mm256_movm_epi64(ubyte) @nogc nothrow;
    static core.simd.float4 _mm_mask_cvtsd_ss(core.simd.float4, ubyte, core.simd.float4, core.simd.double2) @nogc nothrow;
    static core.simd.float4 _mm_maskz_cvtsd_ss(ubyte, core.simd.float4, core.simd.double2) @nogc nothrow;
    static core.simd.long2 _mm_movm_epi64(ubyte) @nogc nothrow;
    static core.simd.long4 _mm256_movm_epi32(ubyte) @nogc nothrow;
    static core.simd.long2 _mm_movm_epi32(ubyte) @nogc nothrow;
    static ubyte _mm256_movepi32_mask(core.simd.long4) @nogc nothrow;
    static ubyte _mm_movepi32_mask(core.simd.long2) @nogc nothrow;
    static core.simd.float4 _mm256_maskz_cvtepu64_ps(ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.float4 _mm256_mask_cvtepu64_ps(core.simd.float4, ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.float4 _mm256_cvtepu64_ps(core.simd.long4) @nogc nothrow;
    static core.simd.float4 _mm_maskz_cvtepu64_ps(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.double2 _mm_mask_cvtss_sd(core.simd.double2, ubyte, core.simd.double2, core.simd.float4) @nogc nothrow;
    static core.simd.double2 _mm_maskz_cvtss_sd(ubyte, core.simd.double2, core.simd.float4) @nogc nothrow;
    static core.simd.double2 _mm_cvtu32_sd(core.simd.double2, uint) @nogc nothrow;
    static core.simd.double2 _mm_cvtu64_sd(core.simd.double2, ulong) @nogc nothrow;
    static core.simd.float4 _mm_mask_cvtepu64_ps(core.simd.float4, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.float4 _mm_cvtu32_ss(core.simd.float4, uint) @nogc nothrow;
    static core.simd.float4 _mm_cvtu64_ss(core.simd.float4, ulong) @nogc nothrow;
    static core.simd.long8 _mm512_mask_set1_epi32(core.simd.long8, ushort, int) @nogc nothrow;
    static core.simd.long8 _mm512_mask_set1_epi64(core.simd.long8, ubyte, long) @nogc nothrow;
    static core.simd.long8 _mm512_set_epi8(char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char, char) @nogc nothrow;
    static core.simd.long8 _mm512_set_epi16(short, short, short, short, short, short, short, short, short, short, short, short, short, short, short, short, short, short, short, short, short, short, short, short, short, short, short, short, short, short, short, short) @nogc nothrow;
    static core.simd.long8 _mm512_set_epi32(int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int) @nogc nothrow;
    static core.simd.float4 _mm_cvtepu64_ps(core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_set_epi64(long, long, long, long, long, long, long, long) @nogc nothrow;
    static core.simd.double8 _mm512_set_pd(double, double, double, double, double, double, double, double) @nogc nothrow;
    static core.simd.double4 _mm256_maskz_cvtepu64_pd(ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.float16 _mm512_set_ps(float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float) @nogc nothrow;
    static core.simd.float16 _mm512_abs_ps(core.simd.float16) @nogc nothrow;
    static core.simd.float16 _mm512_mask_abs_ps(core.simd.float16, ushort, core.simd.float16) @nogc nothrow;
    static core.simd.double8 _mm512_abs_pd(core.simd.double8) @nogc nothrow;
    static core.simd.double8 _mm512_mask_abs_pd(core.simd.double8, ubyte, core.simd.double8) @nogc nothrow;
    static core.simd.double4 _mm256_mask_cvtepu64_pd(core.simd.double4, ubyte, core.simd.long4) @nogc nothrow;
    static long _mm512_reduce_add_epi64(core.simd.long8) @nogc nothrow;
    static long _mm512_reduce_mul_epi64(core.simd.long8) @nogc nothrow;
    static long _mm512_reduce_and_epi64(core.simd.long8) @nogc nothrow;
    static long _mm512_reduce_or_epi64(core.simd.long8) @nogc nothrow;
    static long _mm512_mask_reduce_add_epi64(ubyte, core.simd.long8) @nogc nothrow;
    static long _mm512_mask_reduce_mul_epi64(ubyte, core.simd.long8) @nogc nothrow;
    static long _mm512_mask_reduce_and_epi64(ubyte, core.simd.long8) @nogc nothrow;
    static long _mm512_mask_reduce_or_epi64(ubyte, core.simd.long8) @nogc nothrow;
    static double _mm512_reduce_add_pd(core.simd.double8) @nogc nothrow;
    static double _mm512_reduce_mul_pd(core.simd.double8) @nogc nothrow;
    static double _mm512_mask_reduce_add_pd(ubyte, core.simd.double8) @nogc nothrow;
    static double _mm512_mask_reduce_mul_pd(ubyte, core.simd.double8) @nogc nothrow;
    static core.simd.double4 _mm256_cvtepu64_pd(core.simd.long4) @nogc nothrow;
    static int _mm512_reduce_add_epi32(core.simd.long8) @nogc nothrow;
    static int _mm512_reduce_mul_epi32(core.simd.long8) @nogc nothrow;
    static int _mm512_reduce_and_epi32(core.simd.long8) @nogc nothrow;
    static int _mm512_reduce_or_epi32(core.simd.long8) @nogc nothrow;
    static int _mm512_mask_reduce_add_epi32(ushort, core.simd.long8) @nogc nothrow;
    static int _mm512_mask_reduce_mul_epi32(ushort, core.simd.long8) @nogc nothrow;
    static int _mm512_mask_reduce_and_epi32(ushort, core.simd.long8) @nogc nothrow;
    static int _mm512_mask_reduce_or_epi32(ushort, core.simd.long8) @nogc nothrow;
    static float _mm512_reduce_add_ps(core.simd.float16) @nogc nothrow;
    static float _mm512_reduce_mul_ps(core.simd.float16) @nogc nothrow;
    static float _mm512_mask_reduce_add_ps(ushort, core.simd.float16) @nogc nothrow;
    static float _mm512_mask_reduce_mul_ps(ushort, core.simd.float16) @nogc nothrow;
    static core.simd.double2 _mm_maskz_cvtepu64_pd(ubyte, core.simd.long2) @nogc nothrow;
    static long _mm512_reduce_max_epi64(core.simd.long8) @nogc nothrow;
    static ulong _mm512_reduce_max_epu64(core.simd.long8) @nogc nothrow;
    static long _mm512_reduce_min_epi64(core.simd.long8) @nogc nothrow;
    static ulong _mm512_reduce_min_epu64(core.simd.long8) @nogc nothrow;
    static long _mm512_mask_reduce_max_epi64(ubyte, core.simd.long8) @nogc nothrow;
    static ulong _mm512_mask_reduce_max_epu64(ubyte, core.simd.long8) @nogc nothrow;
    static long _mm512_mask_reduce_min_epi64(ubyte, core.simd.long8) @nogc nothrow;
    static ulong _mm512_mask_reduce_min_epu64(ubyte, core.simd.long8) @nogc nothrow;
    static int _mm512_reduce_max_epi32(core.simd.long8) @nogc nothrow;
    static uint _mm512_reduce_max_epu32(core.simd.long8) @nogc nothrow;
    static int _mm512_reduce_min_epi32(core.simd.long8) @nogc nothrow;
    static uint _mm512_reduce_min_epu32(core.simd.long8) @nogc nothrow;
    static int _mm512_mask_reduce_max_epi32(ushort, core.simd.long8) @nogc nothrow;
    static uint _mm512_mask_reduce_max_epu32(ushort, core.simd.long8) @nogc nothrow;
    static int _mm512_mask_reduce_min_epi32(ushort, core.simd.long8) @nogc nothrow;
    static uint _mm512_mask_reduce_min_epu32(ushort, core.simd.long8) @nogc nothrow;
    static core.simd.double2 _mm_mask_cvtepu64_pd(core.simd.double2, ubyte, core.simd.long2) @nogc nothrow;
    static double _mm512_reduce_max_pd(core.simd.double8) @nogc nothrow;
    static double _mm512_reduce_min_pd(core.simd.double8) @nogc nothrow;
    static double _mm512_mask_reduce_max_pd(ubyte, core.simd.double8) @nogc nothrow;
    static double _mm512_mask_reduce_min_pd(ubyte, core.simd.double8) @nogc nothrow;
    static float _mm512_reduce_max_ps(core.simd.float16) @nogc nothrow;
    static float _mm512_reduce_min_ps(core.simd.float16) @nogc nothrow;
    static float _mm512_mask_reduce_max_ps(ushort, core.simd.float16) @nogc nothrow;
    static float _mm512_mask_reduce_min_ps(ushort, core.simd.float16) @nogc nothrow;
    static core.simd.double2 _mm_cvtepu64_pd(core.simd.long2) @nogc nothrow;
    static core.simd.long8 _mm512_madd52hi_epu64(core.simd.long8, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_madd52hi_epu64(core.simd.long8, ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_madd52hi_epu64(ubyte, core.simd.long8, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_madd52lo_epu64(core.simd.long8, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_madd52lo_epu64(core.simd.long8, ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_madd52lo_epu64(ubyte, core.simd.long8, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_cvttps_epu64(ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_cvttps_epu64(core.simd.long4, ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.long2 _mm_madd52hi_epu64(core.simd.long2, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_madd52hi_epu64(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_madd52hi_epu64(ubyte, core.simd.long2, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_madd52hi_epu64(core.simd.long4, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_madd52hi_epu64(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_madd52hi_epu64(ubyte, core.simd.long4, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_madd52lo_epu64(core.simd.long2, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_madd52lo_epu64(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_madd52lo_epu64(ubyte, core.simd.long2, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_madd52lo_epu64(core.simd.long4, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_madd52lo_epu64(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_madd52lo_epu64(ubyte, core.simd.long4, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_cvttps_epu64(core.simd.float4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_cvttps_epu64(ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.long2 _mm_mask_cvttps_epu64(core.simd.long2, ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.long2 _mm_cvttps_epu64(core.simd.float4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_cvttps_epi64(ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_cvttps_epi64(core.simd.long4, ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.long4 _mm256_cvttps_epi64(core.simd.float4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_cvttps_epi64(ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.long2 _mm_mask_cvttps_epi64(core.simd.long2, ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.long2 _mm_cvttps_epi64(core.simd.float4) @nogc nothrow;
    static core.simd.long8 _mm512_mask_compress_epi16(core.simd.long8, uint, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_compress_epi16(uint, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_compress_epi8(core.simd.long8, ulong, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_compress_epi8(ulong, core.simd.long8) @nogc nothrow;
    static void _mm512_mask_compressstoreu_epi16(void*, uint, core.simd.long8) @nogc nothrow;
    static void _mm512_mask_compressstoreu_epi8(void*, ulong, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_expand_epi16(core.simd.long8, uint, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_expand_epi16(uint, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_expand_epi8(core.simd.long8, ulong, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_expand_epi8(ulong, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_expandloadu_epi16(core.simd.long8, uint, const(void)*) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_expandloadu_epi16(uint, const(void)*) @nogc nothrow;
    static core.simd.long8 _mm512_mask_expandloadu_epi8(core.simd.long8, ulong, const(void)*) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_expandloadu_epi8(ulong, const(void)*) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_cvttpd_epu64(ubyte, core.simd.double4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_cvttpd_epu64(core.simd.long4, ubyte, core.simd.double4) @nogc nothrow;
    static core.simd.long4 _mm256_cvttpd_epu64(core.simd.double4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_cvttpd_epu64(ubyte, core.simd.double2) @nogc nothrow;
    static core.simd.long2 _mm_mask_cvttpd_epu64(core.simd.long2, ubyte, core.simd.double2) @nogc nothrow;
    static core.simd.long2 _mm_cvttpd_epu64(core.simd.double2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_cvttpd_epi64(ubyte, core.simd.double4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_cvttpd_epi64(core.simd.long4, ubyte, core.simd.double4) @nogc nothrow;
    static core.simd.long4 _mm256_cvttpd_epi64(core.simd.double4) @nogc nothrow;
    static core.simd.long8 _mm512_shldv_epi64(core.simd.long8, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_shldv_epi64(core.simd.long8, ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_shldv_epi64(ubyte, core.simd.long8, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_shldv_epi32(core.simd.long8, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_shldv_epi32(core.simd.long8, ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_shldv_epi32(ushort, core.simd.long8, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_shldv_epi16(core.simd.long8, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_shldv_epi16(core.simd.long8, uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_shldv_epi16(uint, core.simd.long8, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_shrdv_epi64(core.simd.long8, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_shrdv_epi64(core.simd.long8, ubyte, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_shrdv_epi64(ubyte, core.simd.long8, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_shrdv_epi32(core.simd.long8, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_shrdv_epi32(core.simd.long8, ushort, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_shrdv_epi32(ushort, core.simd.long8, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_shrdv_epi16(core.simd.long8, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_shrdv_epi16(core.simd.long8, uint, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_shrdv_epi16(uint, core.simd.long8, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long2 _mm_maskz_cvttpd_epi64(ubyte, core.simd.double2) @nogc nothrow;
    static core.simd.long8 _mm512_permutex2var_epi8(core.simd.long8, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_permutex2var_epi8(core.simd.long8, ulong, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask2_permutex2var_epi8(core.simd.long8, core.simd.long8, ulong, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_permutex2var_epi8(ulong, core.simd.long8, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_permutexvar_epi8(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_permutexvar_epi8(ulong, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_permutexvar_epi8(core.simd.long8, ulong, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_multishift_epi64_epi8(core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_mask_multishift_epi64_epi8(core.simd.long8, ulong, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long8 _mm512_maskz_multishift_epi64_epi8(ulong, core.simd.long8, core.simd.long8) @nogc nothrow;
    static core.simd.long2 _mm_mask_cvttpd_epi64(core.simd.long2, ubyte, core.simd.double2) @nogc nothrow;
    static core.simd.long2 _mm_permutex2var_epi8(core.simd.long2, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_permutex2var_epi8(core.simd.long2, ushort, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask2_permutex2var_epi8(core.simd.long2, core.simd.long2, ushort, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_permutex2var_epi8(ushort, core.simd.long2, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_permutex2var_epi8(core.simd.long4, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_permutex2var_epi8(core.simd.long4, uint, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask2_permutex2var_epi8(core.simd.long4, core.simd.long4, uint, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_permutex2var_epi8(uint, core.simd.long4, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_permutexvar_epi8(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_permutexvar_epi8(ushort, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_permutexvar_epi8(core.simd.long2, ushort, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_permutexvar_epi8(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_permutexvar_epi8(uint, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_permutexvar_epi8(core.simd.long4, uint, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_multishift_epi64_epi8(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_multishift_epi64_epi8(core.simd.long2, ushort, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_multishift_epi64_epi8(ushort, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_multishift_epi64_epi8(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_multishift_epi64_epi8(core.simd.long4, uint, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_multishift_epi64_epi8(uint, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_cvttpd_epi64(core.simd.double2) @nogc nothrow;
    static core.simd.float4 _mm256_maskz_cvtepi64_ps(ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_popcnt_epi16(core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_popcnt_epi16(core.simd.long4, ushort, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_popcnt_epi16(ushort, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_popcnt_epi16(core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_popcnt_epi16(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_popcnt_epi16(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_popcnt_epi8(core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_popcnt_epi8(core.simd.long4, uint, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_popcnt_epi8(uint, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_popcnt_epi8(core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_popcnt_epi8(core.simd.long2, ushort, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_popcnt_epi8(ushort, core.simd.long2) @nogc nothrow;
    static uint _mm256_mask_bitshuffle_epi64_mask(uint, core.simd.long4, core.simd.long4) @nogc nothrow;
    static uint _mm256_bitshuffle_epi64_mask(core.simd.long4, core.simd.long4) @nogc nothrow;
    static ushort _mm_mask_bitshuffle_epi64_mask(ushort, core.simd.long2, core.simd.long2) @nogc nothrow;
    static ushort _mm_bitshuffle_epi64_mask(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.float4 _mm256_mask_cvtepi64_ps(core.simd.float4, ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.float4 _mm256_cvtepi64_ps(core.simd.long4) @nogc nothrow;
    static core.simd.float4 _mm_maskz_cvtepi64_ps(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.float4 _mm_mask_cvtepi64_ps(core.simd.float4, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.float4 _mm_cvtepi64_ps(core.simd.long2) @nogc nothrow;
    static core.simd.double4 _mm256_maskz_cvtepi64_pd(ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.double4 _mm256_mask_cvtepi64_pd(core.simd.double4, ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.double4 _mm256_cvtepi64_pd(core.simd.long4) @nogc nothrow;
    static core.simd.double2 _mm_maskz_cvtepi64_pd(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.double2 _mm_mask_cvtepi64_pd(core.simd.double2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.double2 _mm_cvtepi64_pd(core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_cvtps_epu64(ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_cvtps_epu64(core.simd.long4, ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.long4 _mm256_cvtps_epu64(core.simd.float4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_cvtps_epu64(ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.long2 _mm_mask_cvtps_epu64(core.simd.long2, ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.long2 _mm_cvtps_epu64(core.simd.float4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_cvtps_epi64(ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_cvtps_epi64(core.simd.long4, ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.long4 _mm256_cvtps_epi64(core.simd.float4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_cvtps_epi64(ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.long2 _mm_mask_cvtps_epi64(core.simd.long2, ubyte, core.simd.float4) @nogc nothrow;
    static core.simd.long2 _mm_cvtps_epi64(core.simd.float4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_cvtpd_epu64(ubyte, core.simd.double4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_cvtpd_epu64(core.simd.long4, ubyte, core.simd.double4) @nogc nothrow;
    static core.simd.long4 _mm256_cvtpd_epu64(core.simd.double4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_cvtpd_epu64(ubyte, core.simd.double2) @nogc nothrow;
    static core.simd.long2 _mm_mask_cvtpd_epu64(core.simd.long2, ubyte, core.simd.double2) @nogc nothrow;
    static core.simd.long2 _mm_cvtpd_epu64(core.simd.double2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_cvtpd_epi64(ubyte, core.simd.double4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_cvtpd_epi64(core.simd.long4, ubyte, core.simd.double4) @nogc nothrow;
    static core.simd.long4 _mm256_cvtpd_epi64(core.simd.double4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_cvtpd_epi64(ubyte, core.simd.double2) @nogc nothrow;
    static core.simd.long2 _mm_mask_cvtpd_epi64(core.simd.long2, ubyte, core.simd.double2) @nogc nothrow;
    static core.simd.long2 _mm_cvtpd_epi64(core.simd.double2) @nogc nothrow;
    static core.simd.float4 _mm_maskz_or_ps(ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_mask_or_ps(core.simd.float4, ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float8 _mm256_maskz_or_ps(ubyte, core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.float8 _mm256_mask_or_ps(core.simd.float8, ubyte, core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.double2 _mm_maskz_or_pd(ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_mask_or_pd(core.simd.double2, ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double4 _mm256_maskz_or_pd(ubyte, core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.double4 _mm256_mask_or_pd(core.simd.double4, ubyte, core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.float4 _mm_maskz_xor_ps(ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_mask_xor_ps(core.simd.float4, ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float8 _mm256_maskz_xor_ps(ubyte, core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.float8 _mm256_mask_xor_ps(core.simd.float8, ubyte, core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.double2 _mm_maskz_xor_pd(ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_mask_xor_pd(core.simd.double2, ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double4 _mm256_maskz_xor_pd(ubyte, core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.double4 _mm256_mask_xor_pd(core.simd.double4, ubyte, core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.float4 _mm_maskz_and_ps(ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_mask_and_ps(core.simd.float4, ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float8 _mm256_maskz_and_ps(ubyte, core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.float8 _mm256_mask_and_ps(core.simd.float8, ubyte, core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.double2 _mm_maskz_and_pd(ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_mask_and_pd(core.simd.double2, ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_add_epi8(core.simd.long4, uint, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_add_epi8(uint, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_add_epi16(core.simd.long4, ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_add_epi16(ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_sub_epi8(core.simd.long4, uint, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_sub_epi8(uint, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_sub_epi16(core.simd.long4, ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_sub_epi16(ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_mask_add_epi8(core.simd.long2, ushort, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_add_epi8(ushort, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_add_epi16(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_add_epi16(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_sub_epi8(core.simd.long2, ushort, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_sub_epi8(ushort, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_sub_epi16(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_sub_epi16(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_mullo_epi16(core.simd.long4, ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_mullo_epi16(ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_mask_mullo_epi16(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_mullo_epi16(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_blend_epi8(ushort, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_blend_epi8(uint, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_mask_blend_epi16(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_blend_epi16(ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_mask_abs_epi8(core.simd.long2, ushort, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_abs_epi8(ushort, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_abs_epi8(core.simd.long4, uint, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_abs_epi8(uint, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_mask_abs_epi16(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_abs_epi16(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_abs_epi16(core.simd.long4, ushort, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_abs_epi16(ushort, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_packs_epi32(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_packs_epi32(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_packs_epi32(ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_packs_epi32(core.simd.long4, ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_packs_epi16(ushort, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_packs_epi16(core.simd.long2, ushort, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_packs_epi16(uint, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_packs_epi16(core.simd.long4, uint, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_packus_epi32(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_packus_epi32(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_packus_epi32(ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_packus_epi32(core.simd.long4, ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_packus_epi16(ushort, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_packus_epi16(core.simd.long2, ushort, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_packus_epi16(uint, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_packus_epi16(core.simd.long4, uint, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_mask_adds_epi8(core.simd.long2, ushort, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_adds_epi8(ushort, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_adds_epi8(core.simd.long4, uint, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_adds_epi8(uint, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_mask_adds_epi16(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_adds_epi16(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_adds_epi16(core.simd.long4, ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_adds_epi16(ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_mask_adds_epu8(core.simd.long2, ushort, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_adds_epu8(ushort, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_adds_epu8(core.simd.long4, uint, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_adds_epu8(uint, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_mask_adds_epu16(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_adds_epu16(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_adds_epu16(core.simd.long4, ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_adds_epu16(ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_mask_avg_epu8(core.simd.long2, ushort, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_avg_epu8(ushort, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_avg_epu8(core.simd.long4, uint, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_avg_epu8(uint, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_mask_avg_epu16(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_avg_epu16(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_avg_epu16(core.simd.long4, ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_avg_epu16(ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_max_epi8(ushort, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_max_epi8(core.simd.long2, ushort, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_max_epi8(uint, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_max_epi8(core.simd.long4, uint, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_max_epi16(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_max_epi16(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_max_epi16(ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_max_epi16(core.simd.long4, ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_max_epu8(ushort, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_max_epu8(core.simd.long2, ushort, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_max_epu8(uint, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_max_epu8(core.simd.long4, uint, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_max_epu16(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_max_epu16(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_max_epu16(ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_max_epu16(core.simd.long4, ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_min_epi8(ushort, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_min_epi8(core.simd.long2, ushort, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_min_epi8(uint, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_min_epi8(core.simd.long4, uint, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_min_epi16(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_min_epi16(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_min_epi16(ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_min_epi16(core.simd.long4, ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_min_epu8(ushort, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_min_epu8(core.simd.long2, ushort, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_min_epu8(uint, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_min_epu8(core.simd.long4, uint, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_min_epu16(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_min_epu16(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_min_epu16(ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_min_epu16(core.simd.long4, ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_mask_shuffle_epi8(core.simd.long2, ushort, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_shuffle_epi8(ushort, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_shuffle_epi8(core.simd.long4, uint, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_shuffle_epi8(uint, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_mask_subs_epi8(core.simd.long2, ushort, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_subs_epi8(ushort, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_subs_epi8(core.simd.long4, uint, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_subs_epi8(uint, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_mask_subs_epi16(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_subs_epi16(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_subs_epi16(core.simd.long4, ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_subs_epi16(ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_mask_subs_epu8(core.simd.long2, ushort, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_subs_epu8(ushort, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_subs_epu8(core.simd.long4, uint, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_subs_epu8(uint, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_mask_subs_epu16(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_subs_epu16(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_subs_epu16(core.simd.long4, ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_subs_epu16(ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_permutex2var_epi16(core.simd.long2, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_permutex2var_epi16(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask2_permutex2var_epi16(core.simd.long2, core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_permutex2var_epi16(ubyte, core.simd.long2, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_permutex2var_epi16(core.simd.long4, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_permutex2var_epi16(core.simd.long4, ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask2_permutex2var_epi16(core.simd.long4, core.simd.long4, ushort, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_permutex2var_epi16(ushort, core.simd.long4, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_mask_maddubs_epi16(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_maddubs_epi16(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_maddubs_epi16(core.simd.long4, ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_maddubs_epi16(ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_mask_madd_epi16(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_madd_epi16(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_madd_epi16(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_madd_epi16(ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_cvtsepi16_epi8(core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_cvtsepi16_epi8(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_cvtsepi16_epi8(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm256_cvtsepi16_epi8(core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm256_mask_cvtsepi16_epi8(core.simd.long2, ushort, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm256_maskz_cvtsepi16_epi8(ushort, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_cvtusepi16_epi8(core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_cvtusepi16_epi8(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_cvtusepi16_epi8(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm256_cvtusepi16_epi8(core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm256_mask_cvtusepi16_epi8(core.simd.long2, ushort, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm256_maskz_cvtusepi16_epi8(ushort, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_cvtepi16_epi8(core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_cvtepi16_epi8(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_cvtepi16_epi8(ubyte, core.simd.long2) @nogc nothrow;
    static void _mm_mask_cvtepi16_storeu_epi8(void*, ubyte, core.simd.long2) @nogc nothrow;
    static void _mm_mask_cvtsepi16_storeu_epi8(void*, ubyte, core.simd.long2) @nogc nothrow;
    static void _mm_mask_cvtusepi16_storeu_epi8(void*, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm256_cvtepi16_epi8(core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm256_mask_cvtepi16_epi8(core.simd.long2, ushort, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm256_maskz_cvtepi16_epi8(ushort, core.simd.long4) @nogc nothrow;
    static void _mm256_mask_cvtepi16_storeu_epi8(void*, ushort, core.simd.long4) @nogc nothrow;
    static void _mm256_mask_cvtsepi16_storeu_epi8(void*, ushort, core.simd.long4) @nogc nothrow;
    static void _mm256_mask_cvtusepi16_storeu_epi8(void*, ushort, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_mask_mulhrs_epi16(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_mulhrs_epi16(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_mulhrs_epi16(core.simd.long4, ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_mulhrs_epi16(ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_mask_mulhi_epu16(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_mulhi_epu16(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_mulhi_epu16(core.simd.long4, ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_mulhi_epu16(ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_mask_mulhi_epi16(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_mulhi_epi16(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_mulhi_epi16(core.simd.long4, ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_mulhi_epi16(ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_mask_unpackhi_epi8(core.simd.long2, ushort, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_unpackhi_epi8(ushort, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_unpackhi_epi8(core.simd.long4, uint, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_unpackhi_epi8(uint, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_mask_unpackhi_epi16(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_unpackhi_epi16(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_unpackhi_epi16(core.simd.long4, ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_unpackhi_epi16(ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_mask_unpacklo_epi8(core.simd.long2, ushort, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_unpacklo_epi8(ushort, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_unpacklo_epi8(core.simd.long4, uint, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_unpacklo_epi8(uint, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_mask_unpacklo_epi16(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_unpacklo_epi16(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_unpacklo_epi16(core.simd.long4, ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_unpacklo_epi16(ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_mask_cvtepi8_epi16(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_cvtepi8_epi16(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_cvtepi8_epi16(core.simd.long4, ushort, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_cvtepi8_epi16(ushort, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_cvtepu8_epi16(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_cvtepu8_epi16(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_cvtepu8_epi16(core.simd.long4, ushort, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_cvtepu8_epi16(ushort, core.simd.long2) @nogc nothrow;
    static core.simd.double4 _mm256_maskz_and_pd(ubyte, core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.double4 _mm256_mask_and_pd(core.simd.double4, ubyte, core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.float4 _mm_maskz_andnot_ps(ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.float4 _mm_mask_andnot_ps(core.simd.float4, ubyte, core.simd.float4, core.simd.float4) @nogc nothrow;
    static core.simd.long4 _mm256_sllv_epi16(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_sllv_epi16(core.simd.long4, ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_sllv_epi16(ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_sllv_epi16(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_sllv_epi16(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_sllv_epi16(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_sll_epi16(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_sll_epi16(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_sll_epi16(core.simd.long4, ushort, core.simd.long4, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_sll_epi16(ushort, core.simd.long4, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_slli_epi16(core.simd.long2, ubyte, core.simd.long2, int) @nogc nothrow;
    static core.simd.long2 _mm_maskz_slli_epi16(ubyte, core.simd.long2, int) @nogc nothrow;
    static core.simd.long4 _mm256_mask_slli_epi16(core.simd.long4, ushort, core.simd.long4, int) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_slli_epi16(ushort, core.simd.long4, int) @nogc nothrow;
    static core.simd.long4 _mm256_srlv_epi16(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_srlv_epi16(core.simd.long4, ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_srlv_epi16(ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_srlv_epi16(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_srlv_epi16(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_srlv_epi16(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_srav_epi16(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_srav_epi16(core.simd.long4, ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_srav_epi16(ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_srav_epi16(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_srav_epi16(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_srav_epi16(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_sra_epi16(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_sra_epi16(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_sra_epi16(core.simd.long4, ushort, core.simd.long4, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_sra_epi16(ushort, core.simd.long4, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_srai_epi16(core.simd.long2, ubyte, core.simd.long2, int) @nogc nothrow;
    static core.simd.long2 _mm_maskz_srai_epi16(ubyte, core.simd.long2, int) @nogc nothrow;
    static core.simd.long4 _mm256_mask_srai_epi16(core.simd.long4, ushort, core.simd.long4, int) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_srai_epi16(ushort, core.simd.long4, int) @nogc nothrow;
    static core.simd.long2 _mm_mask_srl_epi16(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_srl_epi16(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_srl_epi16(core.simd.long4, ushort, core.simd.long4, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_srl_epi16(ushort, core.simd.long4, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_srli_epi16(core.simd.long2, ubyte, core.simd.long2, int) @nogc nothrow;
    static core.simd.long2 _mm_maskz_srli_epi16(ubyte, core.simd.long2, int) @nogc nothrow;
    static core.simd.long4 _mm256_mask_srli_epi16(core.simd.long4, ushort, core.simd.long4, int) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_srli_epi16(ushort, core.simd.long4, int) @nogc nothrow;
    static core.simd.long2 _mm_mask_mov_epi16(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_mov_epi16(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_mov_epi16(core.simd.long4, ushort, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_mov_epi16(ushort, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_mask_mov_epi8(core.simd.long2, ushort, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_mov_epi8(ushort, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_mov_epi8(core.simd.long4, uint, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_mov_epi8(uint, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_mask_set1_epi8(core.simd.long2, ushort, char) @nogc nothrow;
    static core.simd.long2 _mm_maskz_set1_epi8(ushort, char) @nogc nothrow;
    static core.simd.long4 _mm256_mask_set1_epi8(core.simd.long4, uint, char) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_set1_epi8(uint, char) @nogc nothrow;
    static core.simd.long2 _mm_loadu_epi16(const(void)*) @nogc nothrow;
    static core.simd.long2 _mm_mask_loadu_epi16(core.simd.long2, ubyte, const(void)*) @nogc nothrow;
    static core.simd.long2 _mm_maskz_loadu_epi16(ubyte, const(void)*) @nogc nothrow;
    static core.simd.long4 _mm256_loadu_epi16(const(void)*) @nogc nothrow;
    static core.simd.long4 _mm256_mask_loadu_epi16(core.simd.long4, ushort, const(void)*) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_loadu_epi16(ushort, const(void)*) @nogc nothrow;
    static core.simd.long2 _mm_loadu_epi8(const(void)*) @nogc nothrow;
    static core.simd.long2 _mm_mask_loadu_epi8(core.simd.long2, ushort, const(void)*) @nogc nothrow;
    static core.simd.long2 _mm_maskz_loadu_epi8(ushort, const(void)*) @nogc nothrow;
    static core.simd.long4 _mm256_loadu_epi8(const(void)*) @nogc nothrow;
    static core.simd.long4 _mm256_mask_loadu_epi8(core.simd.long4, uint, const(void)*) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_loadu_epi8(uint, const(void)*) @nogc nothrow;
    static void _mm_storeu_epi16(void*, core.simd.long2) @nogc nothrow;
    static void _mm_mask_storeu_epi16(void*, ubyte, core.simd.long2) @nogc nothrow;
    static void _mm256_storeu_epi16(void*, core.simd.long4) @nogc nothrow;
    static void _mm256_mask_storeu_epi16(void*, ushort, core.simd.long4) @nogc nothrow;
    static void _mm_storeu_epi8(void*, core.simd.long2) @nogc nothrow;
    static void _mm_mask_storeu_epi8(void*, ushort, core.simd.long2) @nogc nothrow;
    static void _mm256_storeu_epi8(void*, core.simd.long4) @nogc nothrow;
    static void _mm256_mask_storeu_epi8(void*, uint, core.simd.long4) @nogc nothrow;
    static ushort _mm_test_epi8_mask(core.simd.long2, core.simd.long2) @nogc nothrow;
    static ushort _mm_mask_test_epi8_mask(ushort, core.simd.long2, core.simd.long2) @nogc nothrow;
    static uint _mm256_test_epi8_mask(core.simd.long4, core.simd.long4) @nogc nothrow;
    static uint _mm256_mask_test_epi8_mask(uint, core.simd.long4, core.simd.long4) @nogc nothrow;
    static ubyte _mm_test_epi16_mask(core.simd.long2, core.simd.long2) @nogc nothrow;
    static ubyte _mm_mask_test_epi16_mask(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static ushort _mm256_test_epi16_mask(core.simd.long4, core.simd.long4) @nogc nothrow;
    static ushort _mm256_mask_test_epi16_mask(ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static ushort _mm_testn_epi8_mask(core.simd.long2, core.simd.long2) @nogc nothrow;
    static ushort _mm_mask_testn_epi8_mask(ushort, core.simd.long2, core.simd.long2) @nogc nothrow;
    static uint _mm256_testn_epi8_mask(core.simd.long4, core.simd.long4) @nogc nothrow;
    static uint _mm256_mask_testn_epi8_mask(uint, core.simd.long4, core.simd.long4) @nogc nothrow;
    static ubyte _mm_testn_epi16_mask(core.simd.long2, core.simd.long2) @nogc nothrow;
    static ubyte _mm_mask_testn_epi16_mask(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static ushort _mm256_testn_epi16_mask(core.simd.long4, core.simd.long4) @nogc nothrow;
    static ushort _mm256_mask_testn_epi16_mask(ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static ushort _mm_movepi8_mask(core.simd.long2) @nogc nothrow;
    static uint _mm256_movepi8_mask(core.simd.long4) @nogc nothrow;
    static ubyte _mm_movepi16_mask(core.simd.long2) @nogc nothrow;
    static ushort _mm256_movepi16_mask(core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_movm_epi8(ushort) @nogc nothrow;
    static core.simd.long4 _mm256_movm_epi8(uint) @nogc nothrow;
    static core.simd.long2 _mm_movm_epi16(ubyte) @nogc nothrow;
    static core.simd.long4 _mm256_movm_epi16(ushort) @nogc nothrow;
    static core.simd.long2 _mm_mask_broadcastb_epi8(core.simd.long2, ushort, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_broadcastb_epi8(ushort, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_broadcastb_epi8(core.simd.long4, uint, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_broadcastb_epi8(uint, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_broadcastw_epi16(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_broadcastw_epi16(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_broadcastw_epi16(core.simd.long4, ushort, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_broadcastw_epi16(ushort, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mask_set1_epi16(core.simd.long4, ushort, short) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_set1_epi16(ushort, short) @nogc nothrow;
    static core.simd.long2 _mm_mask_set1_epi16(core.simd.long2, ubyte, short) @nogc nothrow;
    static core.simd.long2 _mm_maskz_set1_epi16(ubyte, short) @nogc nothrow;
    static core.simd.long2 _mm_permutexvar_epi16(core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_permutexvar_epi16(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_permutexvar_epi16(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_permutexvar_epi16(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_permutexvar_epi16(ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_permutexvar_epi16(core.simd.long4, ushort, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.float8 _mm256_maskz_andnot_ps(ubyte, core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.float8 _mm256_mask_andnot_ps(core.simd.float8, ubyte, core.simd.float8, core.simd.float8) @nogc nothrow;
    static core.simd.double2 _mm_maskz_andnot_pd(ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double2 _mm_mask_andnot_pd(core.simd.double2, ubyte, core.simd.double2, core.simd.double2) @nogc nothrow;
    static core.simd.double4 _mm256_maskz_andnot_pd(ubyte, core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.double4 _mm256_mask_andnot_pd(core.simd.double4, ubyte, core.simd.double4, core.simd.double4) @nogc nothrow;
    static core.simd.long2 _mm_maskz_mullo_epi64(ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_broadcastmb_epi64(ubyte) @nogc nothrow;
    static core.simd.long4 _mm256_broadcastmb_epi64(ubyte) @nogc nothrow;
    static core.simd.long2 _mm_broadcastmw_epi32(ushort) @nogc nothrow;
    static core.simd.long4 _mm256_broadcastmw_epi32(ushort) @nogc nothrow;
    static core.simd.long2 _mm_conflict_epi64(core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_conflict_epi64(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_conflict_epi64(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_conflict_epi64(core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_conflict_epi64(core.simd.long4, ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_conflict_epi64(ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_conflict_epi32(core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_conflict_epi32(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_conflict_epi32(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_conflict_epi32(core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_conflict_epi32(core.simd.long4, ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_conflict_epi32(ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_lzcnt_epi32(core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_lzcnt_epi32(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_lzcnt_epi32(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_lzcnt_epi32(core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_lzcnt_epi32(core.simd.long4, ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_lzcnt_epi32(ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_lzcnt_epi64(core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_mask_lzcnt_epi64(core.simd.long2, ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long2 _mm_maskz_lzcnt_epi64(ubyte, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_lzcnt_epi64(core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_lzcnt_epi64(core.simd.long4, ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_lzcnt_epi64(ubyte, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_mask_mullo_epi64(core.simd.long2, ubyte, core.simd.long2, core.simd.long2) @nogc nothrow;
    static core.simd.long4 _mm256_mullo_epi64(core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_mask_mullo_epi64(core.simd.long4, ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long4 _mm256_maskz_mullo_epi64(ubyte, core.simd.long4, core.simd.long4) @nogc nothrow;
    static core.simd.long2 _mm_mullo_epi64(core.simd.long2, core.simd.long2) @nogc nothrow;
}


struct _mallocarray_t;
struct _jl_value_t;
struct _bigval_t;
