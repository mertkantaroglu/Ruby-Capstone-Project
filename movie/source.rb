require_relative '../item'

class Source < Item
  attr_reader :id
  attr_accessor :name, :items

  def initialize(name = '')
    @id = Random.rand(1..100)
    @name = name
    @items = []
    super()
  end

  def add_source(item)
    @items.push(item)
    item.source = self
  end
end
