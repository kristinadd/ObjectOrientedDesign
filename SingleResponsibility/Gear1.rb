class Gear1
  attr_reader :chainring, :cog, :rim, :tire # getters
  
  def initialize(chainring, cog, rim , tire)
    @chainring = chainring
    @cog = cog
    @rim = rim
    @tire = tire
  end

  def ratio
    chainring / cog.to_f # < -- GOOD
  end
  # def ratio  
  #   @chainring / @cog.to_f  # < --- BAD
  # end
  # 
  #
  # always encapsulate the variables in method, use attr_reader


  # def gear_inches <-- FROM THIS
  #   ratio * (rim + (tire * 2))
  # end
  # 
  #
  # Gear is definetly responsible for calculating gear_inches, 
  # but Gear shouldn't be calculating wheel diameter  
  
  def gear_inches # <-- TO THIS
    ratio * diameter
  end

  def diameter
    rim + (tire * 2)
  end
end

puts Gear.new(52,11,26,1.25).gear_inches

