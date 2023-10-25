require_relative '../item'
require_relative '../music_album'
require_relative '../genre'

def music_options
  puts 'Please enter the number of the option to proceed'
  puts '1. List all Music Albums'
  puts '2. List all Genres'
  puts '3. Create an album'
  puts '4. return'
  puts '5. exit'
  print '>>> :'
end

def manage_music
  puts
  music_options
  option = gets.chomp.to_i
  case option
  when 1
    list_all_albums
    manage_music
  when 2
    list_all_genre
    manage_music
  when 3
    create_album
    manage_music
  when 4
    store_albums
    store_genre
    nil
  when 5
    store_albums
    store_genre
    save_exit
  else
    puts 'Invalid, please enter a valid option (eg. "1")'
  end
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
  genre = Genre.new(genre_name) if genre.nil?
  album = MusicAlbum.new(name, artist, publish_date, on_spotify: on_spotify)
  genre.add_item(album)
  @album_list << album
  @genre_list << genre unless @genre_list.include?(genre)
end

def list_all_albums
  puts "\n--------------"
  puts 'List of albums:'
  @album_list.each do |album|
    print "\n#{album.name}, by #{album.artist}, published on #{album.publish_date}, genre: #{album.genre.name}"
  end
  puts "\n---------------"
end

def list_all_genre
  puts "\n--------------"
  puts 'List of genre:'
  @genre_list.each do |genre|
    puts "\nGenre Name:#{genre.name}"
    puts 'Albums under this Genre:'
    genre.items.each_with_index do |item, index|
      puts "#{index + 1}. #{item.name}"
    end
  end
  puts "\n---------------"
end


def store_albums
  album_file = 'datastorage/album.json'
  album_data = []
  @album_list.each do |album|
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

def store_genre
  genre_file = 'datastorage/genre.json'
  genre_data = []
  @genre_list.each do |genre|
    genre_json = {
      id: genre.id,
      name: genre.name
    }
    genre_data << genre_json unless genre_data.include?(genre_json)
  end
  open(genre_file, 'w') { |f| f.write JSON.generate(genre_data) }
end

def load_music_data
  return unless File.exist?('datastorage/album.json')
  return if File.empty?('datastorage/album.json')

  albums = JSON.parse(File.read('datastorage/album.json'))
  genres = JSON.parse(File.read('datastorage/genre.json'))
  albums.each do |album|
    new_album = MusicAlbum.new(album['name'], album['artist'],
                               album['publish_date'], id: album['id'], on_spotify: album['on_spotify'])
    genre = @genre_list.find { |element| element.name == album['genre'][1] }
    genre_id = genres.find { |element| element['name'] == album['genre'][1] }
    genre = Genre.new(album['genre'][1], id: genre_id['id']) if genre.nil?
    genre.add_item(new_album)
    @album_list << new_album unless @album_list.include?(new_album)
    @genre_list << genre unless @genre_list.include?(genre)
  end
end
