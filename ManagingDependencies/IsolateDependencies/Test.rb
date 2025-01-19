require_relative 'Gear3'
require_relative 'Wheel'

class Test
  puts gear = Gear3.new(52,11,26,1.5)
  puts gear.gear_inches

end
