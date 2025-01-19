require_relative 'Wheel'

# When Gear is part of an external framework
module SomeFramework
  class Gear
    attr_reader :chainring, :cog, :wheel

    def initialize(chainring, cog, wheel)
      @chainring = chainring
      @cog = cog
      @wheel = wheel
    end

    def gear_inches
      ratio * wheel.diameter
    end
  
    def ratio
      chainring / cog.to_f
    end
  end
end

# Wrap the interface to protec yourself from change
module GearWrapper
  def self.gear(chainring:, cog:, wheel:)
    SomeFramework::Gear.new(chainring, cog, wheel)
  end
end

# Now you can create a new Gear using keyword arguments
puts GearWrapper.gear(chainring: 52, cog: 11, wheel: Wheel.new(26, 1.5)).gear_inches


# Gear Wrapper is not ment to be included in other classes, it's meant to 
# derectly respond to the gear message
# 
#
# Class methods like self.gear are often used when the method doesn’t depend 
# on the state of an instance (i.e., it doesn’t use instance variables).
# 
#