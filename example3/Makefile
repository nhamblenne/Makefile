EXES=ex1

include ../MakeRules/simple.mk

libs.a: aux1.o
libd.so: aux2.o

ex1: LDFLAGS+=-Wl,-rpath,\$$ORIGIN

ex1: ex1.o libs.a libd.so

.libs: libs.a libd.so
	touch .libs

clean::
	-rm *.a
	-rm *.so
	-rm .libs
