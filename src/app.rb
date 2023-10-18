require 'securerandom'
require_relative 'students'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class LibraryApp
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_all_books
    if @books.length > 0
      @books.each_with_index do |book, idx|
        puts "#{idx}) #{book.description}"
      end
    end
  end

  def list_all_people
    if @people.length > 0
      @people.each_with_index do |some, idx|
        puts "#{idx}) #{some.description}"
      end
    end
  end

  def create_person(type, specialization, age, name, permission)
    if type == '1'      # student
      newPerson = Student.new(SecureRandom.uuid, nil, name, age, parent_permission: permission)
    elsif type == '2'   # teacher
      newPerson = Teacher.new(SecureRandom.uuid, specialization, name, age)
    else
      puts 'Error in person creation'
    end
    puts newPerson.name
    @people << newPerson

    puts 'Person created successfully'
  end

  def create_book(title, author)
    newBook = Book.new(title, author)
    @books << newBook

    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    list_all_books
    input = gets.chomp
    slctBook = @books[input.to_i]

    puts 'Select a person from the following list by number (not id)'
    list_all_people
    input = gets.chomp
    slctPeople = @people[input.to_i]

    puts 'Date: '
    date = gets.chomp

    tmpRental = Rental.new(date, slctBook, slctPeople)

    @rentals << tmpRental

    puts 'Rental created successfully'

  end

  def list_rentals_for_person
    puts 'ID of person: '
    idPerson = gets.chomp
    puts 'Rentals: '

    @rentals.each do |rent|
      if rent.person.id == idPerson
        puts rent.description
      end
    end
  end
end
  