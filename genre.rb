class Genre
  attr_accessor :id, :name, :items

  def initialize(_id, name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    item.add_genre(self)
    @items << item
  end
end
