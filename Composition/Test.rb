require_relative 'Bicycle'
require_relative 'Parts'
require_relative 'RoadBikeParts'
require_relative 'MountainBikeParts'

class Test
  road_bike = Bicycle.new(
    size: "L", 
    parts: RoadBikeParts.new(tape_color: "pink")
  )

  puts road_bike.size
  puts road_bike.parts.tape_color

  
end

