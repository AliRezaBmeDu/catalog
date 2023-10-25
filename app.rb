require_relative 'lib/manage_games'

class App
  attr_accessor :games, :music, :genres

  def initialize
    @books = []
    @album_list = []
    @games = []
    @labels = []
    @authors = []
    @genres = []
  end

  def load_data
    puts 'Loading data here..'
    load_game_data
  end

  def save_exit
    puts 'Goodbye'

    # save_books

    # save_music

    # save_games

    exit
  end

  def invalid_option
    puts 'Invalid option'
  end

  def options
    puts 'Please enter the number for the task you want to perform'
    puts 'choose one of the following'
    puts '1 - Manage books.'
    puts '2 - Manage Music.'
    puts '3 - Manage Games.'
    puts '4 - Exit'
  end
end
