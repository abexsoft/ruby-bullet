.PHONY: clean

SWIG = swig
DEPS_DIR = ../../../deps/

include ../../../deps/env.mk

SWIGFLAGS = -ruby -c++ -w801 $(BULLET_INC) -I../src
RUBY = ruby

TARGET = bullet_wrap.cpp

all: $(TARGET)

$(TARGET): bullet.i
	$(SWIG) $(SWIGFLAGS) -o $@ $<

clean:
	@rm -f $(TARGET)
