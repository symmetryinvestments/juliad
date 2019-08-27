module juliad.types;

import std.traits : EnumMembers;
import std.array : array;
import std.traits : isSomeString;
import std.format : format;
import std.string : toLower;
import std.typecons : nullable, Nullable;
import std.conv : to;

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
	@JuliaToDType!ubyte UInt8,
	@JuliaToDType!ushort UInt16,
	@JuliaToDType!uint UInt32,
	@JuliaToDType!ulong UInt64,
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
	@JuliaToDType!string String,
	@JuliaToDType!float Float16,
	@JuliaToDType!float Float32,
	@JuliaToDType!double Float64
}

pragma(msg, __traits(getAttributes, __traits(getMember, JuliaType, "String")));

string[] buildTypeStrings() pure @safe {
	import std.algorithm.iteration : map;

	return [EnumMembers!JuliaType]
		.map!(t => to!string(t))
		.map!(t => t.toLower())
		.array;
}

enum string[] typeStrings = buildTypeStrings();

private string genJlIsType(string type) {
	string s = 
`bool jl_is_%1$s(_jl_value_t* v) {
	return jl_typeis(v, jl_%1$s_type);
}`;
	return format(s, type);
}

static foreach(t; typeStrings) {
	mixin(genJlIsType(t));
}

jl_function_t* jl_get_function(jl_module_t* m, string name) {
	import std.string : toStringz;
	return cast(jl_function_t*)jl_get_global(m, jl_symbol(toStringz(name)));
}

Nullable!JuliaType getType(jl_value_t* v) {
	enum ems = [EnumMembers!JuliaType];
	static foreach(idx, t; typeStrings) {{
		enum s = format(`bool i = jl_is_%s(v);`, t);
		mixin(s);
		if(i) {
			return nullable(ems[idx]);
		}
	}}
	return Nullable!(JuliaType).init;
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

JuliaType dTypeToJuliaType(T)() {
	JuliaType ret;
	static foreach(em; EnumMembers!JuliaType) {{
		enum emStr = to!string(em);
		alias emMem = __traits(getMember, JuliaType, emStr);
		static if(__traits(getAttributes, emMem).length > 0) {{
			alias uda = __traits(getAttributes, emMem)[0];
			static if(is(uda : JuliaToDType!F, F)) {
				static if(is(T == F)) {
					ret = em;
					goto retLabel;
				}
			}
		}}
	}}
	retLabel:
	return ret;
}

unittest {
	enum JuliaType d = dTypeToJuliaType!(double);
	static assert(d == JuliaType.Float64, format("%s", d));
}

unittest {
	enum JuliaType d = dTypeToJuliaType!(string);
	static assert(d == JuliaType.String, format("%s", d));
}

Nullable!T get(T)(jl_value_t* v) if(!isSomeString!T) {
	Nullable!JuliaType jt = getType(v);
	if(jt.isNull()) {
		return Nullable!(T).init;
	}

	enum JuliaType djt = dTypeToJuliaType!(T);
	return jt.get() == djt 
		? getImpl!(T, djt)(v)
		: Nullable!(T).init;
}

Nullable!T get(T)(jl_value_t* v) if(isSomeString!T) {
	import std.string : fromStringz;

	Nullable!JuliaType jt = getType(v);
	if(jt.isNull()) {
		return Nullable!(T).init;
	}

	enum JuliaType djt = dTypeToJuliaType!(T);
	return jt.get() == djt 
		? nullable(to!T(fromStringz(jl_string_ptr(v))).idup)
		: Nullable!(T).init;
}

private Nullable!T getImpl(T, JuliaType jt)(jl_value_t* v) {
	Nullable!T ret;
	enum emStr = to!string(jt);
	alias emMem = __traits(getMember, JuliaType, emStr);
	static if(__traits(getAttributes, emMem).length > 0) {{
		alias uda = __traits(getAttributes, emMem)[0];
		static if(is(uda : JuliaToDType!F, F)) {{
			static if(is(F == bool)) {
				enum s = format("ret = nullable(to!bool(jl_unbox_%s(v)));", 
						emStr.toLower());
			} else {
				enum s = format("ret = nullable(jl_unbox_%s(v));", 
						emStr.toLower());
			}
			mixin(s);
		}}
	}}
	return ret;	
}

jl_value_t* toJulia(V)(V v) if(!isSomeString!V) {
	jl_value_t* ret;
	enum JuliaType djt = dTypeToJuliaType!(V);
	enum s = format("ret = jl_box_%s(v);", 
			to!string(djt).toLower());
	mixin(s);
	return ret;
}
