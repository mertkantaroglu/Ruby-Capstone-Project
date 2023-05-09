class Genre
  attr_accessor :name, :items

  def initialize(name, _item)
    @id = Random.rand(1..1000)
    @name = name
    @item = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end
