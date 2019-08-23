module juliad.evalstringtest;

import std.format;

import juliad;

unittest {
	import std.stdio;

	jl_value_t* ret = jlEvalString("sqrt(2.0)");

	if(jl_typeis(ret, jl_float64_type)) {
    	double retUnboxed = jl_unbox_float64(ret);
		writeln(retUnboxed);
	} else if(jl_typeis(ret, jl_int32_type)) {
    	double retUnboxed = jl_unbox_float64(ret);
		writeln(retUnboxed);
	}
}

unittest {
	import std.stdio;

	jl_value_t* ret = jlEvalString("1 + 2");
	static foreach(t; genJlTypes) {{
		enum g = format(`bool i = jl_is_%s(ret);`, t);
		mixin(g);
		writeln(t, " ", i);
	}}
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
