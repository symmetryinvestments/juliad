module juliad.evalstringtest;

import std.format : format;
import std.typecons : Nullable;
import std.math : approxEqual;

import juliad;
import juliad.types;
import juliad.shims;
import juliad.eval;

unittest {
	jl_value_t* ret = jlEvalString("sqrt(2.0)");
	Nullable!JuliaType t = ret.getType();
	assert(!t.isNull() && t.get() == JuliaType.Float64);

	auto r = ret.fromJuliaTo!double();
	assert(!r.isNull());
	assert(approxEqual(r.get(), 1.41421));
}

unittest {
	jl_value_t* ret = jlEvalString("sum([1,2,3,4])");
	jl_gc_push1(&ret);
	Nullable!JuliaType t = ret.getType();
	assert(!t.isNull() && t.get() == JuliaType.Int64);

	auto r = ret.fromJuliaTo!long();
	assert(!r.isNull());
	assert(r == 10, format("%s", r));
	jl_gc_pop();
}
