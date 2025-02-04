require_relative 'Mtb'
require_relative 'RoadBike'
# Use require_relative for local files, especially when files are in the same directory or subdirectories.

class Test
  bike = Mtb.new(size: 'S', front_shock: "SpeedShock")

  puts bike.size
  puts bike.front_shock
  puts bike.spares
end

