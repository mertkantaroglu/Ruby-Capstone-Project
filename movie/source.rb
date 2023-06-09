require_relative '../item'

class Source
  attr_reader :id
  attr_accessor :name, :items

  def initialize(name = '')
    @id = Random.rand(1..100)
    @name = name
    @items = []
  end

  def add_source(item)
    @items.push(item)
    item.source = self
  end
end
