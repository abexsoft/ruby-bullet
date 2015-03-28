require 'rubygems/package_task'
require 'rake/clean'

BULLET_FILE = "bullet-2.82-r2704.tgz"
BULLET_DIR = "bullet-2.82-r2704"


desc 'All clean'
task :cleanall do
  sh "rm -rf deps/include"
  sh "rm -rf deps/lib"
  sh "rm -rf deps/src/#{BULLET_DIR}"
  sh "rm -f  deps/src/#{BULLET_FILE}"
end

desc 'Download the source packages.'
task :download do
  FileUtils::mkdir_p("deps/src")
  chdir('deps/src') {
    BULLET_FILE = "bullet-2.82-r2704.tgz"
    sh "wget http://bullet.googlecode.com/files/#{BULLET_FILE}"
    sh "tar xzvf #{BULLET_FILE}"
  }
end

desc 'Compile bullet libraries.'
task :compile do
  chdir("deps/src/#{BULLET_DIR}") {
    if /mingw/ =~ RUBY_PLATFORM
      sh 'cmake . -G "MSYS Makefiles" -DUSE_GLUT:BOOL=OFF -DBUILD_DEMOS:BOOL=OFF -DCMAKE_INSTALL_PREFIX:PATH=..\
\.. -DINCLUDE_INSTALL_DIR:PATH=include\\bullet -DLIB_DESTINATION:STRING=..\\..\\lib -DPKGCONFIG_INSTALL_PR
EFIX:STRING=..\\..\\lib\\pkgconfig\\'
      sh "make -j4"
      system('mkdir ..\..\lib')
      system('mkdir ..\..\include\bullet')
      sh "cp -a lib/*.a ../../lib"
      sh "cp -a src/* ../../include/bullet"
    else
      sh "cmake -DCMAKE_INSTALL_PREFIX:PATH=../.. -DINCLUDE_INSTALL_DIR:PATH=include/bullet -DLIB_DESTINATION:STRING=../../lib -DPKGCONFIG_INSTALL_PREFIX:STRING=../../lib/pkgconfig/"
      sh "make -j4 && make install"
    end
  }
end

#
# Extension
#

DLEXT = RbConfig::MAKEFILE_CONFIG['DLEXT']

task :default => :build

desc 'Compile a bullet extension library.'
task :build => ["lib/bullet.#{DLEXT}"] 

## lib/*.#{DLEXT}
file "lib/bullet.#{DLEXT}" => "bindings/bullet/bullet.#{DLEXT}" do |f|
  cp f.prerequisites, "lib/", :preserve => true
end

## ext/**/*.#{DLEXT}
file "bindings/bullet/bullet.#{DLEXT}" => FileList["bindings/bullet/Makefile"] do |f|
  sh 'cd bindings/bullet/ && make clean && make'
end
CLEAN.include 'bindings/bullet/*.{o,so,dll}'

## ext/**/Makefile
file 'bindings/bullet/Makefile' => FileList['bindings/bullet/interface/bullet_wrap.cpp'] do
  chdir('bindings/bullet/') { ruby 'extconf.rb' }
end
CLEAN.include 'bindings/bullet/Makefile'

## make wrappers with swig.
file 'bindings/bullet/interface/bullet_wrap.cpp' do
  chdir('bindings/bullet/interface') { sh 'rake' }
end
CLEAN.include 'bindings/bullet/interface/bullet_wrap.{cpp,h,o}'

#
# Document
#
desc 'Create documents'
task :doc => ['bindings/bullet/interface/bullet_wrap.cpp'] do |f|
  sh "rdoc #{f.prerequisites.join(' ')}"
end

