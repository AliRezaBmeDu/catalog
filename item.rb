require 'date'

class Item
  attr_accessor :id, :archived, :publish_date, :genre, :author, :source, :label

  def initialize(publish_date, archived: false)
    @id = Random.rand(1..1000)
    @archived = archived
    @publish_date = publish_date
    @genre = nil
    @source = nil
    @label = nil
  end

  def add_label(book_label)
    @label = book_label
  end

  def can_be_archived?
    Time.now.year - Date.parse(@publish_date).year > 10
  end

  def move_to_archive
    @archived = can_be_archived?
  end
end
