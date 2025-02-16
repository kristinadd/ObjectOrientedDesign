require_relative 'Bicycle'

class RoadBike<Bicycle
  attr_reader :tape_color

  def post_initialize(**opts)
    @tape_color = opts[:tape_color]
  end

  # avoiding the need to call super
  def local_spares
    { tape_color: tape_color}
  end

  def default_tire_size
    "28"
  end

  def default_chain
    "10-speed"
  end
end

