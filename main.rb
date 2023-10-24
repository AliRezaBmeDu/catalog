# frozen_string_literal: true

TASKS = {
  1 => :task1,
  2 => :task2,
  3 => :task3,
  4 => :task4,
  5 => :task5,
  6 => :task6,
  default: :invalid_option
}.freeze

def display_main_menu
  puts "\nMain Menu: "
  puts '1. Task 1'
  puts '2. Task 2'
  puts '3. Task 3'
  puts '4. Task 4'
  puts '5. Task 5'
  puts '6. Task 6'
  puts '7. Exit'
end
