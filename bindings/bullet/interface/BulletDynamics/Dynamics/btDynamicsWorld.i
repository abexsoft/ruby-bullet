%{
#include <btDynamicsWorld.h>

#include "TickListener.h"

%}

%feature("director") TickListener;

#ifdef DEBUG_FREEFUNC
%freefunc btDynamicsWorld "debug_free_BtDynamicsWorld";
#endif

%include btDynamicsWorld.h
%include "../../../src/TickListener.h"

%extend btDynamicsWorld {
	void setInternalTickCallback(TickListener* listener, bool isPreTick=false) {
		if (isPreTick)
			self->setInternalTickCallback((btInternalTickCallback)TickListener::bulletPreTickCallback, listener, isPreTick);
		else
			self->setInternalTickCallback((btInternalTickCallback)TickListener::bulletTickCallback, listener, isPreTick);
	}
}


%{

 static void debug_free_BtDynamicsWorld(void* ptr) {
	 btDynamicsWorld* obj = (btDynamicsWorld*) ptr;
	 
	 std::cout << __PRETTY_FUNCTION__ << std::endl;
	 
	 delete obj;
 }

%}
