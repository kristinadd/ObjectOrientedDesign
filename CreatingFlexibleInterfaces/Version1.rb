class Customer
  attr_reader :name, :trip_service

  def initialize(name:, trip_service:)
    @name = name
    @trip_service = trip_service
  end
  
  def find_trips(on_date:, on_dificulty:, need_bike:)
    trip_service.suitable_trips(on_date: on_date, on_dificulty: on_dificulty, need_bike: need_bike)
  end

  # private
  # 
  # attr_reader :trip_service
end

# now puts customer.trip_service.suitable_trips(on_date: Time.now, on_dificulty: 'easy', need_bike: 'yes')
# will raise an error because trip service is private.
# With this encapsulation, external code should only use:
# customer.find_trips



class Trip
  def suitable_trips(on_date:, on_dificulty:, need_bike:)
    # some logic to find the 
    # trips based on the 
    # provided parameters
    "This is a suitable trip"
  end
end


puts customer = Customer.new(name: "Moe", trip_service: Trip.new)
puts customer.name
puts customer.trip_service.suitable_trips(on_date: Time.now, on_dificulty: 'easy', need_bike: 'yes') # Violates Encapsulation
puts customer.find_trips(on_date: Time.now, on_dificulty: 'easy', need_bike: 'yes')

