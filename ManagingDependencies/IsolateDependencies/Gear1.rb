require_relative 'Wheel'

class Gear1
  attr_reader :chainring, :cog, :wheel

  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @wheel = Wheel.new(rim,tire)
    # this creates a new wheel each time a new Geat is created
  end

  def gear_inches
    ratio * wheel.diameter
  end

  def ratio
    chainring / cog.to_f
  end
end


# If you can't remove the unnecessary dependencies you shoould 
# isolate them within your class.
#  
# Concise, explicit, isolated
#
# If you can't change the code to inject a Wheel into a Gear, you 
# should isolate the creating of a new Wheel
# inside the Gear class. The intend is to explicitly expose the 
# dependency while reducing its reach into your class.
# 
#