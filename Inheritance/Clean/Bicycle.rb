class Bicycle 
  attr_reader :size, :chain, :tire_size, :style, :pump
  
  # Ruby doesn’t count **opts as another required argument. 
  # It’s just a “catch-all” for any keyword arguments.
  # **opts is considered optional; passing nothing will ot raise exception
  
  def initialize(style, pump, **opts)
    @style = style
    @pump = pump
    @size = opts[:size]
    @chain = opts[:chian] || default_chain
    @tire_size = opts[:tire_size] || default_tire_size

    post_initialize(**opts)
  end

  def post_initialize(**opts)
    # hook
  end

  def default_chain
    "21"
  end

  def default_tire_size
    "23.5-tire-size"
  end

  def spares
    { tire: tire_size,
      chain: chain
    }.merge(local_spares)
  end

  def local_spares
    # hook
    {}
  end
end
