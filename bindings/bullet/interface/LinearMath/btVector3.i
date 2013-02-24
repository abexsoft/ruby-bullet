%{
#include <btVector3.h>
%}

%rename("x") btVector3::getX();
%rename("x=") btVector3::setX(btScalar value);
%rename("y") btVector3::getY();
%rename("y=") btVector3::setY(btScalar value);
%rename("z") btVector3::getZ();
%rename("z=") btVector3::setZ(btScalar value);

%include btVector3.h

%extend btVector3 {
	btVector3 operator-() {
		return  operator-(*self);
	}
	btVector3 operator+(const btVector3& v) {
		return  operator+(*self, v);
	}
	btVector3 operator-(const btVector3& v) {
		return  operator-(*self, v);
	}
	btVector3 operator*(const btVector3& v) {
		return  operator*(*self, v);
	}
	btVector3 operator*(const btScalar& v) {
		return  operator*(*self, v);
	}
	btVector3 operator/(const btVector3& v) {
		return  operator/(*self, v);
	}
	btVector3 operator/(const btScalar& v) {
		return  operator/(*self, v);
	}

}


%{
%}
