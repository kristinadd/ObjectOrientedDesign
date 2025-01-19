require_relative 'Gear'
require_relative 'Wheel'

class Test
  puts Wheel.new(rim: 26, tire: 1.5, chainring: 52, cog: 11).gear_inches
end