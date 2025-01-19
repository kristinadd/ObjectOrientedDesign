require_relative 'Wheel'

class Gear2
  attr_reader :chainring, :cog, :rim, :tire

  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @rim = rim
    @tire = tire
  end

  def gear_inches
    ratio * wheel.diameter
  end

  def wheel
    @whell ||= Wheel.new(rim, tire)
  end

  def ratio
    chainring / cog.to_f
  end
end

# Gear is still stuck to Wheel; it can't calculate the gear inches of no other kind of object.
# It still takes rim and tire as initialization arguments, and it still creates its own instance of wheel.

# Isolate the creation of a new Wheel in its own explicitly defined wheel method
# This new method lazily creates a new wheel instance of Wheel, using Ruby's ||= operator.
# 

# Purpose of Memoization
# Memoization is a technique used to cache the result of a method or computation so that it 
# doesn’t need to be recomputed every time the method is called. In this case, 
# the @wheel instance variable will be initialized only once, and subsequent calls to 
# the wheel method will reuse the already-created object.
# 
#
# ||=
# This is a conditional assignment operator in Ruby.
# It assigns a value to @wheel only if @wheel is nil or false. If @wheel already has a value, 
# the existing value is used, and the right-hand side (Wheel.new(rim, tire)) is not evaluated.
# 
#
# Subsequent Calls to wheel:
# If @wheel is already initialized (not nil), the code will skip Wheel.new(rim, tire) and 
# simply return the cached @wheel value.
# 
#
# def wheel
#   @wheel = Wheel.new(rim, tire)
# end
# The Wheel object would be created every time the wheel method is called, regardless of 
# whether @wheel was already assigned or not. This would result in multiple Wheel objects 
# being created, which is inefficient and undesirable.
# 
#