require_relative 'Parts'

class RoadBikeParts<Parts
  attr_reader :tape_color # getter method

  def post_initialize(**opts)
    @tape_color = opts[:tape_color]
  end

  def local_spares
    {
      tape_color: tape_color
    }
  end

  def default_tire_size
    "23"
  end
end

