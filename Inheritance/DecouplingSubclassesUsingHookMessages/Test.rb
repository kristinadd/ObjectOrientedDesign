require_relative 'RoadBike'
require_relative 'Mtb'

class Test
  road_bike = RoadBike.new(tape_color: "pink")

  puts road_bike.tape_color
  # puts road_bike.size

  mtb = Mtb.new(size: "S", rear_shock: "Shockkkkk")

  puts mtb.rear_shock
end


