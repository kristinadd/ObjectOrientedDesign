class Bicycle 
  attr_reader :size, :chain, :tire_size, :style
  
  def initialize(style, **opts)
    @style = style
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
end
