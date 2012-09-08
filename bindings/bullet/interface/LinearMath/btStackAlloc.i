%{
#include <btStackAlloc.h>
%}

%ignore btStackAlloc::allocate;

%include btStackAlloc.h

%{
%}
