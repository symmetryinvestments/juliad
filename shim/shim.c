#include <julia.h>

void jl_gc_push1(jl_value_t** arg) {
	JL_GC_PUSH1(arg);
}
void jl_gc_push2(jl_value_t** arg, jl_value_t** arg1) {
	JL_GC_PUSH2(arg, arg1);
}

void jl_gc_push3(jl_value_t** arg, jl_value_t** arg1, jl_value_t** arg2) {
	JL_GC_PUSH3(arg, arg1, arg2);
}

void jl_gc_push4(jl_value_t** arg, jl_value_t** arg1, jl_value_t** arg2, 
		jl_value_t** arg3) 
{
	JL_GC_PUSH4(arg, arg1, arg2, arg3);
}

void jl_gc_push5(jl_value_t** arg, jl_value_t** arg1, jl_value_t** arg2, 
		jl_value_t** arg3, jl_value_t** arg4) 
{
	JL_GC_PUSH5(arg, arg1, arg2, arg3, arg4);
}

void jl_gc_push6(jl_value_t** arg, jl_value_t** arg1, jl_value_t** arg2, 
		jl_value_t** arg3, jl_value_t** arg4, jl_value_t** arg5) 
{
	JL_GC_PUSH6(arg, arg1, arg2, arg3, arg4, arg5);
}

void jl_gc_pop() {
	JL_GC_POP();
}
