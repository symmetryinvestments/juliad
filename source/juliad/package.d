module juliad;

//\(.*\)core.simd.\(char\|byte\|ubyte\|int\|float\|double\|long\|ushort\|short\|uint\|ulong\)\(2\|4\|8\|16\|32\|64\)/\1core.simd.\2\3

public import juliad.julia;

import std.string : toStringz;

//#define jl_astaggedvalue(v)                                             \
//    ((jl_taggedvalue_t*)((char*)(v) - sizeof(jl_taggedvalue_t)))

jl_taggedvalue_t* jl_astaggedvalue(jl_value_t* v) {
	char* vc = cast(char*)v;
	char* mtv = vc - jl_taggedvalue_t.sizeof;
	return cast(jl_taggedvalue_t*)mtv;
}


//#define jl_valueof(v)                                           \
//    ((jl_value_t*)((char*)(v) + sizeof(jl_taggedvalue_t)))

jl_value_t *jl_valueof(jl_taggedvalue_t* tv) {
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
bool jl_typeis(_jl_value_t* v, jl_datatype_t* dt) {
	return jl_typeof(v) is cast(jl_value_t*)dt;
}

bool jl_is_nothing(jl_value_t* v) {
	return v == jl_nothing;
}

_jl_value_t* jlEvalString(string stmt) {
	jl_init__threading();
	scope(exit) {
		jl_atexit_hook(0);
	}
	return jl_eval_string(stmt.toStringz());
}

private string genJlIsType(string type) {
	import std.format : format;
	string s = 
`bool jl_is_%1$s(_jl_value_t* v) {
	return jl_typeis(v, jl_%1$s_type);
}`;
	return format(s, type);
}

enum string[] genJlTypes = [
	"uniontype", "unionall", "typename", "int8",
	"int16", "int32", "int64", "uint8", "uint16", "uint32",
	"uint64", "bool", "symbol", "ssavalue", "expr", "globalref",
	"gotonode", "pinode", "phinode", "phicnode", "upsilonnode",
	"quotenode", "newvarnode", "method_instance",
	"code_info", "method", "module", "task", "string",
];

static foreach(t; genJlTypes) {
	mixin(genJlIsType(t));
}


//slot(v)        (jl_typeis(v,jl_slotnumber_type) || jl_typeis(v,jl_typedslot_type))
