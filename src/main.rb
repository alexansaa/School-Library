require_relative 'app'

def main
  app = LibraryApp.new

  loop do
    puts 'Library Management System Menu:'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List rentals for a person'
    puts '7. Quit'

    print 'Enter your choice: '
    choice = gets.chomp.to_i

    case choice
    when 1
      app.list_all_books
    when 2
      app.list_all_people
    when 3
      print 'Do you want to create a student (1) or a techer (2)? [Input the number]: '
      type = gets.chomp

      print 'Age: '
      age = gets.chomp

      print 'Name: '
      name = gets.chomp

      permission = false

      if type == '1'# student
        print 'Has parent permission? [Y/N]: '
        permission = gets.chomp
        permission = permission.upcase
        if permission == 'Y'
          permission = true
        elsif permission == 'N'
          permission = false
        end
      elsif type == '2'# teacher
        permission = true

        print 'Specialization: '
        specialization = gets.chomp
      else
        puts 'there is not a type for this choise'
      end
      app.create_person(type, specialization, age, name, permission)
    when 4
      print 'Title: '
      title = gets.chomp
      print 'Author: '
      author = gets.chomp
      app.create_book(title, author)
    when 5
      app.create_rental
    when 6
      app.list_rentals_for_person
    when 7
      puts 'Exiting the application. Goodbye!'
      break
    else
      puts 'Invalid choice. Please try again.'
    end
  end
end

main
