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

  gem.files         = Dir['Gemfile',
                          'Rakefile',
                          'README.md',
                          'LICENSE',
                          'ruby-bullet.gemspec',
                          'bindings/bullet/extconf.rb',
                          'bindings/bullet/interface/**/*',
                          'bindings/bullet/src/*',
                          'doc/**/*',
                          'lib/ruby-bullet.rb',
                          'lib/ruby-bullet/version.rb',
                          'sample/**/*',
                         ]

  gem.extensions << 'Rakefile'

  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.requirements << 'libbullet, v2.82'

end
