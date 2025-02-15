require_relative 'Mtb'
require_relative 'RoadBike'
# Use require_relative for local files, especially when files 
# are in the same directory or subdirectories.

class Test
  bike = Mtb.new(size: 'S', front_shock: "SpeedShock")

  puts bike.size
  puts bike.front_shock
  puts bike.spares

  road_bike = RoadBike.new(tape_color: "pink")
  puts road_bike.size
  puts road_bike.tape_color

  puts road_bike.spares
end

