require_relative 'item'
require_relative 'app'

TASKS = {
  1 => :create_album,
  2 => :list_album,
  3 => :task3,
  4 => :task4,
  5 => :task5,
  6 => :task6,
  7 => :task7,
  8 => :task8,
  9 => :exit,
  default: :invalid_option
}.freeze

def display_main_menu
  puts "\nMain Menu: "
  puts '1. Create Album'
  puts '2. List Albums'
  puts '3. Task 3'
  puts '4. Task 4'
  puts '5. Task 5'
  puts '6. Task 6'
  puts '7. Exit'
end

def main
  puts "\n\nWelcome to the 'Catalog' app. Please make your choice and press Enter"
  my_app = App.new
  loop do
    display_main_menu
    print 'input: '
    option = gets.chomp.to_i
    if option == 9
      puts 'Exiting... Thank you for using the application'
      break
    end
    selection = TASKS[option] || TASKS[:default]
    my_app.send(selection)
    puts 'Still to be implemented'
    puts "\n"
  end
end

main
