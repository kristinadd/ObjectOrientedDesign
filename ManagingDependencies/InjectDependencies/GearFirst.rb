require_relative 'Wheel'

class GearFirst
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

# Referring to another class by it's name creates a major sticky spot. 
# The gear_inches method contains an explicit reference to class Wheel.
# If Wheel's name changes Gear class needs to be altered. But that's no such a big issue.
# 
# The bigger problem is that when Gear hard-codes a reference to Wheel deep inside its
# gear_inches method, it is explicitly declaring that it is only willing to calculate gear
# inches for instances of Wheel. Gear refuses to colaborate with any other kinf of object
# even if that object has a diameter and uses gears.
# 
# Gear needs access to an object that responds to diameter, a duck type, if you will
# 
# Gear does not care, and should not know about the class of that object. It's not necessary for Gear
# to know about the existence of the Wheel class in order to calculate gear_inches
# 
# In doesn't need to know that a Wheel expects to be initialized with rim and then a tire;
#  it just needs an object that knows diameter.
#  
# Gear becomes less useful when it knows too much about other objects. If if knew less it could do more.
# 
# Instead of being glued to Wheel, Gear expects to be initialized with an object that can respond to diameter. 
# 
#
#