
Instructions
============

install dpp (allows you to include C headers in a D program):
	dub fetch dpp
	dub build dpp
	[link d++ executable in the dpp/bin directory so it will be found on your path]

./build.sh
./juliahw

The above works on Arch Linux and might require changes on other linux variants.
Untested on Windows.

This repository simply shows you how to call the C API from D without manually translating
julia.h

Later I hope it will be possible to create a high level wrapper to write D functions
callable from Julia and to call Julia from D in an idiomatic style with code generation
taking care of the type conversion


