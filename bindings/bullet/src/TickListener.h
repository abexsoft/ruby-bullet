class TickListener
{
public:
	static void bulletPreTickCallback(btDynamicsWorld *world, btScalar timeStep) {
		//VALUE userData = (VALUE)(world->getWorldUserInfo());
		//rb_funcall(userData, rb_intern("preTickCallback"), 1, rb_float_new(timeStep));

		TickListener* listener = (TickListener*)(world->getWorldUserInfo());
		listener->preTickCallback(timeStep);
	}

	static void bulletTickCallback(btDynamicsWorld *world, btScalar timeStep) {
		//VALUE userData = (VALUE)(world->getWorldUserInfo());
		//rb_funcall(userData, rb_intern("tickCallback"), 1, rb_float_new(timeStep));

		TickListener* listener = (TickListener*)(world->getWorldUserInfo());
		listener->tickCallback(timeStep);
	}

	virtual void preTickCallback(btScalar){}
	virtual void tickCallback(btScalar){}
};
