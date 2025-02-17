class Parts # Abstract class
  attr_reader :chain, :tire_size

  def initialize(**opts)
    @chain = opts[:chain] || default_chain
    @tire_size = opts[:tire_size] || default_tire_size

    post_initialize(**opts)
  end

  def spares
    { chain: chain,
      tire_size: tire_size}.merge(local_spares)
  end

  def default_tire_size
    raise NotImplementedError
  end

  def post_initialize(**opts)
    # hook
  end
  
  def default_chain
    "11-Speed"
  end

  def local_spares
    {}
  end
end
