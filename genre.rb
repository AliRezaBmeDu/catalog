class Genre
  attr_accessor :id, :name, :items

  def initialize(name, id: nil)
    @id = id
    @id = Random.rand(1..1000) if id.nil?
    @name = name
    @items = []
  end

  def add_item(item)
    item.add_genre(self)
    @items << item
  end
end
