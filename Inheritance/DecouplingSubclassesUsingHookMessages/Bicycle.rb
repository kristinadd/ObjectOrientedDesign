class Bicycle 
  attr_reader :zise, :chain, :tire_size
  
  def initialize(**opts)
    @size = opts[:size]
    @chain = opts[:chian] || default_chain
    @tire_size = opts[:tire_size] || default_tire_size

    post_initialize(opts)
    # This pattern (where the parent’s initialize calls a hook method like 
    # post_initialize) is a classic Template Method approach: the parent 
    # provides the main “template” for initialization, and the subclass 
    # can override only what it needs to customize.
  end

  # hook method
  # def post_initialize(opts)
    # Bicycle’s initialize sets up the “common” parts (size, chain, tire_size).
    # It then calls post_initialize(opts), which is empty in the parent.
    # This lets the child classes override post_initialize without worrying 
    # about calling super or duplicating code.
    

    # Key Benefit: By centralizing the parent’s initialization in one place 
    # and providing a “hook” (post_initialize), you avoid the complexity of 
    # repeated super calls in each child class.
  # end

  def default_chain
    "21"
  end

  def default_tire_size
    "23.5-tire-size"
  end
end
