module juliad.evalstringtest;

import std.format;
import std.typecons : Nullable;

import juliad;
import juliad.types;

unittest {
	import std.stdio;

	jl_value_t* ret = jlEvalString("sqrt(2.0)");
	Nullable!JuliaType t = ret.getType();
	assert(!t.isNull() && t.get() == JuliaType.Float64);

	auto r = ret.get!double();
	if(!r.isNull()) {
		writeln(r.get());
	}
}

unittest {
	import std.stdio;

	jl_value_t* ret = jlEvalString("1 + 2");
	if(jl_is_int32(ret)) {
    	double retUnboxed = jl_unbox_int32(ret);
		writeln(retUnboxed);
	} else if(jl_is_int64(ret)) {
    	double retUnboxed = jl_unbox_int64(ret);
		writeln(retUnboxed);
	} else if(jl_typeis(ret, jl_float64_type)) {
    	double retUnboxed = jl_unbox_float64(ret);
		writeln(retUnboxed);
	} else if(jl_typeis(ret, jl_float32_type)) {
    	double retUnboxed = jl_unbox_float32(ret);
		writeln(retUnboxed);
	}
}
