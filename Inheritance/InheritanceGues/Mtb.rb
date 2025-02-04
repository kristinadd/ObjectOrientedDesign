require_relative 'Bicycle' # Always ensure parent classes are loaded before subclasses.

# A child class can only inherit from one parent class in Ruby (no multiple inheritance).
class Mtb<Bicycle
  attr_reader :front_shock, :rear_shock
  def initialize(**opts)
    super # The super keyword is used in a child class to call a method of the same name from its parent class.

    # super(size: opts[:size])  # Pass only `:size` to `Bicycle#initialize`

    # super() --> If you call super() with empty parentheses, 
    # it does not forward any arguments to the parent method.

    # The super keyword, when used without parentheses, 
    # automatically forwards all arguments received by 
    # the child method to the parent method, including:
    # Positional arguments (if any).
    # Keyword arguments (if the method uses **opts).
    @front_shock = opts[:front_shock]
    @rear_shock = opts[:rear_shock]
  end

  def spares
    super.merge(
    { tire_size: '2.5',
      front_shock: front_shock,
      rear_shock: rear_shock
    })
  end

  # other methods
end
