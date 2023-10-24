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

  def can_be_archived?
    Time.now.year - Date.parse(@publish_date).year > 10
  end

  def move_to_archive
    @archived = can_be_archived?
  end
end