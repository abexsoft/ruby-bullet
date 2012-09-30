class BulletConfig
  def self.getTopDir
    File.dirname(File.dirname(File.expand_path(__FILE__)))
  end

  def self.getDepsLibPath
    "#{getTopDir()}/deps/lib"
  end

  def self.getDepsIncPath
    "#{getTopDir()}/deps/include/bullet/"
  end

  def self.getIncFlags
    " -I#{getTopDir()}/deps/include/bullet/ " +     
    " -I#{getTopDir()}/deps/include/bullet/LinearMath/ " + 
    " -I#{getTopDir()}/deps/include/bullet/BulletCollision/CollisionDispatch/ " + 
    " -I#{getTopDir()}/deps/include/bullet/BulletCollision/BroadphaseCollision/ " + 
    " -I#{getTopDir()}/deps/include/bullet/BulletCollision/NarrowPhaseCollision/ " +
    " -I#{getTopDir()}/deps/include/bullet/BulletCollision/CollisionShapes/ " + 
    " -I#{getTopDir()}/deps/include/bullet/BulletCollision/Gimpact/ " + 
    " -I#{getTopDir()}/deps/include/bullet/BulletDynamics/ConstraintSolver/ " + 
    " -I#{getTopDir()}/deps/include/bullet/BulletDynamics/Dynamics/ " +
    " -I#{getTopDir()}/deps/include/bullet/BulletDynamics/Vehicle/ " + 
    " -I#{getTopDir()}/deps/include/bullet/BulletDynamics/Character/ " + 
    " -I#{getTopDir()}/deps/include/bullet/BulletSoftBody/ "
  end
end
