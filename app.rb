require_relative 'item'
require_relative 'music_album'

class App
  def initialize
    @albums = []
  end

  def create_album
    print 'Album title: '
    name = gets.chomp.upcase
    print 'Artist Name: '
    artist = gets.chomp.capitalize
    print 'Publish Year: '
    year = gets.chomp
    month = Random.rand(1..12).to_s
    day = Random.rand(1..28).to_s
    publish_date = "#{year}-#{month}-#{day}"
    print 'On Spotify [Y/N]? '
    spotify = gets.chomp.upcase
    on_spotify = (spotify == 'Y')
    album = MusicAlbum.new(name, artist, publish_date, on_spotify: on_spotify)
    @albums << album
  end

  def list_album
    puts 'List of albums:'
    @albums.each do |album|
      puts "#{album.name}, by #{album.artist}, published on #{album.publish_date}, isarchived? #{album.archived}  canarchived? #{album.can_be_archived?}"
    end
  end
end

