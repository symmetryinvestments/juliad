module juliad;

//\(.*\)core.simd.\(char\|byte\|ubyte\|int\|float\|double\|long\|ushort\|short\|uint\|ulong\)\(2\|4\|8\|16\|32\|64\)/\1core.simd.\2\3

public import juliad.julia;

import std.string : toStringz;

_jl_value_t* jlEvalString(string stmt) {
	jl_init__threading();
	scope(exit) {
		jl_atexit_hook(0);
	}
	return jl_eval_string(stmt.toStringz());
}
