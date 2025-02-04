class Tiger
  def run
    puts "Tiger is runing"
  end
end

class Person
  def run
    puts "Person is runing"
  end
end

class Mouse
  def run
    puts "Mouse is runing"
  end
end


class Test
  def self.start(object)
    object.run
  end
end


object = Tiger.new

Test.start(object)