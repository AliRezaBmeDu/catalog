require_relative 'item'

class MusicAlbum < Item
    attr_accessor :on_spotify, :name, :publish_date, :archived
    def initialize(name, archived, publish_date, on_spotify: true)
        super(archived, publish_date)
        @on_spotify = on_spotify
        @name = name
    end

    def can_be_archived?
        super && @on_spotify
    end

    def add_genre(genre)
        @genre = genre
    end
end