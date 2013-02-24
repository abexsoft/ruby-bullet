lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby-bullet/version'

Gem::Specification.new do |gem|
  gem.name          = "ruby-bullet"
  gem.version       = Ruby::Bullet::VERSION
  gem.authors       = ["abexsoft"]
  gem.email         = ["abexsoft@gmail.com"]
  gem.summary       = %q{A ruby binding for Bullet.}
  gem.description   = %q{A ruby binding for Bullet.}
  gem.homepage      = "https://github.com/abexsoft/ruby-bullet"
  gem.platform      = Gem::Platform::CURRENT

  gem.files         = Dir['Gemfile',
                          'Rakefile',
                          'README.md',
                          'INSTALL.md',
                          'LICENSE',
                          'ruby-bullet.gemspec',
                          'bindings/bullet/interface/**/*',
                          'bindings/bullet/src/**/*',
                          'doc/**/*',
                          'lib/**/*',
                          'sample/**/*',
                          'deps/lib/*',
                          'deps/include/**/*',
                         ]

  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
