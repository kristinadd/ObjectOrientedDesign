require_relative 'Bicycle'

class RoadBike<Bicycle
  attr_reader :tape_color
  
  def post_initialize(**opts)
    @tape_color = opts[:tape_color]
  end

end

