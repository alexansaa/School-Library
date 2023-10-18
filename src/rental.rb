class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person

    @book.add_rentalReg(self)
    @person.add_rentalReg(self)
  end
end
