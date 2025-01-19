require_relative 'Wheel'

class Gear3
  attr_reader :chainring, :cog, :rim, :tire

  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @rim = rim
    @tire = tire
  end

  def gear_inches
    ratio * diameter
  end

  def wheel
    @whell ||= Wheel.new(rim, tire)
  end

  def diameter
    wheel.diameter
  end

  def ratio
    chainring / cog.to_f
  end
end

# Now that the reference to external classes is isolated, it's time to turn your
# attention to external "messages", that is, "messages" that are "sent to someone other than self"
# For example: the gear_inches method sends ratio and wheel to self but sends
# diameter to wheel.
# 
# def gear_inches
#   ratio * wheel.diameter
# end
# 
# This is simple method and it contains Gear's only reference to wheel.diameter. In this case, 
# the code is fine, but the situatiom could be more complex. Imagine that calculation gear_inches
# required far more math and method looks like this:
# 
# 
# def gear_inches
#   more lines of math code
#   foo = some_intermediate_result * wheel.diameter
#   more lines of math
# end
# 
#
# Now wheel.diameter is embedded deeply inside a complex method. This complex method depends on Gear
# responding to wheel and on wheel responding to diameter. Embedding the external dependency inside
# gear_inches method is unnecessary and increases its vulnerability.
# 
#like:
#
# def gear_inches
#   more lines of math code
#   foo = some_intermediate_result * diameter
#   more lines of math
# end