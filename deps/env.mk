# needed DEPS_DIR

BULLET_INC = \
	-I$(DEPS_DIR)/include/bullet/ \
	-I$(DEPS_DIR)/include/bullet/LinearMath \
	-I$(DEPS_DIR)/include/bullet/BulletCollision/CollisionDispatch \
	-I$(DEPS_DIR)/include/bullet/BulletCollision/BroadphaseCollision \
	-I$(DEPS_DIR)/include/bullet/BulletCollision/NarrowPhaseCollision \
	-I$(DEPS_DIR)/include/bullet/BulletCollision/CollisionShapes \
	-I$(DEPS_DIR)/include/bullet/BulletCollision/Gimpact \
	-I$(DEPS_DIR)/include/bullet/BulletDynamics/ConstraintSolver/ \
	-I$(DEPS_DIR)/include/bullet/BulletDynamics/Dynamics \
	-I$(DEPS_DIR)/include/bullet/BulletDynamics/Vehicle \
	-I$(DEPS_DIR)/include/bullet/BulletDynamics/Character \
	-I$(DEPS_DIR)/include/bullet/BulletSoftBody/

OGRE_INC = \
	-I$(DEPS_DIR)/include/OGRE \
	-I$(DEPS_DIR)/include/OGRE/GLX \
	-I$(DEPS_DIR)/include/OGRE/Paging \
	-I$(DEPS_DIR)/include/OGRE/RTShaderSystem/ \
	-I$(DEPS_DIR)/include/OGRE/Terrain/ 

OIS_INC = \
	-I$(DEPS_DIR)/include/OIS

PROC_INC = \
	-I$(DEPS_DIR)/include/OgreProcedural
