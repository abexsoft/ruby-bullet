%{
#include <btPoolAllocator.h>
%}

%ignore btPoolAllocator::allocate;

%include btPoolAllocator.h

%{
%}
