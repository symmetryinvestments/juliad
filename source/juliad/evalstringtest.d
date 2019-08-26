module juliad.evalstringtest;

import std.format;
import std.typecons : Nullable;
import std.math : approxEqual;

import juliad;
import juliad.types;

unittest {
	import std.stdio;

	jl_value_t* ret = jlEvalString("sqrt(2.0)");
	Nullable!JuliaType t = ret.getType();
	assert(!t.isNull() && t.get() == JuliaType.Float64);

	auto r = ret.get!double();
	assert(!r.isNull());
	assert(approxEqual(r.get(), 1.41421));
}

unittest {
	jl_value_t* ret = jlEvalString("1 + 2");
	assert(getType(ret) == JuliaType.Int64);
}

unittest {
	jl_value_t* ret = jlEvalString("1 + 2.0");
	assert(getType(ret) == JuliaType.Float64);
}
