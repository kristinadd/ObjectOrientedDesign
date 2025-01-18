require_relative 'Wheel'
require_relative 'Gear'

class Test
  @wheel = Wheel.new(26, 1.5)
  puts @wheel.circumference


  puts Gear.new(52,11,@wheel).gear_inches


  puts Gear.new(52,11).ratio
end

# Both classes have single responsibility. The code is not perfect, but 
# is some ways, it achieves a higher standard: it is good enough.
# 