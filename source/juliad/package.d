module juliad;

import juliad.julia;

import std.string : toStringz;

_jl_value_t* jlEvalString(string stmt) {
	jl_init__threading();
	scope(exit) {
		jl_atexit_hook(0);
	}
	return jl_eval_string(stmt.toStringz());
}
