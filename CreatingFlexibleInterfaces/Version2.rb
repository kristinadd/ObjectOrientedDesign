class Customer
  attr_reader :trip_service, :bike_service

  def initialize(trip_service:, bike_service:)
    @trip_service = trip_service
    @bike_service = bike_service
  end
  
  def find_trips_and_bike(on_date:, of_difficulty:)
    suitable_trips = trip_service.suitable_trips(on_date: on_date, of_difficulty: of_difficulty)

    suitable_trips.map do |trip|
      bike = bike_service.suitable_bicycle(trip_date: trip[:trip_date], route_type: trip[:route_type])
      {trip: trip, bike: bike} # If you're using this inside a loop or an iterative method (e.g., .map), it will return multiple hashes as part of an array.
      # If you're using this inside a .map or similar enumerator, it will return an array of hashes because .map collects and returns the result of each iteration into an array.
      # If you are not using a method like .map, you'll need to create an array manually and append the hashes using a method like << or push
    end
  end
end

class Trip
  def suitable_trips(on_date:, of_difficulty:)
    # Logic to find suitable trips (returns an array of trips)
    [{ trip_date: on_date, route_type: 'mountain' }, { trip_date: on_date, route_type: 'road' }, { trip_date: on_date, route_type: 'trail' }]
  end
end

class Bicycle
  def suitable_bicycle(trip_date:, route_type:)
    # Logic to find a suitable bicycle for the trip
    "Bicycle suitable for #{route_type} route on #{trip_date}"
  end
end

trip_service = Trip.new
bike_service = Bicycle.new
customer = Customer.new(trip_service: trip_service, bike_service: bike_service)
results = customer.find_trips_and_bike(on_date: Time.now, of_difficulty: "moderate")

results.each do |result|
  puts result
end

