require 'json'
require_relative 'music_album'
require_relative 'item'
require_relative 'genre'

module Storage
  def store_albums(album_list)
    album_file = 'datastorage/album.json'
    album_data = []
    album_list.each do |album|
      album_json = {
        id: album.id,
        name: album.name,
        artist: album.artist,
        publish_date: album.publish_date,
        on_spotify: album.on_spotify,
        genre: [album.genre.id, album.genre.name]
      }
      album_data << album_json unless album_data.include?(album_json)
    end
    open(album_file, 'w') { |f| f.write JSON.generate(album_data) }
  end

  def store_genre(genre_list)
    genre_file = 'datastorage/genre.json'
    genre_data = []
    genre_list.each do |genre|
      genre_json = {
        id: genre.id,
        name: genre.name
      }
      genre_data << genre_json unless genre_data.include?(genre_json)
    end
    open(genre_file, 'w') { |f| f.write JSON.generate(genre_data) }
  end
end
