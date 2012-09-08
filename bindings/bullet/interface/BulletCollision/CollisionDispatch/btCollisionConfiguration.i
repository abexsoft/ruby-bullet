%{
#include <btCollisionConfiguration.h>
%}

#ifdef DEBUG_FREEFUNC
%freefunc btCollisionConfiguration "debug_free_btCollisionConfiguration";
#endif

%include btCollisionConfiguration.h

%{
 static void debug_free_btCollisionConfiguration(void* ptr) {
	 btCollisionConfiguration* obj = (btCollisionConfiguration*) ptr;
	 
	 std::cout << __PRETTY_FUNCTION__ << std::endl;
	 
	 if (obj)
		 delete obj;
 }

%}
