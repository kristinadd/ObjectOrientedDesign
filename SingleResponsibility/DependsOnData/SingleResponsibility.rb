############## Single Responsibility ##############

def diameters
  wheels.collect {|wheel|
    wheel.rim + (wheel.tire * 2)}
end

# has two responsibilities, it iterates over the wheels and it calculates the diameter of each wheel

# first just iterate over the array
def diameter
  wheels.collect {|wheel| diameter{wheel}} 
end
# then calculate
def diameter(wheel)
  wheel.rim + (rim * 2)
end
