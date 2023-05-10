require_relative '../item'

class Author
  attr_accessor :first_name, :last_name, :items
  attr_reader :id

  def initialize(_id, first_name, last_name)
    @id = Random.rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
    super()
  end

  def add_author(item)
    @items.push(item)
    item.author = self
  end
end
