require 'rubygems/package_task'
require 'rake/clean'

#
# Download sources.
#
desc 'Download the source packages.'
task :download => [:download_bullet]

task :download_bullet do
  BULLET_FILE = "bullet-2.80-rev2531.tgz"

  FileUtils::mkdir_p("deps/src")
  chdir('deps/src') {
    sh "wget http://bullet.googlecode.com/files/#{BULLET_FILE}"
    sh "tar xzvf #{BULLET_FILE}"
  }
end

#
# Compile libraries.
#
namespace :compile do

  namespace :deps do

    task :bullet do
      chdir("deps/src/bullet-2.80-rev2531/") {
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
  end
  desc 'Compile a bullet library.'
  task :deps => 'deps:bullet'    


  namespace :ext do
    #
    # Extension
    #

    DLEXT = RbConfig::MAKEFILE_CONFIG['DLEXT']

    task :bullet => ["lib/bullet.#{DLEXT}"] 

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
  end

  desc 'Compile a bullet extension library.'
  task :ext => 'ext:bullet'    
end

#
# Document
#
desc 'Create documents'
task :doc => ['bindings/bullet/interface/bullet_wrap.cpp'] do |f|

  sh "rdoc #{f.prerequisites.join(' ')}"
end

#
# Gemspec
#
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'version'

spec = Gem::Specification.new do |s|

  s.name        = "ruby-bullet"
  s.version     = Ruby::Bullet::VERSION
  s.summary     = "A ruby extension library of Bullet."
  s.homepage    = "https://github.com/abexsoft/ruby-bullet"
  s.authors     = ["abexsoft works"]
  s.email       = ["abexsoft@gmail.com"]
  s.description = "This is a binary package of the ruby wrapper of Bullet."
  s.platform    = Gem::Platform::CURRENT
 
  # The list of files to be contained in the gem 
  s.files = FileList['Rakefile',
                     'README.md',
                     'INSTALL.md',
                     'LICENSE',
                     'bindings/bullet/interface/**/*',
                     'bindings/bullet/src/**/*',
                     'doc/**/*',
                     'lib/**/*',
                     'sample/**/*',
                     'deps/lib/*',
                     'deps/include/**/*',
                    ].to_a

#  s.extra_rdoc_files = ['bindings/bullet/interface/bullet_wrap.cpp']

  s.require_paths = ["lib"]
end

Gem::PackageTask.new(spec) do |pkg|
end
