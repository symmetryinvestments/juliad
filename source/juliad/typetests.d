module juliad.typetests;

import std.conv : to;
import std.format : format;
import std.math : approxEqual;
import std.meta : AliasSeq;

import juliad;
import juliad.types;

unittest {
	jl_value_t* ret = jlEvalString("1 + 2");
	assert(getType(ret) == JuliaType.Int64);
	assert(!ret.fromJuliaTo!long().isNull());
	assert(ret.fromJuliaTo!long() == 3);
}

unittest {
	jl_value_t* ret = jlEvalString("UInt8(1 + 2)");
	assert(getType(ret) == JuliaType.UInt8);
	assert(!ret.fromJuliaTo!ubyte().isNull());
	assert(ret.fromJuliaTo!ubyte() == 3);
}

unittest {
	jl_value_t* ret = jlEvalString("UInt16(1 + 2)");
	assert(getType(ret) == JuliaType.UInt16);
	assert(!ret.fromJuliaTo!ushort().isNull());
	assert(ret.fromJuliaTo!ushort() == 3);
}

unittest {
	jl_value_t* ret = jlEvalString("UInt32(1 + 2)");
	assert(getType(ret) == JuliaType.UInt32);
	assert(!ret.fromJuliaTo!uint().isNull());
	assert(ret.fromJuliaTo!uint() == 3);
}

unittest {
	jl_value_t* ret = jlEvalString("UInt64(1 + 2)");
	assert(getType(ret) == JuliaType.UInt64);
	assert(!ret.fromJuliaTo!ulong().isNull());
	assert(ret.fromJuliaTo!ulong() == 3);
}

unittest {
	jl_value_t* ret = jlEvalString("Int8(1 + 2)");
	assert(getType(ret) == JuliaType.Int8);
	assert(!ret.fromJuliaTo!byte().isNull());
	assert(ret.fromJuliaTo!byte() == 3);
}

unittest {
	jl_value_t* ret = jlEvalString("Int16(1 + 2)");
	assert(getType(ret) == JuliaType.Int16);
	assert(!ret.fromJuliaTo!short().isNull());
	assert(ret.fromJuliaTo!short() == 3);
}

unittest {
	jl_value_t* ret = jlEvalString("Int32(1 + 2)");
	assert(getType(ret) == JuliaType.Int32);
	assert(!ret.fromJuliaTo!int().isNull());
	assert(ret.fromJuliaTo!int() == 3);
}

unittest {
	jl_value_t* ret = jlEvalString("Int64(1 + 2)");
	assert(getType(ret) == JuliaType.Int64);
	assert(!ret.fromJuliaTo!long().isNull());
	assert(ret.fromJuliaTo!long() == 3);
}

unittest {
	jl_value_t* ret = jlEvalString("1 + 2.0");
	assert(getType(ret) == JuliaType.Float64);
	assert(!ret.fromJuliaTo!double().isNull());
	assert(approxEqual(ret.fromJuliaTo!double(), 3.0));
}

unittest {
	jl_value_t* ret = jlEvalString("true");
	assert(getType(ret) == JuliaType.Bool);
	assert(ret.fromJuliaTo!bool());
}

unittest {
	jl_value_t* ret = jlEvalString("false");
	assert(getType(ret) == JuliaType.Bool);
	assert(!ret.fromJuliaTo!bool());
}

unittest {
	jl_value_t* ret = jlEvalString("\"hello world\"");
	assert(getType(ret) == JuliaType.String);
	assert(ret.fromJuliaTo!string() == "hello world");
}

private jl_value_t* identiyTest(V)(V v) {
	jl_function_t *func = jl_get_function(jl_base_module, "identity");
	jl_value_t *argument = toJulia(v);
	return jl_call1(func, argument);
}

unittest {
	jl_value_t* ret = identiyTest(13.37);
	assert(getType(ret) == JuliaType.Float64);
	assert(!ret.fromJuliaTo!double().isNull());
	double rslt = ret.fromJuliaTo!double();
	assert(approxEqual(rslt, 13.37), format("%s", rslt));
}

unittest {
	jl_value_t* ret = identiyTest(true);
	assert(getType(ret) == JuliaType.Bool);
	assert(!ret.fromJuliaTo!bool().isNull());
	bool rslt = ret.fromJuliaTo!bool();
	assert(rslt);
}

unittest {
	jl_value_t* ret = identiyTest(false);
	assert(getType(ret) == JuliaType.Bool);
	assert(!ret.fromJuliaTo!bool().isNull());
	bool rslt = ret.fromJuliaTo!bool();
	assert(!rslt);
}

unittest {
	foreach(T; AliasSeq!(byte,short,int,long,ubyte,ushort,uint,ulong)) {
		T val = cast(T)13;
		jl_value_t* ret = identiyTest(val);
		assert(!ret.fromJuliaTo!T().isNull());
		T rslt = ret.fromJuliaTo!T();
		assert(rslt == val, format("%s %s", rslt, val));
	}
}

unittest {
	foreach(T; AliasSeq!(string,wstring,dstring)) {
		T exp = to!T("Hello World");
		jl_value_t* ret = identiyTest(exp);
		assert(getType(ret) == JuliaType.String, 
				format("%s %s", getType(ret), JuliaType.String));
		assert(!ret.fromJuliaTo!string().isNull(), T.stringof);
		T rslt = to!T(ret.fromJuliaTo!string());
		assert(rslt == exp);
	}
}

unittest {
	auto ds = [1.0, 2.0, 3.0];
	auto dj = toJulia(ds);
	jl_function_t *func = jl_get_function(jl_base_module, "sum");
	jl_value_t* ret = jl_call1(func, cast(jl_value_t*)dj);

	assert(getType(ret) == JuliaType.Float64);
	assert(!ret.fromJuliaTo!double().isNull());
	double rslt = ret.fromJuliaTo!double();
	assert(approxEqual(rslt, 6.0));
}

unittest {
	auto ds = [1, 2, 3];
	auto dj = toJulia(ds);
	jl_function_t *func = jl_get_function(jl_base_module, "sum");
	jl_value_t* ret = jl_call1(func, cast(jl_value_t*)dj);

	assert(getType(ret) == JuliaType.Int64);
	assert(!ret.fromJuliaTo!long().isNull());
	double rslt = ret.fromJuliaTo!long();
	assert(rslt == 6);
}
