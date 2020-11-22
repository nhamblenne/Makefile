#######################################################################
# simple.mk
# Copyright (c) 2020 Nicolas Ivan Hamblenne
#######################################################################

all:

NIH_TOOLCHAIN:=$(shell [ -f .last-toolchain ] && cat .last-toolchain || echo gcc10)
NIH_MODE:=$(shell [ -f .last-mode ] && cat .last-mode || echo debug)
NIH_STD:=$(shell [ -f .last-std ] && cat .last-std || echo cxx17)

TOOLCHAIN?=$(NIH_TOOLCHAIN)
MODE?=$(NIH_MODE)
STD?=$(NIH_STD)

###########################################################################
# GCC toolchains
###########################################################################

CXX_gcc=g++
CXXSHARED_gcc=$(CXX) -shared

CXXBASEFLAGS_gcc_debug=-g
CXXBASEFLAGS_gcc_release=-O2
CXXBASEFLAGS_gcc=-MD $(CXXBASEFLAGS_gcc_$(MODE))

CXXWARNFLAGS_gcc=-Wall -Wextra

CXXSTDFLAGS_gcc_cxx98=-std=c++98
CXXSTDFLAGS_gcc_cxx11=-std=c++11
CXXSTDFLAGS_gcc_cxx14=-std=c++14
CXXSTDFLAGS_gcc_cxx17=-std=c++17
CXXSTDFLAGS_gcc_cxx20=-std=c++20
CXXSTDFLAGS_gcc=$(CXXSTDFLAGS_gcc_$(STD))

CXXSHAREDFLAGS_gcc=-fPIC

CXX_gcc7=g++-7
CXXSHARED_gcc7=$(CXXSHARED_gcc)
CXXBASEFLAGS_gcc7=$(CXXBASEFLAGS_gcc)
CXXWARNFLAGS_gcc7=$(CXXWARNFLAGS_gcc)
CXXSTDFLAGS_gcc7_cxx20=$(error C++20 is not supported by GCC 7)
CXXSTDFLAGS_gcc7=$(if $(CXXSTDFLAGS_gcc7_$(STD)),$(CXXSTDFLAGS_gcc7_$(STD)),$(CXXSTDFLAGS_gcc))
CXXSHAREDFLAGS_gcc7=$(CXXSHAREDFLAGS_gcc)

CXX_gcc8=g++-8
CXXSHARED_gcc8=$(CXXSHARED_gcc)
CXXBASEFLAGS_gcc8=$(CXXBASEFLAGS_gcc)
CXXWARNFLAGS_gcc8=$(CXXWARNFLAGS_gcc)
CXXSTDFLAGS_gcc8_cxx20=$(error C++20 is not supported by GCC 8)
CXXSTDFLAGS_gcc8=$(if $(CXXSTDFLAGS_gcc8_$(STD)),$(CXXSTDFLAGS_gcc8_$(STD)),$(CXXSTDFLAGS_gcc))
CXXSHAREDFLAGS_gcc8=$(CXXSHAREDFLAGS_gcc)

CXX_gcc9=g++-9
CXXSHARED_gcc9=$(CXXSHARED_gcc)
CXXBASEFLAGS_gcc9=$(CXXBASEFLAGS_gcc)
CXXWARNFLAGS_gcc9=$(CXXWARNFLAGS_gcc)
CXXSTDFLAGS_gcc9_cxx20=-std=c++2a
CXXSTDFLAGS_gcc9=$(if $(CXXSTDFLAGS_gcc9_$(STD)),$(CXXSTDFLAGS_gcc9_$(STD)),$(CXXSTDFLAGS_gcc))
CXXSHAREDFLAGS_gcc9=$(CXXSHAREDFLAGS_gcc)

CXX_gcc10=g++-10
CXXSHARED_gcc10=$(CXXSHARED_gcc)
CXXBASEFLAGS_gcc10=$(CXXBASEFLAGS_gcc)
CXXWARNFLAGS_gcc10=$(CXXWARNFLAGS_gcc)
CXXSTDFLAGS_gcc10=$(CXXSTDFLAGS_gcc)
CXXSHAREDFLAGS_gcc10=$(CXXSHAREDFLAGS_gcc)

###########################################################################
# clang toolchains
###########################################################################

CXX_clang=clang++
CXXSHARED_clang=$(CXX) -shared

CXXBASEFLAGS_clang_debug=-g
CXXBASEFLAGS_clang_release=-O2
CXXBASEFLAGS_clang=-MD $(CXXBASEFLAGS_clang_$(MODE))

CXXWARNFLAGS_clang=-Wall

CXXSTDFLAGS_clang_cxx98=-std=c++98
CXXSTDFLAGS_clang_cxx11=-std=c++11
CXXSTDFLAGS_clang_cxx14=-std=c++14
CXXSTDFLAGS_clang_cxx17=-std=c++17
CXXSTDFLAGS_clang_cxx20=-std=c++20
CXXSTDFLAGS_clang=$(CXXSTDFLAGS_clang_$(STD))

CXXSHAREDFLAGS_clang=-fPIC

CXX_clang6=clang++-6.0
CXXSHARED_clang6=$(CXXSHARED_clang)
CXXBASEFLAGS_clang6=$(CXXBASEFLAGS_clang)
CXXWARNFLAGS_clang6=$(CXXWARNFLAGS_clang)
CXXSTDFLAGS_clang6_cxx20=-std=c++2a
CXXSTDFLAGS_clang6=$(if $(CXXSTDFLAGS_clang6_$(STD)),$(CXXSTDFLAGS_clang6_$(STD)),$(CXXSTDFLAGS_clang))
CXXSHAREDFLAGS_clang6=$(CXXSHAREDFLAGS_clang)

CXX_clang7=clang++-7
CXXSHARED_clang7=$(CXXSHARED_clang)
CXXBASEFLAGS_clang7=$(CXXBASEFLAGS_clang)
CXXWARNFLAGS_clang7=$(CXXWARNFLAGS_clang)
CXXSTDFLAGS_clang7_cxx20=-std=c++2a
CXXSTDFLAGS_clang7=$(if $(CXXSTDFLAGS_clang7_$(STD)),$(CXXSTDFLAGS_clang7_$(STD)),$(CXXSTDFLAGS_clang))
CXXSHAREDFLAGS_clang7=$(CXXSHAREDFLAGS_clang)

CXX_clang8=clang++-8
CXXSHARED_clang8=$(CXXSHARED_clang)
CXXBASEFLAGS_clang8=$(CXXBASEFLAGS_clang)
CXXWARNFLAGS_clang8=$(CXXWARNFLAGS_clang)
CXXSTDFLAGS_clang8_cxx20=-std=c++2a
CXXSTDFLAGS_clang8=$(if $(CXXSTDFLAGS_clang8_$(STD)),$(CXXSTDFLAGS_clang8_$(STD)),$(CXXSTDFLAGS_clang))
CXXSHAREDFLAGS_clang8=$(CXXSHAREDFLAGS_clang)

CXX_clang9=clang++-9
CXXSHARED_clang9=$(CXXSHARED_clang)
CXXBASEFLAGS_clang9=$(CXXBASEFLAGS_clang)
CXXWARNFLAGS_clang9=$(CXXWARNFLAGS_clang)
CXXSTDFLAGS_clang9_cxx20=-std=c++2a
CXXSTDFLAGS_clang9=$(if $(CXXSTDFLAGS_clang9_$(STD)),$(CXXSTDFLAGS_clang9_$(STD)),$(CXXSTDFLAGS_clang))
CXXSHAREDFLAGS_clang9=$(CXXSHAREDFLAGS_clang)

CXX_clang10=clang++-10
CXXSHARED_clang10=$(CXXSHARED_clang)
CXXBASEFLAGS_clang10=$(CXXBASEFLAGS_clang)
CXXWARNFLAGS_clang10=$(CXXWARNFLAGS_clang)
CXXSTDFLAGS_clang10=$(CXXSTDFLAGS_clang)
CXXSHAREDFLAGS_clang10=$(CXXSHAREDFLAGS_clang)

###########################################################################
# Oracle toolchain
###########################################################################

CXX_sun=CC
CXXSHARED_sun=$(CXX_sun) -shared
CXXBASEFLAGS_sun_debug=-g
CXXBASEFLAGS_sun_release=-O2
CXXBASEFLAGS_sun=-xMD $(CXXBASEFLAGS_sun_$(MODE))
CXXWARNFLAGS_sun=+w2
CXXSTDFLAGS_sun_cxx98=-std=c++03
CXXSTDFLAGS_sun_cxx11=-std=c++11
CXXSTDFLAGS_sun_cxx14=-std=c++14
CXXSTDFLAGS_sun_cxx17=$(error C++17 is not supported by Oracle CC)
CXXSTDFLAGS_sun_cxx20=$(error C++17 is not supported by Oracle CC)
CXXSTDFLAGS_sun=$(CXXSTDFLAGS_sun_$(STD))
CXXSHAREDFLAGS_sun=-fPIC

###########################################################################
# debug mode
###########################################################################

CPPFLAGS_debug=

###########################################################################
# release mode
###########################################################################

CPPFLAGS_release=-DNDEBUG

###########################################################################

ifeq (default,$(origin CXX))
CXX=$(if $(CXX_$(TOOLCHAIN)),$(CXX_$(TOOLCHAIN)),$(error Unknown toolchain: $(TOOLCHAIN)))
endif
CXXSHARED?=$(CXXSHARED_$(TOOLCHAIN))

CXXWARNFLAGS?=$(CXXWARNFLAGS_$(TOOLCHAIN))
CXXSTDFLAGS?=$(if $(CXXSTDFLAGS_$(TOOLCHAIN)),$(CXXSTDFLAGS_$(TOOLCHAIN)),$(error $(STD) is not supported by $(TOOLCHAIN)))
CXXSHAREDFLAGS?=$(CXXSHAREDFLAGS_$(TOOLCHAIN))
CXXBASEFLAGS?=$(CXXBASEFLAGS_$(TOOLCHAIN))
CXXNIHFLAGS?=$(CXXBASEFLAGS) $(CXXWARNFLAGS) $(CXXSTDFLAGS)
CXXFLAGS?=$(CXXNIHFLAGS)

CPPBASEFLAGS?=$(CPPFLAGS_$(TOOLCHAIN))
CPPMODEFLAGS?=$(CPPFLAGS_$(MODE))
CPPNIHFLAGS?=$(CPPBASEFLAGS) $(CPPMODEFLAGS)
CPPFLAGS?=$(CPPNIHFLAGS)

LDBASEFLAGS?=$(LDFLAGS_$(TOOLCHAIN))
LDNIHFLAGS?=$(LDBASEFLAGS)
LDFLAGS?=$(LDNIHFLAGS)

LDBASELIBS?=$(LDLIBS_$(TOOLCHAIN))
LDNIHLIBS?=$(LDBASELIBS)
LDLIBS?=$(LDNIHLIBS)

NIH_AUTOREBUILD_BASE:=.timestamp-
NIH_AUTOREBUILD=$(NIH_AUTOREBUILD_BASE)$(TOOLCHAIN)-$(MODE)-$(STD)

EXES?=$(patsubst %.cpp,%,$(wildcard *.cpp))

%: %.o $(NIH_AUTOREBUILD)
	$(CXX) $(CXXFLAGS) $(LDFLAGS) $(filter %.o %.a %.so,$^) $(LDLIBS) -o $@

%: %.cpp $(NIH_AUTOREBUILD)
	$(CXX) $(CXXFLAGS) $(CPPFLAGS) $(LDFLAGS) $(filter %.cpp %.o %.o %.so,$^) $(LDLIBS) -o $@

%.o: %.cpp $(NIH_AUTOREBUILD)
	$(CXX) $(CXXFLAGS) $(CPPFLAGS) -c -o $@ $<

%.a:
	$(AR) -crus $@ $^

%.so: CXXNIHFLAGS+=$(CXXSHAREDFLAGS)
%.so:
	$(CXXSHARED) -o $@ $^

.PHONY: all test-all clean

test-%: %
	./$<
	@touch $@

all: $(EXES)

test-all: $(EXES:%=test-%)
	@:

clean::
	-rm $(NIH_AUTOREBUILD_BASE)*
	-rm *.d
	-rm *.o
	-rm *~
	-rm $(EXES)
	-rm $(EXES:%=test-%)

$(NIH_AUTOREBUILD):
	-rm $(NIH_AUTOREBUILD_BASE)*
	touch $(NIH_AUTOREBUILD)
	echo $(TOOLCHAIN) > .last-toolchain
	echo $(MODE) > .last-mode
	echo $(STD) > .last-std

-include *.d

###########################################################################
