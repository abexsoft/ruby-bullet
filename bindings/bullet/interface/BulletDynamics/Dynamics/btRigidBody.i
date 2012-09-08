%{
#include <btRigidBody.h>
%}

#ifdef DEBUG_FREEFUNC
%freefunc btRigidBody "debug_free_btRigidBody";
#endif

%include btRigidBody.h

%{
 static void debug_free_btRigidBody(void* ptr) {
	 btRigidBody* obj = (btRigidBody*) ptr;
	 
	 std::cout << __PRETTY_FUNCTION__ << std::endl;
	 
	 delete obj;
 }

%}
