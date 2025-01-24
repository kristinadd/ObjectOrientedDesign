# This design is an example of a tightly coupled system where a class (in this case, Trip) 
# endtells another class (Mechanic) how to perform its job, rather than asking for the 
# result of what it wants. Let me explain it in detail.end
# 
#
#
# Goal: The Trip class needs to ensure that all bicycles scheduled for the trip are mechanically sound before the trip begins.
# Implementation:
# The Trip class holds a collection of bicycles.
# For each bicycle, the Trip class explicitly calls methods on a Mechanic object to prepare the bicycle:
# clean_bicycle(bike)
# pump_tires(bike)
# lube_chain(bike)
# check_brakes(bike)
# 
#


class Trip
  attr_reader :bicycles, :mechanic

  def initialize(bicycles:, mechanic:)
    @bicycles = bicycles
    @mechanic = mechanic
  end

  # Trip is responsible for telling the Mechanic what to do
  def prepare_bicycle
    bicycle.each do |bike|
      mechanic.clean_bicycle(bike)
      mechanic.pump_tires(bike)
      mechanic.lube_chain(bike)
      mechanic.check_brakes(bike)
    end
  end
end



class Mechanic
  def clean_bicycle(bike)
    puts "Cleaning bicycle #{bike}"
  end

  def pump_tires(bike)
    puts "Pumping tires of bicycle #{bike}"
  end

  def lube_chain(bike)
    puts "Lubing chain of bicycle #{bike}"
  end

  def check_brakes(bike)
    puts "Checking brakes of bicycle #{bike}"
  end
end


# Usage
bicycles = ["Bike 1", "Bike 2", "Bike 3"]
mechanic = Mechanic.new
trip = Trip.new(bicycles, mechanic)

trip.prepare_bicycles

# Violation of Encapsulation
# The Trip class knows too much about the internal workings of the Mechanic class:
# It knows the exact sequence of tasks the Mechanic must perform (cleaning, pumping tires, lubing the chain, etc.).
# If the Mechanic class adds a new procedure (e.g., checking the gear system), the Trip class will need to change to accommodate it.
# Why This Is a Problem:
# Changes in the Mechanic class ripple into the Trip class, which increases maintenance costs and introduces potential bugs.
# 
#
# Tight Coupling
# The Trip class directly calls multiple specific methods on the Mechanic class.
# Why This Is a Problem:
# The Trip class cannot work with any object that doesn’t have the exact methods (clean_bicycle, pump_tires, etc.). It’s tightly coupled to the Mechanic class.
# This reduces flexibility and makes it harder to replace or modify the Mechanic class.
# 
#
# The Trip Class Is Doing Too Much
# The Trip class is acting as a coordinator, dictating exactly how the Mechanic should do its work.
# Why This Is a Problem:
# The Trip class is taking on responsibilities that belong to the Mechanic.
# This violates the Single Responsibility Principle (SRP), making the Trip class harder to understand and maintain.
# 
#
# Rigid Design
# If a different type of object (e.g., SpecialistMechanic) needs to be introduced, it will require changes in the Trip class to adapt to the new methods or processes.
# Why This Is a Problem:
# The design is not easily extensible or adaptable to change.
# 
#
#