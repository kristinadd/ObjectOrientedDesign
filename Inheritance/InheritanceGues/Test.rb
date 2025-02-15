require_relative 'Mtb'
require_relative 'RoadBike'
# Use require_relative for local files, especially when files 
# are in the same directory or subdirectories.

class Test
bike = Mtb.new(front_shock: "Shook34", size: "S", tire_size: 2.7)

puts bike
puts bike.tire_size
puts bike.chain

road_bike = RoadBike.new(size: "S", tape_color: "pink")

puts road_bike.tape_color
puts road_bike.tire_size
end

