require 'tk'
require "Bullet.so"

class Physics
  def initialize()
    @collisionConfig = Bullet::BtDefaultCollisionConfiguration.new();
    @collisionDispatcher = Bullet::BtCollisionDispatcher.new(@collisionConfig)

    worldAabbMin = Bullet::BtVector3.new(-3000.0,-500.0, -3000.0)
    worldAabbMax = Bullet::BtVector3.new(3000.0, 500.0, 3000.0)
    maxProxies = 1024 * 4
    @gardenAabbCache = Bullet::BtAxisSweep3.new( worldAabbMin, worldAabbMax, maxProxies )

    @solver = Bullet::BtSequentialImpulseConstraintSolver.new();

    @dynamicsWorld = Bullet::BtDiscreteDynamicsWorld.new(@collisionDispatcher, @gardenAabbCache,
                                                         @solver, @collisionConfig)
    gravity = Bullet::BtVector3.new(0.0, 9.8, 0.0)
    @dynamicsWorld.setGravity(gravity)

    @lastTime = -1
  end

  def createBox(motionState, mass, width, height)
    colObj = Bullet::BtBoxShape.new(Bullet::BtVector3.new(width / 2, height / 2, width / 2))
    inertia = Bullet::BtVector3.new()
    colObj.calculateLocalInertia(mass, inertia)

    rigidBody = Bullet::BtRigidBody.new(mass, motionState, colObj, inertia)
    rigidBody.instance_variable_set(:@collisionShape, colObj) 
    rigidBody.setAngularFactor(Bullet::BtVector3.new(0, 0, 1)) # rotate around z-axis only.

    @dynamicsWorld.addRigidBody(rigidBody)
    return rigidBody
  end

  def update()
    @lastTime = Time.now.to_f if @lastTime < 0

    # calc delta
    nowTime = Time.now.to_f
    delta = nowTime - @lastTime
    @lastTime = nowTime

    # step 
    @dynamicsWorld.stepSimulation(delta)

    return true
  end
end


class Box < Bullet::BtMotionState
  def initialize(c, physics, mass, width, height, color)
    super()
    @c = c
    @physics = physics
    @width = width
    @height = height

    # position/rotation
    @transform = Bullet::BtTransform.new()
    @transform.setIdentity()

    # create a physics object.
    @rigidBody = @physics.createBox(self, mass, width, height)

    # create a drawing object.
    shape = [-width / 2, -height / 2, 
              width / 2, -height / 2, 
              width / 2,  height / 2,
             -width / 2,  height / 2]
    @obj = TkcPolygon.new(c, shape) { 
      fill color 
      outline 'black'
      disabledoutline ''
      width 1
      state 'normal'
    }

  end

  def setWorldTransform(worldTrans)
    @transform = Bullet::BtTransform.new(worldTrans)
    draw()
  end

  def getWorldTransform(worldTrans)
  end

  def setPosition(x, y)
    @transform.setOrigin(Bullet::BtVector3.new(x, y, 0.0))
    @rigidBody.setCenterOfMassTransform(@transform)

    draw()
  end    

  def draw()
    newPos = @transform.getOrigin()
    newRot = @transform.getRotation()

    lt = Bullet::BtVector3.new(-@width / 2, -@height / 2, 0)
    lb = Bullet::BtVector3.new(-@width / 2, @height / 2 , 0)

    lt = Bullet::quatRotate(newRot, lt)
    lb = Bullet::quatRotate(newRot, lb)
    rb = -lt
    rt = -lb

    shape = [newPos.x + lt.x, newPos.y + lt.y, 
             newPos.x + rt.x, newPos.y + rt.y,
             newPos.x + rb.x, newPos.y + rb.y,
             newPos.x + lb.x, newPos.y + lb.y]
    @obj.coords(shape)
  end
end


physics = Physics.new()

c = TkCanvas.new
c.width(300)
c.height(300)

# falling boxes.
box = []
id = 0
11.times {|x|
  5.times {|y|
    box[id] = Box.new(c, physics, 1.0, 10, 10, 'SkyBlue')
    box[id].setPosition(100 + 10 * x, 50 - 10 * y)
    id += 1
  }
}

# floor
floor = Box.new(c, physics, 0, 120, 6, 'gray')
floor.setPosition(150, 200)

c.pack

TkAfter.new(1000 / 60, -1, proc{ physics.update()}).start

Tk.mainloop
