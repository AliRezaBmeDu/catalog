require_relative 'item'
require_relative 'genre'

class MusicAlbum < Item
  attr_accessor :on_spotify, :name, :publish_date, :archived, :artist, :genre

  def initialize(name, artist, publish_date, archived: false, on_spotify: true)
    super(archived, publish_date)
    @on_spotify = on_spotify
    @name = name
    @artist = artist
    @genre = genre
  end

  def can_be_archived?
    super && @on_spotify
  end

end
