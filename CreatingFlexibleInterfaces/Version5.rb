
# This design is an enhancement of the delegation approach shown previously, but with a stronger 
# focus on separating the "what" from the "how". In this design, the Trip class only communicates 
# its desire to be prepared by asking the Mechanic to prepare it, and the Mechanic retrieves the 
# details it needs (e.g., the bicycles) directly from the Trip.
# 
# This approach further decouples the Trip and Mechanic classes, as Trip does not directly instruct 
# the Mechanic on what to do or provide the list of bicycles itself.
# 
#
# 
# Trip's Responsibility:
# The Trip is only responsible for knowing that it wants to be "prepared."
# It delegates this responsibility entirely to the Mechanic by passing itself as an argument.
# Mechanic's Responsibility:
# The Mechanic knows how to prepare the Trip.
# It retrieves the bicycles list from the Trip and performs the required actions on each bicycle.
# 
#
#


class Trip
  attr_reader :bicycles

  def initialize(bicycles) # public interface for Trip
    @bicycles = bicycles
  end

  # Asks the Mechanic to prepare this Trip
  def prepare(mechanic)
    mechanic.prepare_trip(self) # Explicitly passes itself (Trip instance)
    # self refers to how Ruby uses the self keyword to refer to the current 
    # instance of the class that is executing the method. Essentially, 
    # self is a way to reference the current object within its own context.
  end
  # Trip tells mechanic what it wants, passes self along as an argument
  # and Mechanic immediatly calls back to Trip to get the list of the 
  # Bycicles that need preparation
end


class Mechanic
  # Prepares a Trip by fetching its bicycles and preparing each one
  def prepare_trip(trip) # public interface for Mechanic 
    trip.bicycles.each do |bicycle|
      prepare_bicycle(bicycle)
    end
  end

  private

  def prepare_bicycle(bicycle)
    clean_bicycle(bicycle)
    pump_tires(bicycle)
    lube_chain(bicycle)
    check_brakes(bicycle)
  end

  def clean_bicycle(bicycle)
    puts "Cleaning bicycle: #{bicycle}"
  end

  def pump_tires(bicycle)
    puts "Pumping tires for bicycle: #{bicycle}"
  end

  def lube_chain(bicycle)
    puts "Lubing chain for bicycle: #{bicycle}"
  end

  def check_brakes(bicycle)
    puts "Checking brakes for bicycle: #{bicycle}"
  end
end

# Example usage
bicycles = ["Bike 1", "Bike 2", "Bike 3"]
trip = Trip.new(bicycles)
mechanic = Mechanic.new

# Trip asks Mechanic to prepare it
trip.prepare(mechanic)


