# Class Item
class Item
  attr_accessor :id, :archived, :publish_date, :genre, :author, :source, :label

  def initialize(archived, publish_date)
    @id = generate_id
    @archived = archived
    @publish_date = publish_date
    @genre = nil
    @author = nil
    @source = nil
    @label = nil
  end
end
