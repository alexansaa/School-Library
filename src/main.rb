require_relative 'app'

def main
  app = LibraryApp.new

  loop do
    puts "Library Management System Menu:"
    puts "1. List all books"
    puts "2. List all people"
    puts "3. Create a person"
    puts "4. Create a book"
    puts "5. Create a rental"
    puts "6. List rentals for a person"
    puts "7. Quit"

    print "Enter your choice: "
    choice = gets.chomp.to_i

    case choice
    when 1
      app.list_all_books
    when 2
      app.list_all_people
    when 3
      print "Enter person type (teacher or student): "
      type = gets.chomp
      print "Enter person name: "
      name = gets.chomp
      app.create_person(type, name)
    when 4
      print "Enter book title: "
      title = gets.chomp
      print "Enter book author: "
      author = gets.chomp
      app.create_book(title, author)
    when 5
      print "Enter book ID: "
      book_id = gets.chomp.to_i
      print "Enter person ID: "
      person_id = gets.chomp.to_i
      app.create_rental(book_id, person_id)
    when 6
      print "Enter person ID: "
      person_id = gets.chomp.to_i
      app.list_rentals_for_person(person_id)
    when 7
      puts "Exiting the application. Goodbye!"
      break
    else
      puts "Invalid choice. Please try again."
    end
  end
end

main
