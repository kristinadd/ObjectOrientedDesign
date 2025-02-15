require_relative 'Bicycle' # Always ensure parent classes are loaded before subclasses.

# A child class can only inherit from one parent class in Ruby (no multiple inheritance).
class Mtb<Bicycle
  # Inherited Getter: You don't need to redefine attr_reader 
  # :tire_size in the Mtb class if you don't intend to 
  # override or modify its behavior.

  attr_reader :front_shock, :rear_shock # :tire_size
  def initialize(**opts)
    super
    @front_shock = opts[:front_shock]
    @rear_shock = opts[:rear_shock]
    # @tire_size = opts[:tire_size]
    # The assignment for @tire_size here is redundant 
    # because super already did it in the parent’s initialize.
    

    # You would only need to set it again in the subclass if you
    # intended to modify or override the behavior from the parent. 
    # Otherwise, it's best to let the parent class handle it.
  end

  def spares
    super.merge(
    { tire_size: tire_size,
      front_shock: front_shock,
      rear_shock: rear_shock
    })
  end

  # other methods
end


# super 
# The super keyword is used in a child class to call a method of the same 
# name from its parent class.

# super(size: opts[:size])  # Pass only `:size` to `Bicycle#initialize`

# super() --> If you call super() with empty parentheses, 
# it does not forward any arguments to the parent method.

# The super keyword, when used without parentheses, 
# automatically forwards all arguments received by 
# the child method to the parent method, including:
# Positional arguments (if any).
# Keyword arguments (if the method uses **opts).