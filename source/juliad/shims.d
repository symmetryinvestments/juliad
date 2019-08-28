module juliad.shims;

import std.stdio;

import juliad.julia;

// #define jl_array_len(a)   (((jl_array_t*)(a))->length)
size_t jl_array_len(jl_value_t* a) {
	return jl_array_len(cast(jl_array_t*)a);
}

size_t jl_array_len(jl_array_t* a) {
	return a.length;
}

// #define jl_array_data(a)  ((void*)((jl_array_t*)(a))->data)
void* jl_array_data(jl_value_t* a) {
	return jl_array_data(cast(jl_array_t*)a);
}

void* jl_array_data(jl_array_t* a) {
	return cast(void*)a.data;
}

// #define jl_array_dim(a,i) ((&((jl_array_t*)(a))->nrows)[i])
size_t jl_array_dim(jl_value_t* a, size_t dim) {
	jl_array_t* arr = cast(jl_array_t*)a;
	return jl_array_dim(arr, dim);
}

size_t jl_array_dim(jl_array_t* a, size_t dim) {
	size_t* r = &(a.nrows);
	return r[dim];
}

// #define jl_pgcstack (jl_get_ptls_states()->pgcstack)
//_jl_gcframe_t* jl_pgcstack() {
//	return jl_get_ptls_states().pgcstack;
//}

//void JL_GC_PUSH1(jl_value_t* arg1) {
//	void*[] __gc_stkf = 
//	    [ cast(void*)3, cast(void*)jl_get_ptls_states().pgcstack
//	    , cast(void*)arg1 ];
//	jl_get_ptls_states().pgcstack = cast(jl_gcframe_t*)__gc_stkf;
//}

extern(C) {
void jl_gc_push1(jl_value_t** arg);
void jl_gc_push2(jl_value_t** arg, jl_value_t** arg1);
void jl_gc_push3(jl_value_t** arg, jl_value_t** arg1, jl_value_t** arg2);
void jl_gc_push4(jl_value_t** arg, jl_value_t** arg1, jl_value_t** arg2, 
		jl_value_t** arg3);
void jl_gc_push5(jl_value_t** arg, jl_value_t** arg1, jl_value_t** arg2, 
		jl_value_t** arg3, jl_value_t** arg4);
void jl_gc_push6(jl_value_t** arg, jl_value_t** arg1, jl_value_t** arg2, 
		jl_value_t** arg3, jl_value_t** arg4, jl_value_t** arg5);
void jl_gc_pop();
}

string getErrorString() {
	import std.conv : to;
	import std.string : fromStringz;
	return to!string(jl_typeof_str(jl_exception_occurred()).fromStringz);
}
