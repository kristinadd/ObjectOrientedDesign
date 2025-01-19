require_relative 'Wheel'

class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(chainring, cog, wheel)
    @chainring = chainring
    @cog = cog
    @wheel = wheel
  end

  def gear_inches
    ratio * wheel.diameter
    # gear expects a Duck that knows diameter
  end

  def ratio
    chainring / cog.to_f
  end
end

# now Gear only knows that it holds an object that responds to diameter
# 
# Gear can now colaborate with object that implements diameter
# 
# This is dependency injection
# 
#