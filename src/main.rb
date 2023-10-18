require_relative 'app'

@app = LibraryApp.new

def display_menu
  puts 'Library Management System Menu:'
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List rentals for a person'
  puts '7. Quit'
end

def get_integer_input(prompt)
  print prompt
  gets.chomp.to_i
end

def get_string_input(prompt)
  print prompt
  gets.chomp
end

def create_person_menu
  type = get_string_input('Do you want to create a student (1) or a teacher (2)? [Input the number]: ')
  age = get_string_input('Age: ')
  name = get_string_input('Name: ')
  permission = false

  if type == '1' # student
    permission = get_string_input('Has parent permission? [Y/N]: ').upcase == 'Y'
  elsif type == '2' # teacher
    permission = true
    specialization = get_string_input('Specialization: ')
  else
    puts 'There is no type for this choice.'
  end

  @app.create_person(type, specialization, age, name, permission)
end

def create_book_menu
  title = get_string_input('Title: ')
  author = get_string_input('Author: ')
  @app.create_book(title, author)
end

loop do
  display_menu
  choice = get_integer_input('Enter your choice: ')
  case choice
  when 1
    @app.list_all_books
  when 2
    @app.list_all_people
  when 3
    create_person_menu
  when 4
    create_book_menu
  when 5
    @app.create_rental
  when 6
    @app.list_rentals_for_person
  when 7
    puts 'Exiting the application. Goodbye!'
    break
  end
end
