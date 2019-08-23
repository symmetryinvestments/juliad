module juliad.types;

import juliad.julia;

struct JuliaToDType(T) {
}

enum JuliaType {
	Uniontype,
	Unionall,
	Typename,
	@JuliaToDType!byte Int8,
	@JuliaToDType!short Int16,
	@JuliaToDType!int Int32,
	@JuliaToDType!long Int64,
	@JuliaToDType!ubyte Uint8,
	@JuliaToDType!ushort Uint16,
	@JuliaToDType!uint Uint32,
	@JuliaToDType!ulong Uint64,
	@JuliaToDType!bool Bool,
	Symbol,
	Ssavalue,
	Expr,
	Globalref,
	Gotonode,
	Pinode,
	Phinode,
	Phicnode,
	Upsilonnode,
	Quotenode,
	Newvarnode,
	Method_instance,
	Code_info,
	Method,
	Module,
	Task,
	@JuliaToDType!String String,
	@JuliaToDType!float Float16,
	@JuliaToDType!float Float32,
	@JuliaToDType!double Float64
}

string[] buildTypeStrings() pure @safe {
	import std.algorithm.iteration : map;
	import std.traits : EnumMembers;
	import std.array : array;
	import std.string : toLower;
	import std.conv : to;

	return [EnumMembers!JuliaType]
		.map!(t => to!string(t))
		.map!(t => t.toLower())
		.array;
}

enum string[] typeStrings = buildTypeStrings();

private string genJlIsType(string type) {
	import std.format : format;
	string s = 
`bool jl_is_%1$s(_jl_value_t* v) {
	return jl_typeis(v, jl_%1$s_type);
}`;
	return format(s, type);
}

static foreach(t; typeStrings) {
	mixin(genJlIsType(t));
}

//#define jl_astaggedvalue(v)                                             \
//    ((jl_taggedvalue_t*)((char*)(v) - sizeof(jl_taggedvalue_t)))

jl_taggedvalue_t* jl_astaggedvalue(jl_value_t* v) {
	char* vc = cast(char*)v;
	char* mtv = vc - jl_taggedvalue_t.sizeof;
	return cast(jl_taggedvalue_t*)mtv;
}


//#define jl_valueof(v)                                           \
//    ((jl_value_t*)((char*)(v) + sizeof(jl_taggedvalue_t)))

jl_value_t* jl_valueof(jl_taggedvalue_t* tv) {
	char* vc = cast(char*)tv;
	char* mtv = vc + jl_taggedvalue_t.sizeof;
	return cast(jl_value_t*)mtv;
}

//#define jl_typeof(v)                                                    \
//    ((jl_value_t*)(jl_astaggedvalue(v)->header & ~(uintptr_t)15))

jl_value_t* jl_typeof(jl_value_t* v) {
	auto h = jl_astaggedvalue(v).header;
	uintptr_t ft = ~cast(uintptr_t)15;
	uintptr_t and = h & ft;
	void* vp = cast(void*)and;
	return cast(jl_value_t*)vp;
}

//#define jl_typeis(v,t) (jl_typeof(v)==(jl_value_t*)(t))
bool jl_typeis(jl_value_t* v, jl_datatype_t* dt) {
	return jl_typeof(v) is cast(jl_value_t*)dt;
}

bool jl_is_nothing(jl_value_t* v) {
	return v == jl_nothing;
}

T get(T)(jl_value_t* v) {
	static foreach(em; [EnumMembers!JuliaType]) {{
		enum uda = __traits(getAttributes, em);	
		static if(uda.length > 0 && is(uda == JuliaToDType!F, F)) {
			alias DT = F;
		}
	}}
}
