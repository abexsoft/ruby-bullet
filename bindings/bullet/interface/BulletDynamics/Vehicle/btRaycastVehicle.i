%{
#include <btRaycastVehicle.h>
%}

// avoid that a swig generated code which accesses m_wheelInfo calls 
// the WheelInfo constructor without argument through unfolding a template.
%ignore btRaycastVehicle::m_wheelInfo;

%include btRaycastVehicle.h

%{
%}
