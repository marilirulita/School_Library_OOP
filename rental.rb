require './person'
require './book'

class Rental
  attr_reader :person, :book
  attr_accessor :date

  def initialize(date, person, book)
    @date = date
    @person = person
    person.rentals << self
    @book = book
    book.rentals << self
  end
end

friend = Person.new(25, 'Mary')
p friend
book1 = Book.new('1810', 'O.W.')
p book1
rental1 = Rental.new('25-05-2022', friend, book1)
p rental1
p friend.rentals.first.book.tittle
