require_relative "ruby-bullet/version"

module Ruby
  module Bullet
   def self.get_top_path
      File.dirname(File.dirname(File.expand_path(__FILE__)))
    end

    def self.get_deps_lib_path
      "#{get_top_path}/deps/lib"
    end

    def self.get_deps_inc_path
      "#{get_top_path()}/deps/include/"
    end

    def self.get_inc_flags
      " -I#{get_top_path}/deps/include/bullet/ " +     
      " -I#{get_top_path}/deps/include/bullet/LinearMath/ " + 
      " -I#{get_top_path}/deps/include/bullet/BulletCollision/CollisionDispatch/ " + 
      " -I#{get_top_path}/deps/include/bullet/BulletCollision/BroadphaseCollision/ " + 
      " -I#{get_top_path}/deps/include/bullet/BulletCollision/NarrowPhaseCollision/ " +
      " -I#{get_top_path}/deps/include/bullet/BulletCollision/CollisionShapes/ " + 
      " -I#{get_top_path}/deps/include/bullet/BulletCollision/Gimpact/ " + 
      " -I#{get_top_path}/deps/include/bullet/BulletDynamics/ConstraintSolver/ " + 
      " -I#{get_top_path}/deps/include/bullet/BulletDynamics/Dynamics/ " +
      " -I#{get_top_path}/deps/include/bullet/BulletDynamics/Vehicle/ " + 
      " -I#{get_top_path}/deps/include/bullet/BulletDynamics/Character/ " + 
      " -I#{get_top_path}/deps/include/bullet/BulletSoftBody/ "
    end

    def self.get_lib_flags
      "-L#{get_top_path}/deps/lib -lBulletDynamics -lBulletCollision -lBulletSoftBody -lLinearMath"
    end
  end
end
