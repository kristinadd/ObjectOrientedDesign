require_relative 'Gear'
require_relative 'Wheel'

class Test
  puts gear = Gear.new(52,11, Wheel.new(26,1.5))
  puts gear.gear_inches
  # gear expects a Duck that knows diameter
end
