class Gear2
  attr_reader :chainring, :cog, :wheel

  def initialize(chainring, cog, wheel)
    @chainring = chainring
    @cog = cog
    @wheel = Wheel.new(tim, tire)
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    ratio * wheel.diameter
  end

  Wheel = Struct.new(:rim, :tire) do
    def diameter
      tim + (tire * 2)
    end
  end
end

# the Wheel struct is not a long-term design goal; it's more an experiment in code organization
# 
#Embedding the Wheel inside of Gear suggests that you expect that Wheel will only exist in the context of a Gear. 
#
#Create an independent Wheel class -- simply convert the Wheel Struct to an independent Wheel class.