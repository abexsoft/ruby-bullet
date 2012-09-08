%{
#include <btAxisSweep3.h>
%}

// predeclaration of btAxisSweep3Internal,
// because btAxisSweep3Internal<unsigned short int> is needed by btAxisSweep3.h.
%include local_btAxisSweep3Internal.h
%template(AxisSweep3InternalUShortInt) btAxisSweep3Internal<unsigned short int>;

#ifdef DEBUG_FREEFUNC
%freefunc btAxisSweep3 "debug_free_btAxisSweep3";
#endif

%include btAxisSweep3.h




%{
 static void debug_free_btAxisSweep3(void* ptr) {
	 btAxisSweep3* obj = (btAxisSweep3*) ptr;
	 
	 std::cout << __PRETTY_FUNCTION__ << std::endl;
	 
	 delete obj;

	 std::cout << __PRETTY_FUNCTION__ << " done" << std::endl;
 }

%}
