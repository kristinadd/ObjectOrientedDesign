require_relative 'Gear'
require_relative 'Wheel'

class Test
  puts gear = Gear.new(chainring: 52, cog: 11, wheel: Wheel.new(26, 1.5))
  puts gear.gear_inches

  puts Gear.new(wheel: Wheel.new(26, 1.5)).chainring

  puts Gear.new(chainring: 52, wheel: Wheel.new(26, 1.5)).chainring

  
end
