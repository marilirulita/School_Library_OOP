class Book
  attr_accessor :tittle, :author
  attr_reader :rentals

  def initialize(tittle, author)
    @tittle = tittle
    @author = author
    @rentals = []
  end
end