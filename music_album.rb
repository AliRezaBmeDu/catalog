require_relative 'item'
require_relative 'genre'

class MusicAlbum < Item
  attr_accessor :on_spotify, :name, :publish_date, :archived, :artist, :genre

  def initialize(name, artist, publish_date, id: nil, on_spotify: true)
    super(publish_date)
    @id = id || Random.rand(1..1000)
    @on_spotify = on_spotify
    @name = name
    @artist = artist
    @genre = genre
  end

  def can_be_archived?
    super && @on_spotify
  end
end
