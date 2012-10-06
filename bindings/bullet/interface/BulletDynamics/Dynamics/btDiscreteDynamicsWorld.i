%{
#include <btDiscreteDynamicsWorld.h>
%}

//#ifdef DEBUG_FREEFUNC
%freefunc btDiscreteDynamicsWorld "debug_free_btDiscreteDynamicsWorld";
//#endif

%include btDiscreteDynamicsWorld.h

%{

 static void debug_free_btDiscreteDynamicsWorld(void* ptr) {
	 btDiscreteDynamicsWorld* obj = (btDiscreteDynamicsWorld*) ptr;
	 
	 std::cout << __PRETTY_FUNCTION__ << std::endl;
	 
	 delete obj;

	 std::cout << __PRETTY_FUNCTION__ << " done" << std::endl;
 }

%}
