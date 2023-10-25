require_relative 'item'
require_relative 'app_music'

TASKS = {
  1 => :task1,
  2 => :list_album,
  3 => :task3,
  4 => :task4,
  5 => :task5,
  6 => :task6,
  7 => :create_album,
  8 => :task8,
  9 => :exit,
  default: :invalid_option
}.freeze

def display_main_menu
  puts "\nMain Menu: "
  puts '1. Task 1'
  puts '2. List Albums'
  puts '3. Task 3'
  puts '4. Task 4'
  puts '5. Task 5'
  puts '6. Task 6'
  puts '7. Create Album'
  puts '8. Task 8'
  puts '9. Exit'
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
    puts "\n"
  end
  my_app.store_all_data
end

main
