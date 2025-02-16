require_relative 'Bicycle'

class RoadBike<Bicycle
  attr_reader :tape_color

  # RoadBike can optionally override it
  def post_initialize(opts)
    @tape_color = opts[:tape_color]
  end

  # Each subclass only focuses on its own unique initialization details in
  # post_initialize. There’s no repeated boilerplate for calling super(args)
  # or reassigning the same variables the parent already handles.
  

  # Avoids Confusion with super Arguments:
  # If multiple subclasses had slightly different parameter lists, or if the
  # parent’s initialization changed over time, you’d have to keep updating every
  # super call. The hook approach centralizes all the parent logic in one spot.
  

  # Follows the Template Method Pattern:
  # In object-oriented design, a template method is a method (like initialize) that
  # defines the overall structure of an algorithm (or in this case, object setup).
  # Subclasses can override certain “hook” parts (post_initialize) without changing the overall flow.

  # Extensible for More Hooks:
  # You can add other hooks (e.g., pre_initialize or post_process) if you need more
  # structured extension points. The parent sets the “template,” and the children only fill in the blanks.
end

