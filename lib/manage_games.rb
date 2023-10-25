require_relative '../game'
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

def load_game_data
  load_authors
  load_games
end
