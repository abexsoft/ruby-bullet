class BulletConfig
  def self.getDepsLib
    File.dirname(File.dirname(File.expand_path(__FILE__))) + "/deps/lib"
  end

  def self.getDepsInc
    File.dirname(File.dirname(File.expand_path(__FILE__))) + "/deps/include"
  end

  def self.getLib
    File.dirname(File.expand_path(__FILE__))
  end
end
