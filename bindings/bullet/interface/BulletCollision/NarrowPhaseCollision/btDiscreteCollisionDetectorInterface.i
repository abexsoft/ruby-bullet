%{
#include <btDiscreteCollisionDetectorInterface.h>
%}

// because of having abstract functions, which are not implemented.
%ignore btStorageResult;

%include btDiscreteCollisionDetectorInterface.h

%{
%}
