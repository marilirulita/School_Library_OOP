# frozen_string_literal: true

require './person'
require './book'

# Create rental class
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
