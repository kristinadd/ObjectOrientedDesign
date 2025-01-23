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



# Violation of Single Responsibility Principle (SRP)
# The Customer class is taking on too many responsibilities:
# It is responsible for determining which trips are suitable by interacting with the Trip class.
# It is responsible for determining which bicycles are suitable by interacting with the Bicycle class.
# 
#
# Why this is a problem:
# The Customer class is not focused solely on being a customer. Instead, it is now tightly coupled to the application's logic for finding trips and bicycles, which is outside its primary role.
# 
#
# Tight Coupling
# The Customer class directly interacts with both the Trip and Bicycle classes.
# Why this is a problem:
# If the interface or behavior of the Trip or Bicycle classes changes, the Customer class will also need to change.
# This makes the code less flexible and harder to maintain because changes ripple across multiple parts of the system.
# 
#
#
# Customer Knows Too Much
# The Customer class has explicit knowledge of:
# How to find trips (suitable_trips message to the Trip class).
# How to find bicycles (suitable_bicycle message to the Bicycle class).
# The Customer class is acting as a coordinator, orchestrating the interaction between Trip and Bicycle.
# Why this is a problem:
# This makes the Customer class overly complex.
# The Customer is responsible for logic that should belong elsewhere (e.g., in a TripPlanner or Coordinator class).
# If additional objects (e.g., a Guide or Hotel) are added to the system, the Customer would need to handle even more responsibilities.
# 
#
# Limited Reusability
# The logic for finding suitable trips and bicycles is embedded in the Customer class.
# Why this is a problem:
# If you need to reuse this logic in another part of the application (e.g., for a report or a backend process), you would have to duplicate or extract it later.
# This design doesn't promote separation of concerns, which makes reuse difficult.
# 
#
# Violation of the Law of Demeter
# The Customer class is explicitly navigating relationships between objects (e.g., sending messages to Trip and then iterating through each trip to send messages to Bicycle).
# Why this is a problem:
# The Customer class is too aware of the internal workings of other objects, which violates the Law of Demeter (a.k.a. "Don't talk to strangers").
# Instead of just requesting a "plan" from a higher-level object, the Customer is micro-managing how trips and bicycles are found.
# 
#
# Poor Scalability
# If the requirements change (e.g., adding a Guide class or introducing weather-dependent trip suitability), the Customer class would need to handle even more complexity.
# Why this is a problem:
# Adding new responsibilities would require modifying the Customer class, increasing the risk of introducing bugs.
# The design is not flexible enough to accommodate future changes without significant refactoring.
# 
#
#