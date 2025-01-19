require_relative 'Wheel'

class Gear
  attr_reader :chainring, :cog, :rim, :tire

  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @rim = rim
    @tire = tire
  end

  def gear_inches
    ratio * Wheel.new(rim, tire).diameter
  end

  def ratio
    chainring / cog.to_f
  end
end

# Gear depends on Wheel
# An object has dependency when it knows:
#
# 1️⃣ The name of another class. Gear expect a class name Wheel to exist.
#
# 2️⃣ The name of a message that it intends to send to someone other than self.
# Gear expects a Wheel instance to respond to diameter
#  
# 3️⃣ The arguments that a message requires. Gear knows that Wheel.new requires a rim and a tire.
# 
# 4️⃣ The order of those arguments. Gear knows that Wheel takes 
# positional arguments and that the first should be rim, the second, tire.
# 