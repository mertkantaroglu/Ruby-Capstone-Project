require_relative '../item'

class Movie < Item
  attr_accessor :silent

  def initialize(silent)
    @silent = silent
    super()
  end

  def can_be_archived?
    super || @silent == true
  end
end
