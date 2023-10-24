require_relative 'item'

class MusicAlbum < Item
    attr_accessor :on_spotify
    def initialize(archived, publish_date, on_spotify: true)
        super(archived, publish_date)
        @on_spotify = on_spotify
    end

    def can_be_archived?
        super && @on_spotify
    end

    def add_genre(genre)
        @genre = genre
    end
end