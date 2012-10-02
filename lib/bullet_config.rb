class BulletConfig
  def self.get_top_dir
    File.dirname(File.dirname(File.expand_path(__FILE__)))
  end

  def self.get_deps_lib_path
    "#{get_top_dir()}/deps/lib"
  end

  def self.get_deps_inc_path
    "#{get_top_dir()}/deps/include/bullet/"
  end

  def self.get_inc_flags
    " -I#{get_top_dir()}/deps/include/bullet/ " +     
    " -I#{get_top_dir()}/deps/include/bullet/LinearMath/ " + 
    " -I#{get_top_dir()}/deps/include/bullet/BulletCollision/CollisionDispatch/ " + 
    " -I#{get_top_dir()}/deps/include/bullet/BulletCollision/BroadphaseCollision/ " + 
    " -I#{get_top_dir()}/deps/include/bullet/BulletCollision/NarrowPhaseCollision/ " +
    " -I#{get_top_dir()}/deps/include/bullet/BulletCollision/CollisionShapes/ " + 
    " -I#{get_top_dir()}/deps/include/bullet/BulletCollision/Gimpact/ " + 
    " -I#{get_top_dir()}/deps/include/bullet/BulletDynamics/ConstraintSolver/ " + 
    " -I#{get_top_dir()}/deps/include/bullet/BulletDynamics/Dynamics/ " +
    " -I#{get_top_dir()}/deps/include/bullet/BulletDynamics/Vehicle/ " + 
    " -I#{get_top_dir()}/deps/include/bullet/BulletDynamics/Character/ " + 
    " -I#{get_top_dir()}/deps/include/bullet/BulletSoftBody/ "
  end
end
