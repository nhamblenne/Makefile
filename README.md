# A simple Makefile

This is a simple Makefile I'm using when experimenting with C++. As my goal
is experimenting,

- it has no support for installing,
- it has no support for other platforms than Unix one; 
- it depends on GNU Make;

- it has support for various toolchains: various versions of GCC and CLang
  and Oracle CC. It is easy to add additional toolchains or to find the
  compilers somewhere else than in the path if desired.

- it has support for automatic dependency discovery and for automatic
  rebuild when you change the toolchain, the C++ standard or the build mode
  (debug, release).

## Very simple usage

Just type

    make -f path/to/simple.mk
    
and it will build an executable for each `.cpp` file in the current
directory. Alternatively you can create a `Makefile` with

    include path/to/simple.mk
    
as content and avoid to have to specify `-f path/to/simple.mk`.  Such
`Makefile` is needed for more complex usage and will be assumed here after.

You can also create a single executable by giving its name:

    make foo
    
You can be explicit that you want all the executables:

    make all
    
You can create and execute with a single command:

    make test-foo
    
And you can do that for all the executables:

    make test-all
    
My interest with this was to be able to test easily variations. I've three
axis for these variations:

- the mode: debug or release
- the standard to use for C++: cxx98, cxx11, cxx14, cxx17 and cxx20
- the toolchain: gcc, gcc7,... gcc10, clang, clang6,... clang10, sun

When such variation is specified, it is stored, so the next `make` command
will use the latest variant used and will remake what has been build with
the previous variant.

To make a release build of `foo` just do:

    make MODE=release foo
    
To test everything in debug mode, compiled for C++11 with the Oracle
compiler:

    make MODE=debug TOOLCHAIN=sun STD=cxx11 test-all
    
If one execution fail, and you modify the code, you can test your new
version with:

    make test-foo
    
But you can also do

    make test-all
    
as `make` won't try to rerun a test if the executable hasn't been modified
since the last time it was run.

## Executables build from several sources

To avoid associating one executable per `.cpp`, you have to give the list
of executables to build, and to do so before including `simple.mk`. You
then gives the `.o` on which the executables depends, one of which must
have the same name as the executable. For instance:


    EXES=ex1 ex2
    
    include ../MakeRules/simple.mk
    
    ex1: ex1.o aux1.o aux2.o
    ex2: ex2.o aux1.o aux3.o

The `all` and `test-*` targets will work as usual. Dependencies are
detected automatically, so modifying an header will trigger the
recompilation of the object and the executables which depend on it and
nothing else.

## Libraries

`.a` and `.so` targets are available. So you can experiment will libraries:

    EXES=ex1
    
    include ../MakeRules/simple.mk
    
    slib.a: aux1.o
    dlib.so: aux2.o
    
    ex1: ex1.o slib.a dlib.so
    
The `-fPIC` argument is provided as needed. For the dynamic library you'll
have to get the `LD_LIBRARY_PATH` set so that it is found. Or use the
linker option so that it is found. Putting that in the `Makefile` is easy,
but may need a little attention to quoting. For instance adding this line

    ex1: LDFLAGS+=-Wl,-rpath,\$$ORIGIN

will allow to find the dynamic library in the same directory as the
executable, even if the executable is moved.  This is showing a target
specific variable definition, you can define it globally if you have only
one executable or if all of them need the same value.

## Variables

Several variables are available to be more in control of the build. They
can be defined on the `make` command line, before or after having included
`simple.mk` (the only variable which can't be defined after the inclusion
is `EXES`).

- `EXES` gives the list of executables. It can't be defined after including
  `simple.mk` as its value is used before.
  
- `CXXWARNFLAGS` is used for the warning related flags.

- `CXXSTDFLAGS` is used for the standard definition flag.

- `CXXSHAREDFLAGS` is added when building objects for shared libraries.

- `CXXBASEFLAGS` is used for the other compilation flags asked by the
  toolchain, usually those related to the `MODE`.
  
- `CXXFLAGS` is build from `CXXBASEFLAGS`, `CXXWARNFLAGS` and
  `CXXSTDFLAGS`.
  
- `CPPMODEFLAGS` is the mode dependend, toolchain independend flags passed
  when compiling.
  
- `CPPBASEFLAGS` is the toolchain independend flgas passed only when
  compiling.
  
- `CPPLAGS` is build from `CPPBASEFLAGS` and `CPPMODEFLAGS`.

- `LDBASEFLAGS` is the toolchain dependend flags passed when linking.

- `LDFLAGS` is build from `LDBASEFLAGS`.

- `LDBASELIBS` is the toolchain dependend list of libraries to link.

- `LDLIBS` is build from `LDBASELIBS`.

There are variables `CXXNIHFLAGS`, `CPPNIHFLAGS`, `LDNIHFLAGS` and
`LDNIHLIBS` which contain the value for `CXXFLAGS`, `CPPFLAGS`, `LDFLAGS`
and `LDLIBS`. They exist so that it is possible to control the order when
building new value for the final variables. For instance if you wanted to
add an include directory `before` before those mandated by the toolchain an
another `after` after them, you could use:

    CPPFLAGS=-Ibefore $(CPPNIHFLAGS) $after

