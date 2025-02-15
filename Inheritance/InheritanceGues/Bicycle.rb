class Bicycle
  # Because Bicycle is the superclass (or "abstract" class in design), 
  # any subclass that inherits from Bicycle automatically inherits 
  # these getter methods.
  # 
  # Inherited Getters: A subclass like Mtb < Bicycle doesn't need to 
  # define its own methods to access @size, @chain, or @tire_size—they're 
  # already available.
  attr_reader :size, :chain, :tire_size

  def initialize(**opts)
    @size = opts[:size]
    @chain = opts[:chain] || default_chain
    @tire_size = opts[:tire_size] || default_tire_size
    # Dynamic Method Lookup (a.k.a. Dynamic Dispatch):
    # When Ruby sees a call to default_tire_size, it looks on the actual 
    # object for that method. If the object is an instance of a subclass 
    # (e.g., RoadBike), Ruby first checks RoadBike for default_tire_size.
    # 
    #
    # If RoadBike defines default_tire_size, that version is used.
    # If not, Ruby goes up the inheritance chain to Bicycle. If Bicycle 
    # provides a default_tire_size, that version is used.

  end

  def spares
    { chain: chain,
      tire_size: tire_size
    }
  end

  def default_chain
    "11-speed"
  end

  # Ruby will use ⬇️ this version if the concrete 
  # class has no default_tire_size method

  # def default_tire_size
  #   "27-tire-size-super-class"
  # end

  # other methods
end


