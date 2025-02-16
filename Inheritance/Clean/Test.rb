require_relative 'Bicycle'
require_relative 'RoadBike'

class Test
  
  road_bike = RoadBike.new(tape_color: "pink", style: "New-Style")

  puts road_bike.tape_color
  puts road_bike.style
end