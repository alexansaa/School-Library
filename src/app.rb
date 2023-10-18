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
          puts '#{idx} #{book.title} #{book.author}'
        end
    end
  
    def list_all_people
      if @people.length > 0
        @people.each_with_index do |people, idx|
          puts '#{idx} #{people.id} #{people.name} #{people.age}'
    end
  
    def create_person(type, specialization, age, name, permission)
      if type == 1      # student
        newPerson = Student.new(id: SecureRandom.uuid, name: name, age: age, parent_permission: permission)
      elsif type == 2   # teacher
        newPerson = Teacher.new(id: SecureRandom.uuid, specialization: specialization, name: name, age: age)
      end

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
      slctBook = gets.chomp

      puts 'Select a person from the following list by number (not id)'
      list_all_people
      slctPeople = gets.chomp

      puts 'Date: '
      date = gets.chomp

      tmpRental = Rental.new(date, slctBook, slctPeople)

      @rental << tmpRental

    end
  
    def list_rentals_for_person
      puts 'ID of person: '
      idPerson = gets.chomp
      puts 'Rentals: '

      @rental.each do |rent|
        if rent.person.id = idPerson
          puts '#{rent.date} #{rent.book.title} #{rent.book.author}'
    end
  end
  