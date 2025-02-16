require_relative 'Bicycle'
require_relative 'RoadBike'

class Test
  
  road_bike = RoadBike.new("New-Style", "pump", tape_color: "pink")

  puts road_bike.tape_color
  puts road_bike.style
  puts road_bike.pump

  # puts road_bike.tire_size
  # puts road_bike.chain

  puts road_bike.spares

  puts road_bike.local_spares
end