require_relative 'Bicycle'

class Mtb<Bicycle
  attr_reader :rear_shock

  def post_initialize(opts)
    @rear_shock = opts[:rear_shock]
  end
end


