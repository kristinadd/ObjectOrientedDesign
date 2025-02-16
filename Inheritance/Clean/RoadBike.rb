require_relative 'Bicycle'

class RoadBike<Bicycle
  attr_reader :tape_color
  
  # def initialize(style, **opts)
  #   super
  #   @tape_color = opts[:tape_color]
  # end
  

  def post_initialize(**opts)
    @tape_color = opts[:tape_color]
  end

end

