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
	assert(!ret.get!long().isNull());
	assert(ret.get!long() == 3);
}

unittest {
	jl_value_t* ret = jlEvalString("UInt8(1 + 2)");
	assert(getType(ret) == JuliaType.UInt8);
	assert(!ret.get!ubyte().isNull());
	assert(ret.get!ubyte() == 3);
}

unittest {
	jl_value_t* ret = jlEvalString("UInt16(1 + 2)");
	assert(getType(ret) == JuliaType.UInt16);
	assert(!ret.get!ushort().isNull());
	assert(ret.get!ushort() == 3);
}

unittest {
	jl_value_t* ret = jlEvalString("UInt32(1 + 2)");
	assert(getType(ret) == JuliaType.UInt32);
	assert(!ret.get!uint().isNull());
	assert(ret.get!uint() == 3);
}

unittest {
	jl_value_t* ret = jlEvalString("UInt64(1 + 2)");
	assert(getType(ret) == JuliaType.UInt64);
	assert(!ret.get!ulong().isNull());
	assert(ret.get!ulong() == 3);
}

unittest {
	jl_value_t* ret = jlEvalString("Int8(1 + 2)");
	assert(getType(ret) == JuliaType.Int8);
	assert(!ret.get!byte().isNull());
	assert(ret.get!byte() == 3);
}

unittest {
	jl_value_t* ret = jlEvalString("Int16(1 + 2)");
	assert(getType(ret) == JuliaType.Int16);
	assert(!ret.get!short().isNull());
	assert(ret.get!short() == 3);
}

unittest {
	jl_value_t* ret = jlEvalString("Int32(1 + 2)");
	assert(getType(ret) == JuliaType.Int32);
	assert(!ret.get!int().isNull());
	assert(ret.get!int() == 3);
}

unittest {
	jl_value_t* ret = jlEvalString("Int64(1 + 2)");
	assert(getType(ret) == JuliaType.Int64);
	assert(!ret.get!long().isNull());
	assert(ret.get!long() == 3);
}

unittest {
	jl_value_t* ret = jlEvalString("1 + 2.0");
	assert(getType(ret) == JuliaType.Float64);
	assert(!ret.get!double().isNull());
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
