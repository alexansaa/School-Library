class Rental
  attr_accessor :date, :person
  attr_read: :book

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person

    @book.add_rental_reg(self)
    @person.add_rental_reg(self)
  end

  def description
    "Date: #{date}, Book \"#{book.title}\" by #{book.author}"
  end
end
