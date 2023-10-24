require_relative 'music_album'
require_relative 'item'

module Storage
    def store_album
        album_file = './datastorage/album.json'
        album_data = []
        albums.each do |album|
            album
        open(album_file, 'w') { |f| f.write JSON.generate(album_data) }
    end
    def store_all_data
    end
end