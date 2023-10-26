require_relative '../game'
# require_relative '../books'
require_relative '../author'
require 'json'

def game_options
  puts 'Please enter the number of the option to proceed'
  puts '1. List all games'
  puts '2. List all authors'
  puts '3. Add a game'
  puts '4. return'
  puts '5. exit'
  print '>>> :'
end

# def book_options
#   puts 'Please enter the number of the option to proceed'
#   puts '1. List all books'
#   puts '2. List all label'
#   puts '3. Add a book'
#   puts '4. return'
#   puts '5. exit'
#   print '>>> :'
# end

def manage_games
  puts
  game_options
  option = gets.chomp.to_i
  case option
  when 1
    list_all_games
    manage_games
  when 2
    list_all_authors
    manage_games
  when 3
    add_game
    manage_games
  when 4
    nil
  when 5
    save_exit
  else
    puts 'Invalid option, please enter the number (eg. "1")'
  end
end

# def manage_books
#   puts
#   book_options
#   option = gets.chomp.to_i
#   case option
#   when 1
#     list_books
#     manage_books
#   when 2
#     list_all_authors
#     manage_books
#   when 3
#     create_book
#     manage_books
#   when 4
#     nil
#   when 5
#     save_exit
#   else
#     puts 'Invalid option, please enter the number (eg. "1")'
#   end
# end

def add_game
  puts
  print 'Enter author first name: '
  first_name = gets.chomp
  print 'Enter author last name: '
  last_name = gets.chomp
  print 'Is the game multiplayer? (Yes/No): '
  multiplayer = gets.chomp
  print 'Enter last played date (DD/MM/YYYY): '
  last_played_at = gets.chomp
  print 'Enter date of publish (DD/MM/YYYY): '
  publish_date = gets.chomp

  game = Game.new(last_played_at, publish_date, multiplayer)
  @games << game
  author = Author.new(first_name, last_name)
  @authors << author
  puts "\nGame created successfully!"

  save_authors
  save_games
end

# def create_book
#   print 'Publisher: '
#   publisher = gets.chomp.to_s

#   print 'Cover state: '
#   cover_state = gets.chomp.to_s

#   print 'Publish date: '
#   publish_date = gets.chomp.to_s

#   print 'Label:'
#   label_name = gets.chomp.to_s
#   label = Label.new(label_name) if label.nil?
#   book = Book.new(publisher, cover_state, publish_date)
#   label.add_item(book)
#   @books << book
#   @labels <<label
#   puts "Book created successfully "

#   save_books
# end

def list_all_games
  puts
  return puts 'No games found!' if @games.empty?

  puts '------------------------------------------------------------'
  @games.each_with_index do |game, index|
    puts "#{index + 1}) Multiplayer: #{game.multiplayer},
    last played: #{game.last_played_at}, published: #{game.publish_date}"
  end
  puts '------------------------------------------------------------'
end

# def list_books
#   puts 'Book list is empty' if @books.empty?
#   puts '------------------------------------------------------------'
#   @books.each_with_index do |book, index|
#     puts "#{index + 1}) Authot Name: #{book.publisher},
#     Cover: #{book.cover_state}, published Date: #{book.publish_date}"
#   end
#   puts '------------------------------------------------------------'
# end

def list_all_authors
  puts
  return puts 'No authors found!' if @authors.empty?

  puts '------------------------------------------------------------'
  @authors.each_with_index do |author, index|
    puts "Author #{index + 1}: #{author.first_name} #{author.last_name}"
  end
  puts '------------------------------------------------------------'
end

def save_authors
  json = []
  @authors.each do |author|
    json << author.to_json
  end
  File.write('db/authors.json', JSON.pretty_generate(json))
end

def save_games
  json = []
  @games.each do |game|
    json << game.to_json
  end
  File.write('db/games.json', JSON.pretty_generate(json))
end

# def save_books
#   json = []
#   @books.each do |book|
#     json << book.to_json
#   end
#   File.write('db/books.json', JSON.pretty_generate(json))
# end

def load_authors
  return unless File.exist?('db/authors.json')
  return if File.empty?('db/authors.json')

  authors = JSON.parse(File.read('db/authors.json'))
  authors.each do |author|
    @authors << Author.new(author['first_name'], author['last_name'])
  end
end

def load_games
  return unless File.exist?('db/games.json')
  return if File.empty?('db/games.json')

  games = JSON.parse(File.read('db/games.json'))
  games.each do |game|
    @games << Game.new(game['last_played_at'], game['publish_date'], game['multiplayer'])
  end
end

# def load_books
#   return unless File.exist?('db/books.json')
#   return if File.empty?('db/books.json')

#   books = JSON.parse(File.read('db/books.json'))
#   books.each do |book|
#     @books << Book.new(book['publisher'], book['cover_state'], book['publish_date'])
#   end
# end

def load_game_data
  load_authors
  load_games
  # load_books
end