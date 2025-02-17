require_relative 'Parts'

class MountainBikeParts<Parts
  attr_reader :front_shock, :rear_shock

  def post_initialize(**opts)
    @front_shock = opts[:front_shock]
    @rear_shock = opts[:rear_shock]
  end

  def local_spares
    {
      front_shock: front_shock
    }
  end

  def default_tire_size
    "2.1"
  end
end

