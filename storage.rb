require 'json'
require_relative 'music_album'
require_relative 'item'

module Storage
    def store_album(albums)
        album_file = './datastorage/album.json'
        album_data = []
        albums.each do |album|
            album_json = {
                id: album.id,
                name: album.name,
                artist: album.artist,
                publish_date: album.publish_date,
                genre: album.genre,
            }
            album_data << album_json
        end
        open(album_file, 'w') { |f| f.write JSON.generate(album_data) }
    end
end
