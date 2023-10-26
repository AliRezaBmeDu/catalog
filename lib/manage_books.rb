require_relative '../books'
require 'json'

def book_options
  puts 'Please enter the number of the option to proceed'
  puts '1. List all books'
  puts '2. List all label'
  puts '3. Add a book'
  puts '4. return'
  puts '5. exit'
  print '>>> :'
end

def manage_books
  puts
  book_options
  option = gets.chomp.to_i
  case option
  when 1
    list_books
    manage_books
  when 2
    list_label
    manage_books
  when 3
    create_book
    manage_books
  when 4
    nil
  when 5
    save_exit
  else
    puts 'Invalid option, please enter the number (eg. "1")'
  end
end

def create_book
  print 'Publisher: '
  publisher = gets.chomp.to_s

  print 'Cover state: '
  cover_state = gets.chomp.to_s

  print 'Publish date: '
  publish_date = gets.chomp.to_s

  print 'Label Title: '
  label_title = gets.chomp.to_s

  print 'Label Color: '
  label_color = gets.chomp.to_s

  label = @labels.find { |l| l.title == label_title }
  label = Label.new(label_title, label_color) if label.nil?

  book = Book.new(publisher, cover_state, publish_date)
  label.add_item(book)
  @books << book
  @labels << label
  puts 'Book created successfully '

  save_books
  save_label
end

def list_books
  puts 'Book list is empty' if @books.empty?
  puts '------------------------------------------------------------'
  @books.each_with_index do |book, index|
    puts "#{index + 1}) Authot Name: #{book.publisher},
      Cover: #{book.cover_state}, published Date: #{book.publish_date}"
  end
  puts '------------------------------------------------------------'
end

def list_label
  puts
  return puts 'No Label found!' if @labels.empty?

  puts '------------------------------------------------------------'
  @labels.each_with_index do |label, _index|
    puts " Title: '#{label.title}', Color: '#{label.color}'}"
  end
  puts '------------------------------------------------------------'
end

def save_books
  json = []
  @books.each do |book|
    json << book.to_json
  end
  File.write('db/books.json', JSON.pretty_generate(json))
end

def save_label
  json = []
  @labels.each do |label|
    json << label.to_json
  end
  File.write('db/labels.json', JSON.pretty_generate(json))
end

def load_books
  return unless File.exist?('db/books.json')
  return if File.empty?('db/books.json')

  books = JSON.parse(File.read('db/books.json'))
  books.each do |book|
    @books << Book.new(book['publisher'], book['cover_state'], book['publish_date'])
  end
end

def load_labels
  return unless File.exist?('db/labels.json')
  return if File.empty?('db/labels.json')

  labels = JSON.parse(File.read('db/labels.json'))
  labels.each do |label|
    @labels << Label.new(label['title'], label['color'])
  end
end

def load_book_data
  load_books
  load_labels
end
