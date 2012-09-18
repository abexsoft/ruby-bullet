# -*- coding: utf-8 -*-
require 'gtk2'
require 'cairo'
require "Bullet.so"

class Physics
  attr_accessor :context
  attr_accessor :objects

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

    @objects = []

    @lastTime = -1
  end

  def addObject(obj)
    @objects.push(obj)
    @dynamicsWorld.addRigidBody(obj.rigidBody)
  end

  def update(context)
    @lastTime = Time.now.to_f if @lastTime < 0

    # calc delta
    nowTime = Time.now.to_f
    delta = nowTime - @lastTime
    @lastTime = nowTime

    # step 
    @dynamicsWorld.stepSimulation(delta)

    @objects.each {|obj|
      obj.draw(context)
    }

    return delta
  end
end


class Box < Bullet::BtMotionState
  attr_accessor :rigidBody

  def initialize(physics, mass, width, height, color)
    super()
    @physics = physics
    @width = width
    @height = height
    @color = color

    # position/rotation
    @transform = Bullet::BtTransform.new()
    @transform.setIdentity()

    # create a physics object.
    @colObj = Bullet::BtBoxShape.new(Bullet::BtVector3.new(width / 2, height / 2, width / 2))
    inertia = Bullet::BtVector3.new()
    @colObj.calculateLocalInertia(mass, inertia)

    @rigidBody = Bullet::BtRigidBody.new(mass, self, @colObj, inertia)
    @rigidBody.setAngularFactor(Bullet::BtVector3.new(0, 0, 1)) # rotate around z-axis only becase of 2D.
  end

  def setWorldTransform(worldTrans)
    @transform = Bullet::BtTransform.new(worldTrans)
  end

  def getWorldTransform(worldTrans)
  end

  def setPosition(x, y)
    @transform.setOrigin(Bullet::BtVector3.new(x, y, 0.0))
    @rigidBody.setCenterOfMassTransform(@transform)
  end    

  def draw(context)
    newPos = @transform.getOrigin()
    newRot = @transform.getRotation()

    lt = Bullet::BtVector3.new(-@width / 2, -@height / 2, 0)
    lb = Bullet::BtVector3.new(-@width / 2, @height / 2 , 0)

    lt = Bullet::quatRotate(newRot, lt)
    lb = Bullet::quatRotate(newRot, lb)
    rb = -lt
    rt = -lb
    
    context.move_to(newPos.x + lt.x, newPos.y + lt.y)
    context.line_to(newPos.x + rt.x, newPos.y + rt.y)
    context.line_to(newPos.x + rb.x, newPos.y + rb.y)
    context.line_to(newPos.x + lb.x, newPos.y + lb.y)
    context.line_to(newPos.x + lt.x, newPos.y + lt.y)
    context.set_source_color(@color)
    context.fill(true)
    context.set_source_color("black")
    context.stroke
  end
end


## create a physics world.
physics = Physics.new()

# falling boxes.
id = 0
11.times {|x|
  5.times {|y|
    box = Box.new(physics, 1.0, 10, 10, 'sky blue')
    box.setPosition(100 + 10 * x, 50 - 10 * y)
    physics.addObject(box)
  }
}

# floor
floor = Box.new(physics, 0, 100, 5, 'gray')
floor.setPosition(150, 200)
physics.addObject(floor)


## create a drawing window.
window = Gtk::Window.new
window.set_default_size(300, 300)
window.signal_connect("destroy") do
  Gtk.main_quit
  false
end

drawing_area = Gtk::DrawingArea.new

delta = 0
drawing_area.signal_connect("expose-event") do |widget, event|
  context = widget.window.create_cairo_context  
  delta += physics.update(context)

  # create a new box per 3sec.
  if (delta > 3.0) 
    box = Box.new(physics, 1.0, 10, 10, 'orange')
    box.setPosition(125 + (physics.objects.length % 10) * 5, 0)
    physics.addObject(box)
    delta = 0
  end
  true
end

Gtk.timeout_add(1000.0 / 60.0) {
  drawing_area.queue_draw
  true
}

window.add(drawing_area)
window.show_all

Gtk.main


