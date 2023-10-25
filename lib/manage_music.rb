require_relative '../item'
require_relative '../music_album'
require_relative '../genre'
require_relative '../storage'

def game_options
    puts 'Please enter the number of the option to proceed'
    puts '1. List all Music Albums'
    puts '2. List all Genres'
    puts '3. Create an album'
    puts '4. return'
    puts '5. exit'
    print '>>> :'
end

class App
include Storage
  def initialize
    @album_list = []
    @genre_list = []
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
    print 'Genre name: '
    genre_name = gets.chomp.capitalize
    genre = @genre_list.find { |genre| genre.name == genre_name }
    genre = Genre.new(genre_name) if genre == nil   #label = Label.new() if label = nil
    album = MusicAlbum.new(name, artist, publish_date, on_spotify: on_spotify)
    album.add_genre(genre)
    @album_list << album
    @genre_list << genre unless @genre_list.include?(genre)
  end

  def list_album
    puts 'List of albums:'
    @album_list.each do |album|
      print "\n#{album.name}, by #{album.artist}, published on #{album.publish_date}, genre: "
        album.genre.each do |element|
           print element.name 
        end
    end
  end

  def store_all_data
    store_album(@album_list)
  end
end

