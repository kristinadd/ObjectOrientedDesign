class ObscuringReferences
  attr_reader :wheels

  def initialize(data)
    @wheels = wheelify(data)
  end

  def diameters
    wheels.collect {|wheel|
      wheel.rim + (wheel.tire * 2)}
  end

  # now everyone can send rim/tire to wheel
  Wheel = Struct.new(:rim, :tire)
  def wheelify(data)
    data.collect {|wheel|
    Wheel.new(wheel[0], wheel[1])}
  end
end
