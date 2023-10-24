require_relative 'item'
require_relative 'genre'

class MusicAlbum < Item
  attr_accessor :on_spotify, :name, :publish_date, :archived, :singer, :genre

  def initialize(name, singer, publish_date, archived: true, on_spotify: true)
    super(archived, publish_date)
    @on_spotify = on_spotify
    @name = name
    @singer = singer
    @genre = genre
  end

  def can_be_archived?
    super && @on_spotify
  end

end
