require './person'
require './book'

class Rental
  attr_accessor :date, :book, :person

  def initialize(date, person, book)
    @date = date
    @person = person
    person.rentals << self
    @book = book
    book.rentals << self
  end
end

friend = Person.new(25, 'Mary')
book1 = Book.new('1810', 'O.W.')

book1.add_rental('25-05-2022', friend)
p book1.rentals.first
p book1.rentals.first.person.name

friend.add_rental('31-12-2020', book1)

p friend.rentals
p friend.rentals.first.book.tittle
p friend.rentals.length
