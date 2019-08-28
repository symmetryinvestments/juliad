libjuliadshim: shim.o
	ar rcs libjuliadshim.a shim.o

shim.o: shim.c
	$(CC) -O -c shim.c -fPIC -I/usr/include/julia -L/usr/lib --define JULIA_ENABLE_THREADING=1 
