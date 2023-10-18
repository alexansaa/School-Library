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
    return if @books.empty?
    
    @books.each_with_index do |book, idx|
      puts "#{idx}) #{book.description}"
    end
  end

  def list_all_people
    return if @people.empty?

    @people.each_with_index do |some, idx|
      puts "#{idx}) #{some.description}"
    end
  end

  def create_person(type, specialization, age, name, permission)
    if type == '1' # student
      new_person = Student.new(SecureRandom.uuid, nil, name, age, parent_permission: permission)
    elsif type == '2' # teacher
      new_person = Teacher.new(SecureRandom.uuid, specialization, name, age)
    else
      puts 'Error in person creation'
    end
    puts new_person.name
    @people << new_person

    puts 'Person created successfully'
  end

  def create_book(title, author)
    new_book = Book.new(title, author)
    @books << new_book

    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    list_all_books
    input = gets.chomp
    slct_book = @books[input.to_i]

    puts 'Select a person from the following list by number (not id)'
    list_all_people
    input = gets.chomp
    slct_people = @people[input.to_i]

    puts 'Date: '
    date = gets.chomp

    tmp_rental = Rental.new(date, slct_book, slct_people)

    @rentals << tmp_rental

    puts 'Rental created successfully'
  end

  def list_rentals_for_person
    puts 'ID of person: '
    id_person = gets.chomp
    puts 'Rentals: '

    @rentals.each do |rent|
      puts rent.description if rent.person.id == id_person
    end
  end
end
