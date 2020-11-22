# This example relies on the libraries of example3 to show how to
# add more complex variables modifications. It won't try to rebuild
# the libraries if they are out of date.
# This show how to add more things to clean with a double colon.

include ../MakeRules/simple.mk

ex1: CPPFLAGS+=-I../example3
ex1: LDFLAGS+=-L../example3 -Wl,-rpath,\$$ORIGIN/../example3
ex1: LDLIBS=-ls -ld $(LDNIHLIBS)
ex1: ex1.cpp .libs

.libs: ../example3/libd.so ../example3/libs.a
	touch .libs

clean::
	-rm .libs
