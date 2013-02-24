require 'mkmf'
require_relative "../../lib/ruby-bullet"

# set flags
$CFLAGS += " -g #{Ruby::Bullet::get_inc_flags} -I./src"

if (/mingw/ =~ RUBY_PLATFORM)
  $LDFLAGS += " -static-libgcc -static-libstdc++ #{Ruby::Bullet::get_lib_flags} -lws2_32 -lwinmm"
else
  $LDFLAGS += " -static-libgcc -static-libstdc++ #{Ruby::Bullet::get_lib_flags}"
end

$srcs = ["interface/bullet_wrap.cpp"]

$objs = $srcs.collect {|o| o.sub(/\.cpp|\.cc|\.cxx/, ".o")}
$cleanfiles = $objs

create_makefile('bullet')
