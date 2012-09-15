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
