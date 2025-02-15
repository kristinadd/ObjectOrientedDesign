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
    @chain = opts[:chain]
    @tire_size = opts[:tire_size]
  end

  def spares
    { chain: chain,
      tire_size: tire_size
    }
  end

  # other methods
end


