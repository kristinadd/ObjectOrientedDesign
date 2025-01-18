class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(chainring, cog, wheel=nil)
    @chainring = chainring
    @cog = cog
    @wheel = wheel
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    ratio * wheel.diameter
  end
end

# The ath to changeable and maintainable object-oriented software 
# begins with classes that have single responsibility. Classes that 
# do one thing "isolate" that thing from the rest of your application. 
# This isolation allows change without consequences and reuse without duplication. 
# 
