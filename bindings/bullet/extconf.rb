require 'mkmf'
require_relative "../../lib/ruby-bullet"

# set flags

if $CXXFLAGS
  $CXXFLAGS += " -g #{Ruby::Bullet::Dynamic::get_inc_flags} -I./src" 
else
  $CFLAGS += " -g #{Ruby::Bullet::Dynamic::get_inc_flags} -I./src"
end

=begin
if (/mingw/ =~ RUBY_PLATFORM)
  $LDFLAGS += " -static-libgcc -static-libstdc++ #{Ruby::Bullet::Static::get_lib_flags} -lws2_32 -lwinmm"
else
  $LDFLAGS += " -static-libgcc -static-libstdc++ #{Ruby::Bullet::Static::get_lib_flags}"
end
=end

$LDFLAGS += " #{Ruby::Bullet::Dynamic::get_lib_flags}"


$srcs = ["interface/bullet_wrap.cpp"]

$objs = $srcs.collect {|o| o.sub(/\.cpp|\.cc|\.cxx/, ".o")}
$cleanfiles = $objs

create_makefile('bullet')
