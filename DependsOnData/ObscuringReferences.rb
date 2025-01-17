class ObscuringReferences
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def diameters # < -- BAD
    data.collect{|cell|
      cell[0] + (cell[1] * 2)}
  end

  # the class expect to be initialized with 2D array
end

# cell is each sub-array (e.g., [10, 2]).
# cell[0]: Represents the rim diameter.
# cell[1]: Represents the tire thickness.

# Problems with This Design (Why It's "BAD")
# The design is considered bad because it violates the principle of encapsulation:

# Low-Level Data Representation Leak:
# The diameters method directly manipulates the internal structure of data (a 2D array).
# Any change in the data format would require changes to the diameters method, making the code brittle and hard to maintain.

# Poor Readability:
# The hard-coded indices (cell[0] and cell[1]) obscure the meaning of the data, making the code less readable.

