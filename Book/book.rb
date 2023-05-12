require_relative '../item'
class Book < Item
  attr_accessor :id, :name, :publish_date, :publisher, :cover_state
  def initialize(name, publish_date, publisher, cover_state)
    super(nil, nil, nil, nil, publish_date)
    @id = id || Random.rand(1..1000)
    @name = name
    @publisher = publisher
    @cover_state = cover_state
  end
  def can_be_archived?
    super || @cover_state == 'bad'
  end
  private :can_be_archived?
end 