class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person

    @book.add_rental_reg(self)
    @person.add_rental_reg(self)
  end

  def description
    return "Date: #{self.date}, Book \"#{self.book.title}\" by #{self.book.author}"
  end
end
