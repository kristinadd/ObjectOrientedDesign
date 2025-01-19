require_relative 'Wheel'

class Gear
  attr_reader :chainring, :cog

  def initialize(chainring:, cog:)
    @chainring = chainring
    @cog = cog
  end

  def gear_inches(diameter)
    ratio * diameter
  end

  def ratio
    chainring / cog.to_f
  end
  # ... 
end

# Dependencies always have a direction; earlier in the chapter 
# was suggested that one way to manage them is to reverse that 
# direction. 
# 
#
# Every example so far shows Gear depending on Wheel or diameter, 
# but the code could have been easily written with the direction
# of the dependencies reversed. Wheel could insted depend on 
# Gear or ratio. 
# 
# Some classes are more likely than others to have changes in requirements.
# 
# Concrete classesare more likely to change than abstract classes.
# 
#Chnging a class that has many dependencies will result in widespread consequences.
#
#
# *** Undertanding Likelihood of Change:
# Regardless of its origin, every class used in your application can be ranked along a 
# scale of how likely it is to undergo a change relative to all other classes. This
# ranking is one key piece of information to consider
# when choosing the direction of dependencies.
# 
#
# *** Recognizing Concretions and Abstractions:
# "abstraction" as disassociated from any specific instance
# 
# When Gear depended on Wheel and on Wheel.new(rim, tire), it depended on extremely concrete code.
# After the code was altered to inject a Wheel into Gear, Gearsuddenly began 
# to depend on something far more abstract, that is, the fact that it had access to an object 
# that could respond to the diameter message.
# 
#
# In Ruby, when you inject Wheel into Gear such that Gear then depends on "Duck"
# who responds to diameter, you are, however casually, defining an interface.
# This interface is an abstraction of the idea that a certain category of things will have a diameter. 
# The abstraction was harvested from a concrete class; the idea is now 
# "diasassociated from any specific instance"
# 
#
# Depending on an abstraction is always safer than depending on a concretion because by 
# its very nature, the abstraction is more stable. 
# 
#
# Depend on things that change less often than you do!