require_relative '../item'

class Movie < Item
  attr_accessor :silent

  def initialize(silent, publish_date)
    super(nil, nil, 'movie', nil, publish_date)
    @silent = silent
  end

  def can_be_archived?
    super || @silent == true
  end
end
