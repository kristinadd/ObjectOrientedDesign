
class Customer
# trip_finder is the primary object on which the method operates. It's not just a piece of data 
# like on_date or of_difficulty; instead, it's the collaborator that performs the key action 
# (finding suitable trips).By convention, in object-oriented design, collaborators like trip_finder 
# are often passed as positional arguments to emphasize their importance as dependencies.
  def find_suitable_trips(trip_finder, on_date:, of_difficulty:, need_bike:)
    trip_finder.suitable_trips(on_date: on_date, of_difficulty: of_difficulty, need_bike: need_bike)
  end
end


class TripFinder
  def suitable_trips(on_date:, of_difficulty:, need_bike:)
    # Query trips that match the date and difficulty
    trips = Trip.suitable_trips(on_date: on_date, of_difficulty: of_difficulty)

    if need_bike
      # For each trip, find a suitable bicycle
      trips.each do |trip|
        bicycle = Bicycle.suitable_bicycle(trip_date: trip.date, route_type: trip.route_type)
        puts "Trip: #{trip}, Bicycle: #{bicycle}"
      end
    else
      puts "Trips found: #{trips}"
    end
  end
end


class Trip
  attr_reader :date, :route_type

  def initialize(date, route_type)
    @date = date
    @route_type = route_type
  end

  # Simulates finding trips based on criteria
  def self.suitable_trips(on_date:, of_difficulty:)
    puts "Finding trips on #{on_date} with difficulty #{of_difficulty}"
    [new(on_date, "mountain"), new(on_date, "road")]
  end
end


class Bicycle
  # Simulates finding a suitable bicycle for a trip
  def self.suitable_bicycle(trip_date:, route_type:)
    puts "Finding bicycle for trip_date: #{trip_date}, route_type: #{route_type}"
    "Bicycle for #{route_type}"
  end
end

# Example Usage
customer = Customer.new
trip_finder = TripFinder.new

# Customer looks for trips with specific criteria
customer.find_suitable_trips(trip_finder, on_date: "2025-01-30", of_difficulty: "medium", need_bike: true)
