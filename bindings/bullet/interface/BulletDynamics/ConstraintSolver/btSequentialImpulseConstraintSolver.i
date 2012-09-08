%{
#include <btSequentialImpulseConstraintSolver.h>
%}

#ifdef DEBUG_FREEFUNC
%freefunc btSequentialImpulseConstraintSolver "debug_free_btSequentialImpulseConstraintSolver";
#endif

%include btSequentialImpulseConstraintSolver.h

%{

 static void debug_free_btSequentialImpulseConstraintSolver(void* ptr) {
	 btSequentialImpulseConstraintSolver* obj = (btSequentialImpulseConstraintSolver*) ptr;
	 
	 std::cout << __PRETTY_FUNCTION__ << std::endl;
	 
	 delete obj;
 }

%}
