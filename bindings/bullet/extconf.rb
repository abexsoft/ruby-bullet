require 'mkmf'

DEPS_DIR = "../../deps"

# set values of INC and LIB.
load "#{DEPS_DIR}/env.rb"


# set flags
$CFLAGS += " -g " + BULLET_INC + " -I./src"

if (/mingw/ =~ RUBY_PLATFORM)
  $LDFLAGS += " -static-libgcc -static-libstdc++ " + BULLET_LIB + " -lws2_32 -lwinmm"
else
  $LDFLAGS += " -static-libgcc -static-libstdc++ " + BULLET_LIB
end

$srcs = ["interface/bullet_wrap.cpp"]

$objs = $srcs.collect {|o| o.sub(/\.cpp|\.cc|\.cxx/, ".o")}
$cleanfiles = $objs

create_makefile('Bullet')
