%{
#include <btQuaternion.h>
%}

%include btQuaternion.h

%extend btQuaternion {

	btQuaternion operator*(const btQuaternion& qt) {
		return  operator*(*self, qt);
	}

	/* copy from Ogre::Quaternion */
        btVector3 xAxis() {
		btScalar fTy  = 2.0f * self->y();
		btScalar fTz  = 2.0f * self->z();
		btScalar fTwy = fTy * self->w();
		btScalar fTwz = fTz * self->w();
		btScalar fTxy = fTy * self->x();
		btScalar fTxz = fTz * self->x();
		btScalar fTyy = fTy * self->y();
		btScalar fTzz = fTz * self->z();

		return btVector3(1.0f-(fTyy+fTzz), fTxy+fTwz, fTxz-fTwy);
	}

        btVector3 yAxis() {
		btScalar fTx  = 2.0f * self->x();
		btScalar fTy  = 2.0f * self->y();
		btScalar fTz  = 2.0f * self->z();
		btScalar fTwx = fTx * self->w();
		btScalar fTwz = fTz * self->w();
		btScalar fTxx = fTx * self->x();
		btScalar fTxy = fTy * self->x();
		btScalar fTyz = fTz * self->y();
		btScalar fTzz = fTz * self->z();

		return btVector3(fTxy-fTwz, 1.0f-(fTxx+fTzz), fTyz+fTwx);
	}


        btVector3 zAxis() {
		btScalar  fTx  = 2.0f * self->x();
		btScalar  fTy  = 2.0f * self->y();
		btScalar  fTz  = 2.0f * self->z();
		btScalar  fTwx = fTx * self->w();
		btScalar  fTwy = fTy * self->w();
		btScalar  fTxx = fTx * self->x();
		btScalar  fTxz = fTz * self->x();
		btScalar  fTyy = fTy * self->y();
		btScalar  fTyz = fTz * self->y();
		
		return btVector3(fTxz+fTwy, fTyz-fTwx, 1.0f-(fTxx+fTyy));
	}
}



%{
%}
