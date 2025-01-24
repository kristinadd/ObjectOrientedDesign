
class Trip
  attr_reader :bicycles

  def initialize(bicycles)
    @bicycles = bicycles
  end

  # Delegates bicycle preparation to the Mechanic
  def prepare_bicycles(mechanic)
    bicycles.each do |bicycle|
      mechanic.prepare_bicycle(bicycle)
    end
  end
end

# This style of coding places the responsibilities in the correct object,
# a great improvment, but continues to require that Trip have more context that is
# necessary. Trip still knows that it holds onto an object that can respond to 
# prepare_bicycle(bicycle) and it must always have this object

class Mechanic
  # Prepares a single bicycle
  def prepare_bicycle(bicycle)
    clean_bicycle(bicycle)
    pump_tires(bicycle)
    lube_chain(bicycle)
    check_brakes(bicycle)
  end

  private

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

trip.prepare_bicycles(mechanic)

# This version is better than Version3
# 
#
# Encapsulation:
# Mechanic encapsulates the details of bicycle preparation, making the system easier to maintain and extend.
# Reusability:

# The Mechanic can be reused in other contexts where bicycle preparation is needed.
# Reduced Coupling:

# Trip is not tightly coupled to the preparation logic, promoting flexibility and adherence to good design principles.
# This design ensures that any future changes in how bicycles are prepared will only affect the Mechanic class 
# and not the Trip class. Let me know if you’d like additional refinements or a different language implementation!end

