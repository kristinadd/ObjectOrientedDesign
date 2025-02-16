require_relative 'Bicycle'
require_relative 'RoadBike'

class Test
  
  road_bike = RoadBike.new("New-Style", tape_color: "pink")

  puts road_bike.tape_color
  puts road_bike.style
end