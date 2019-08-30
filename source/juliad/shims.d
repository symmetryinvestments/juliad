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

// #define jl_array_ndims(a) ((int32_t)(((jl_array_t*)a)->flags.ndims))
uint jl_array_ndims(jl_value_t* a) {
	return jl_array_ndims(cast(jl_array_t*)a);
}

uint jl_array_ndims(jl_array_t* a) {
	auto t = (*a).flags.ndims;
	return cast(uint)t;
}


// #define jl_typeof(v)                                                    \
//     ((jl_value_t*)(jl_astaggedvalue(v)->header & ~(uintptr_t)15))
jl_value_t* jl_typeof(jl_value_t* t) {
	return cast(jl_value_t*)(jl_astaggedvalue(t).header & ~cast(uint)15);
}

//#define jl_astaggedvalue(v)                                             \
//    ((jl_taggedvalue_t*)((char*)(v) - sizeof(jl_taggedvalue_t)))

jl_taggedvalue_t* jl_astaggedvalue(jl_value_t *v) {
	return cast(jl_taggedvalue_t*)((cast(char*)v) - jl_taggedvalue_t.sizeof);
}

// #define jl_tparam0(t)  jl_svecref(((jl_datatype_t*)(t))->parameters, 0)
jl_value_t* jl_tparam0(jl_array_t* t) {
	return jl_tparam0(cast(jl_value_t*)t);
}

jl_value_t* jl_tparam0(jl_value_t* t) {
	return jl_svecref((cast(jl_datatype_t*)t).parameters, 0);
}

bool jl_is_array_type(jl_value_t* t) {
    return jl_is_datatype(t) &&
            (cast(jl_datatype_t*)t).name == jl_array_typename;
}

//#define jl_svec_len(t)              (((jl_svec_t*)(t))->length)
size_t jl_svec_len(jl_svec_t* t) {
	return t.length;
}

//#define jl_svec_data(t) ((jl_value_t**)((char*)(t) + sizeof(jl_svec_t)))
jl_value_t** jl_svec_data(jl_svec_t* t) {
	return cast(jl_value_t**)((cast(char*)t) + jl_svec_t.sizeof);
}

jl_value_t *jl_svecref(jl_svec_t* t, size_t i) {
    //assert(jl_typeis(cast(jl_value_t*)t, jl_simplevector_type));
    //assert(i < jl_svec_len(t));
    return jl_svec_data(t)[i];
}

// #define jl_is_datatype(v)    jl_typeis(v,jl_datatype_type)
bool jl_is_datatype(jl_value_t* t) {
	return jl_typeis(t, jl_datatype_type);
}


// #define jl_typeis(v,t) (jl_typeof(v)==(jl_value_t*)(t))
bool jl_typeis(jl_value_t* v, jl_datatype_t* t) {
	return jl_typeof(v) == cast(jl_value_t*)t;
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

/*extern(C) {
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
}*/
void jl_gc_push1(jl_value_t** arg) {
	void*[] __gc_stkf = 
	    [ cast(void*)3, cast(void*)jl_get_ptls_states().pgcstack
	    , cast(void*)arg ];
	jl_get_ptls_states().pgcstack = cast(jl_gcframe_t*)__gc_stkf;
}

void jl_gc_pop() {
	jl_get_ptls_states().pgcstack = jl_get_ptls_states().pgcstack.prev;
}

string getErrorString() {
	import std.conv : to;
	import std.string : fromStringz;
	return to!string(jl_typeof_str(jl_exception_occurred()).fromStringz);
}
