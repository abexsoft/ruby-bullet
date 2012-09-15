Using libraries
--------------
* ruby : http://www.ruby-lang.org/
* swig : http://www.swig.org/
* bullet : http://bulletphysics.org/


How to compile all libraries.
--------------
1. compile external libraries.
   
    > $ rake download  
    > $ rake compile:deps

2. make ruby extension libraries.

    > $ rake compile:ext

3. install ruby extension libraries.

    > $ rake package  
    > $ sudo gem install pkg/ruby-bullet-\<version>-\<arch>.gem  
