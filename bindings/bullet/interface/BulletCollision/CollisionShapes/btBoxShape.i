%{
#include <btBoxShape.h>
%}

#ifdef DEBUG_FREEFUNC
%freefunc btBoxShape "debug_free_btBoxShape";
#endif

%include btBoxShape.h

%{

 static void debug_free_btBoxShape(void* ptr) {
	 btBoxShape* obj = (btBoxShape*) ptr;
	 
	 std::cout << __PRETTY_FUNCTION__ << std::endl;
	 
	 if (obj)
		 delete obj;
 }

%}
