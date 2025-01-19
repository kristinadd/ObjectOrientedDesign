require_relative 'Wheel'

class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(chainring: default_code, cog: 18, wheel:)
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

  def default_code
    (100 / 2) - 10 # dummy example
  end
end

# Keyword Arguments
# 
#