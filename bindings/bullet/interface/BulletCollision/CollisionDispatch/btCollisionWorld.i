%feature("director") RayResultCallback;
%feature("director") ClosestRayResultCallback;
%feature("director") ContactResultCallback;

struct  LocalRayResult
{
	LocalRayResult(btCollisionObject* collisionObject, 
		       btCollisionWorld::LocalShapeInfo* localShapeInfo,
		       const btVector3&                hitNormalLocal,
		       btScalar hitFraction);
	
	btCollisionObject*                 m_collisionObject;
	btCollisionWorld::LocalShapeInfo*  m_localShapeInfo;
	btVector3                          m_hitNormalLocal;
	btScalar                           m_hitFraction;
	
};


struct RayResultCallback
{
	btScalar        m_closestHitFraction;
	btCollisionObject*              m_collisionObject;
	short int       m_collisionFilterGroup;
	short int       m_collisionFilterMask;
	unsigned int m_flags;

	virtual ~RayResultCallback();
	bool    hasHit() const;

	RayResultCallback();

	virtual bool needsCollision(btBroadphaseProxy* proxy0) const;
	virtual btScalar addSingleResult(btCollisionWorld::LocalRayResult& rayResult,
					 bool normalInWorldSpace) = 0;
};


struct ClosestRayResultCallback : public RayResultCallback
{
	ClosestRayResultCallback(const btVector3& rayFromWorld,const btVector3& rayToWorld);

	btVector3       m_rayFromWorld;//used to calculate hitPointWorld from hitFraction
	btVector3       m_rayToWorld;
	btVector3       m_hitNormalWorld;
	btVector3       m_hitPointWorld;
                        
	virtual btScalar addSingleResult(btCollisionWorld::LocalRayResult& rayResult,bool normalInWorldSpace);
};

struct ContactResultCallback : public btCollisionWorld::ContactResultCallback
{
	short int       m_collisionFilterGroup;
	short int       m_collisionFilterMask;

	ContactResultCallback();

	virtual bool needsCollision(btBroadphaseProxy* proxy0) const;
	virtual btScalar addSingleResult(btManifoldPoint& cp,    
					 const btCollisionObject* colObj0,
					 int partId0,int index0,
					 const btCollisionObject* colObj1,int partId1,int index1) = 0;
};
        

%nestedworkaround btCollisionWorld::LocalRayResult;
%nestedworkaround btCollisionWorld::RayResultCallback;
%nestedworkaround btCollisionWorld::ClosestRayResultCallback;
%nestedworkaround btCollisionWorld::ContactResultCallback;

%{
#include <btCollisionWorld.h>
%}

%include btCollisionWorld.h

%{
typedef btCollisionWorld::LocalRayResult LocalRayResult;
typedef btCollisionWorld::RayResultCallback RayResultCallback;
typedef btCollisionWorld::ClosestRayResultCallback ClosestRayResultCallback;
typedef btCollisionWorld::ContactResultCallback ContactResultCallback;
%}
