module juliad.eval;

import std.string : toStringz, fromStringz;

import juliad.julia;

jl_value_t* jlEvalString(string stmt) {
	import std.conv : to;
	jl_init__threading();
	scope(exit) {
		jl_atexit_hook(0);
	}
	jl_value_t* ret = jl_eval_string(stmt.toStringz());
	if(jl_exception_occurred()) {
		throw new Exception(
			to!string(jl_typeof_str(jl_exception_occurred()).fromStringz));
	}
	return ret;
}
