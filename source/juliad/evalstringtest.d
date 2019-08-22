module juliad.evalstringtest;
import juliad;

unittest {
	import std.stdio;

	_jl_value_t* ret = jlEvalString("4 + 5");
	if(jl_typeis(ret, jl_float64_type)) {
    	double retUnboxed = jl_unbox_float64(ret);
		writeln(retUnboxed);
	}
}

