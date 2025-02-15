require_relative 'Bicycle'
class RoadBike<Bicycle
  attr_reader :tape_color

  def initialize(**opts)
    super
    @tape_color = opts[:tape_color]
  end

  def spares
    super.merge(
    { tire_size: tire_size,
      tape_color: tape_color
    })
  end

  # if this class had not default_tire_size method
  # Ruby will check the super class for that method
  # and it will use the version in the super class
  def default_tire_size
    "23-tire-size-sub-class"
  end

  # other methods
end
