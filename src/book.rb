class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental_reg(rental)
    @rentals << rental
  end

  def description
    return "Title: #{self.title}, Author: #{self.author}"
  end
end
