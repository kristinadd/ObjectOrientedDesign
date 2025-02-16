require_relative 'Bicycle'

class RecumbentBike<Bicycle
  attr_reader :flag

  def initialize(**opts)
    super # need to call super to raise the exception 
    @flag = opts[:flag] # forgot to send super
    # When forget to send super during initialize, it
    # misses out on the common initialization provided by the Bicycle
    # and does not get a valid size, chain, or tire size. This error
    # can manifestat a time and places far distant from its cause, 
    # making it very hard to debug.
  end

  # implementation of the template method defined in the superclass
  # def default_tire_size
  #   "33-concrete-class"
  # end
end
