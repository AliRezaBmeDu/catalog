require_relative 'item'
require_relative 'music_album'

class App
  def initialize
    @albums = []
  end

  def create_album
    print 'Name? '
    name = gets.chomp.upcase
    print 'Is it archived? [Y/N]  '
    is_archived = gets.chomp.upcase
    archived = (is_archived == 'Y')
    print 'Publish Year: '
    year = gets.chomp
    publish_date = "#{year}-10-12"
    print 'On Spotify [Y/N]? '
    spotify = gets.chomp.upcase
    on_spotify = (spotify == 'Y')
    album = MusicAlbum.new(name, archived, publish_date, on_spotify: on_spotify)
    @albums << album
  end

  def list_album
    puts 'List of albums:'
    @albums.each do |album|
      puts "#{album.name}, published on #{album.publish_date}"
    end
  end
end
