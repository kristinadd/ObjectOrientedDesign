require_relative 'Bicycle'
class RoadBike<Bicycle
  attr_reader :tape_color, :tire_size

  def initialize(**opts)
    super
    @tape_color = opts[:tape_color]
    @tire_size = opts[:tire_size]
  end

  def spares
    super.merge(
    { tire_size: tire_size,
      tape_color: tape_color
    })
  end

  # other methods
end
