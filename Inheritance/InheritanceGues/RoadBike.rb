require_relative 'Bicycle'

class RoadBike<Bicycle
  
  def initialize(**opts)
    super
    @tape_color = opts[:tape_color]
  end

  def spares
    { tire_size: '23',
      tape_color: tape_color
    }
  end

  # other methods
end
