# ruby-bullet

Ruby-bullet is a ruby binding for Bullet.

## Installation

Add this line to your application's Gemfile:

    gem 'ruby-bullet'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby-bullet

## How to install from source.

If you want to compile from source, try the following.

    $ git clone git://github.com/abexsoft/ruby-bullet.git 
    $ cd ruby-bullet
    $ rake download 
    $ rake compile  
    $ rake build 
    $ gem build ruby-bullet.gemspec
    $ gem install ruby-bullet-<version>-<arch>.gem 

You need to install cmake and swig.


## Usages

Run a sample application.  
The sample application uses gtk2 to draw boxes.

     $ sudo gem install gtk2    
     $ <gems_path>/ruby-bullet-<version>-<arch>/sample/hello_bullet/run

## License

Ruby-bullet is licensed under MIT License.

Copyright (C) 2012 abexsoft@gmail.com


