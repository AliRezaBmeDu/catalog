require_relative 'app'

def menu(app)
  app.options
  print '>>> :'
  gets.chomp.to_i
end

def manage_selection(app, option)
  tasks = {
    1 => :manage_books,
    2 => :manage_music,
    3 => :manage_games,
    4 => :save_exit,
    default: :invalid_option
  }

  selection = tasks[option] || tasks[:default]
  app.send(selection)
end

def main
  app = App.new
  app.load_data

  loop do
    manage_selection(app, menu(app))
    puts "\n"
  end
end

main
