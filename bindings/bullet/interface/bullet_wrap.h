/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 3.0.5
 *
 * This file is not intended to be easily readable and contains a number of
 * coding conventions designed to improve portability and efficiency. Do not make
 * changes to this file unless you know what you are doing--modify the SWIG
 * interface file instead.
 * ----------------------------------------------------------------------------- */

#ifndef SWIG_Bullet_WRAP_H_
#define SWIG_Bullet_WRAP_H_

namespace Swig {
  class Director;
}


class SwigDirector_BtMotionState : public btMotionState, public Swig::Director {

public:
    SwigDirector_BtMotionState(VALUE self);
    virtual ~SwigDirector_BtMotionState();
    virtual void getWorldTransform(btTransform &worldTrans) const;
    virtual void setWorldTransform(btTransform const &worldTrans);
};


struct SwigDirector_BtDefaultMotionState : public btDefaultMotionState, public Swig::Director {

public:
    SwigDirector_BtDefaultMotionState(VALUE self, btTransform const &startTrans = btTransform::getIdentity(), btTransform const &centerOfMassOffset = btTransform::getIdentity());
    virtual ~SwigDirector_BtDefaultMotionState();
    virtual void getWorldTransform(btTransform &centerOfMassWorldTrans) const;
    virtual void setWorldTransform(btTransform const &centerOfMassWorldTrans);
};


class SwigDirector_BtIDebugDraw : public btIDebugDraw, public Swig::Director {

public:
    SwigDirector_BtIDebugDraw(VALUE self);
    virtual ~SwigDirector_BtIDebugDraw();
    virtual void drawLine(btVector3 const &from, btVector3 const &to, btVector3 const &color);
    virtual void drawLine(btVector3 const &from, btVector3 const &to, btVector3 const &fromColor, btVector3 const &toColor);
    virtual void drawSphere(btScalar radius, btTransform const &transform, btVector3 const &color);
    virtual void drawSphere(btVector3 const &p, btScalar radius, btVector3 const &color);
    virtual void drawTriangle(btVector3 const &v0, btVector3 const &v1, btVector3 const &v2, btVector3 const &arg0, btVector3 const &arg1, btVector3 const &arg2, btVector3 const &color, btScalar alpha);
    virtual void drawTriangle(btVector3 const &v0, btVector3 const &v1, btVector3 const &v2, btVector3 const &color, btScalar arg0);
    virtual void drawContactPoint(btVector3 const &PointOnB, btVector3 const &normalOnB, btScalar distance, int lifeTime, btVector3 const &color);
    virtual void reportErrorWarning(char const *warningString);
    virtual void draw3dText(btVector3 const &location, char const *textString);
    virtual void setDebugMode(int debugMode);
    virtual int getDebugMode() const;
    virtual void drawAabb(btVector3 const &from, btVector3 const &to, btVector3 const &color);
    virtual void drawTransform(btTransform const &transform, btScalar orthoLen);
    virtual void drawArc(btVector3 const &center, btVector3 const &normal, btVector3 const &axis, btScalar radiusA, btScalar radiusB, btScalar minAngle, btScalar maxAngle, btVector3 const &color, bool drawSect, btScalar stepDegrees = btScalar(10.f));
    virtual void drawSpherePatch(btVector3 const &center, btVector3 const &up, btVector3 const &axis, btScalar radius, btScalar minTh, btScalar maxTh, btScalar minPs, btScalar maxPs, btVector3 const &color, btScalar stepDegrees = btScalar(10.f), bool drawCenter = true);
    virtual void drawBox(btVector3 const &bbMin, btVector3 const &bbMax, btVector3 const &color);
    virtual void drawBox(btVector3 const &bbMin, btVector3 const &bbMax, btTransform const &trans, btVector3 const &color);
    virtual void drawCapsule(btScalar radius, btScalar halfHeight, int upAxis, btTransform const &transform, btVector3 const &color);
    virtual void drawCylinder(btScalar radius, btScalar halfHeight, int upAxis, btTransform const &transform, btVector3 const &color);
    virtual void drawCone(btScalar radius, btScalar height, int upAxis, btTransform const &transform, btVector3 const &color);
    virtual void drawPlane(btVector3 const &planeNormal, btScalar planeConst, btTransform const &transform, btVector3 const &color);
};


struct SwigDirector_RayResultCallback : public RayResultCallback, public Swig::Director {

public:
    SwigDirector_RayResultCallback(VALUE self);
    virtual ~SwigDirector_RayResultCallback();
    virtual bool needsCollision(btBroadphaseProxy *proxy0) const;
    virtual btScalar addSingleResult(btCollisionWorld::LocalRayResult &rayResult, bool normalInWorldSpace);
};


struct SwigDirector_ClosestRayResultCallback : public ClosestRayResultCallback, public Swig::Director {

public:
    SwigDirector_ClosestRayResultCallback(VALUE self, btVector3 const &rayFromWorld, btVector3 const &rayToWorld);
    virtual ~SwigDirector_ClosestRayResultCallback();
    virtual bool needsCollision(btBroadphaseProxy *proxy0) const;
    virtual btScalar addSingleResult(btCollisionWorld::LocalRayResult &rayResult, bool normalInWorldSpace);
};


struct SwigDirector_ContactResultCallback : public ContactResultCallback, public Swig::Director {

public:
    SwigDirector_ContactResultCallback(VALUE self);
    virtual bool needsCollision(btBroadphaseProxy *proxy0) const;
    virtual btScalar addSingleResult(btManifoldPoint &cp, btCollisionObjectWrapper const *colObj0, int partId0, int index0, btCollisionObjectWrapper const *colObj1, int partId1, int index1);
};


class SwigDirector_TickListener : public TickListener, public Swig::Director {

public:
    SwigDirector_TickListener(VALUE self);
    virtual void preTickCallback(btScalar arg0);
    virtual void tickCallback(btScalar arg0);
};


#endif
