%{
#include <btGenericPoolAllocator.h>
%}

%ignore btGenericMemoryPool::allocate;
%ignore btGenericPoolAllocator::allocate;

%include btGenericPoolAllocator.h

%{
%}
