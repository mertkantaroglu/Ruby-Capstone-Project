require_relative '../item'

class Movie < Item
  attr_accessor :id, :name, :silent, :publish_date

  def initialize(name, publish_date, silent)
    super(nil, nil, nil, nil, publish_date)
    @name = name
    @silent = silent
    @id = id
  end

  def can_be_archived?
    super || @silent == true
  end
end
