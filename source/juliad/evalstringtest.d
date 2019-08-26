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
	assert(ret.get!long() == 3);
}

unittest {
	jl_value_t* ret = jlEvalString("1 + 2.0");
	assert(getType(ret) == JuliaType.Float64);
	assert(approxEqual(ret.get!double(), 3.0));
}

unittest {
	jl_value_t* ret = jlEvalString("true");
	assert(getType(ret) == JuliaType.Bool);
	assert(ret.get!bool());
}

unittest {
	jl_value_t* ret = jlEvalString("false");
	assert(getType(ret) == JuliaType.Bool);
	assert(!ret.get!bool());
}

unittest {
	jl_value_t* ret = jlEvalString("\"hello world\"");
	assert(getType(ret) == JuliaType.String);
	assert(ret.get!string() == "hello world");
}
