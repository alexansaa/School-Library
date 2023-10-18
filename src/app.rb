class LibraryApp
    def initialize
      @books = []
      @people = []
      @rentals = []
    end
  
    def list_all_books
      # Implement logic to list all books
      puts "listing all books"
    end
  
    def list_all_people
      # Implement logic to list all people
      puts "listing all people"
    end
  
    def create_person(type, name)
      # Implement logic to create a person (teacher or student)
      puts "creating person"
    end
  
    def create_book(title, author)
      # Implement logic to create a book
      puts "creating book"
    end
  
    def create_rental(book_id, person_id)
      # Implement logic to create a rental
      puts "creating rental"
    end
  
    def list_rentals_for_person(person_id)
      # Implement logic to list rentals for a given person
      puts "listing rentals for a person"
    end
  end
  