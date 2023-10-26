require_relative 'item'
require_relative 'label'

class Book < Item
  attr_accessor :publisher, :cover_state, :label

  def initialize(publisher, cover_state, publish_date)
    super(publish_date, archived: false)
    @publisher = publisher
    @cover_state = cover_state
    @label = label
  end

  def can_be_archived?
    super || cover_state.downcase == 'bad'
  end

  def to_json(*_args)
    {
      id: Random.rand(1..100),
      publisher: @publisher,
      cover_state: @cover_state,
      publish_date: @publish_date
    }
  end
end
