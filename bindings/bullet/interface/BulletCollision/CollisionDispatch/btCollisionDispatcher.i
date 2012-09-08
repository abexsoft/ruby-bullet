%{
#include <btCollisionDispatcher.h>
%}

#ifdef DEBUG_FREEFUNC
%freefunc btCollisionDispatcher "debug_free_btCollisionDispatcher";
#endif

%include btCollisionDispatcher.h

%{

 static void debug_free_btCollisionDispatcher(void* ptr) {
	 btCollisionDispatcher* obj = (btCollisionDispatcher*) ptr;
	 
	 std::cout << __PRETTY_FUNCTION__ << std::endl;
	 
	 delete obj;

	 std::cout << __PRETTY_FUNCTION__ << " done" << std::endl;
 }


%}
