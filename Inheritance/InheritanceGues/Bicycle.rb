class Bicycle
  attr_reader :size, :tape_color

  def initialize(**opts)
    @size = opts[:size]
  end

  def spares
    { chain: '11-speed'}
  end

  # other methods
end


