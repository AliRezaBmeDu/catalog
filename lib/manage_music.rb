require_relative '../item'
require_relative '../music_album'
require_relative '../genre'
require_relative '../storage'

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
  when 2
    list_all_genre
  when 3
    create_album
  when 4, 5
    store_albums(@album_list)
    store_genre(@genre_list)
    save_exit if option == 5
  else
    puts 'Invalid, please enter a valid option (eg. "1")'
  end
  manage_music unless option == 4
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
  genre = @genre_list.find { |element| element.name == genre_name }
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
  #   puts "Genre List: #{@genre_list}"
  @genre_list.each do |genre|
    puts "\nGenre Name:#{genre.name}"
    puts 'Albums under this Genre:'
    genre.items.each_with_index do |item, index|
      puts "#{index + 1}. #{item.name} by #{item.artist}. Released on #{item.publish_date}"
    end
  end
  puts "\n---------------"
end

def load_music_data
  return unless File.exist?('db/album.json')
  return if File.empty?('db/album.json')

  albums = JSON.parse(File.read('db/album.json'))
  albums.each do |album|
    load_album(album)
  end
end

def load_album(album_data)
  new_album = MusicAlbum.new(album_data['name'], album_data['artist'],
                             album_data['publish_date'], id: album_data['id'], on_spotify: album_data['on_spotify'])
  genre = load_or_create_genre(album_data['genre'])
  genre.add_item(new_album)
  @album_list << new_album unless @album_list.include?(new_album)
  @genre_list << genre unless @genre_list.include?(genre)
end

def load_or_create_genre(genre_data)
  genre = @genre_list.find { |element| element.name == genre_data[1] }
  genre = Genre.new(genre_data[1], id: genre_data[0]) if genre.nil?
  genre
end
