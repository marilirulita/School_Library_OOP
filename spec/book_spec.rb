# frozen_string_literal: true

require 'spec_helper'

describe Book do
  before(:all) do
    @book = Book.new 'New Book', 'New Author'
    @person = Person.new 25, 'Maria'
    @date = '12-12-2020'
  end

  it 'takes two parameters and returns a Book object' do
    expect(@book).to be_instance_of Book
  end

  it 'returns title value from Book object' do
    expect(@book.tittle).to eq('New Book')
  end

  it 'returns author value from Book object' do
    expect(@book.author).to eq('New Author')
  end

  it 'add_rental method takes two parameters and returns a Rental object' do
    expect(@book.add_rental(@date, @person)).to be_instance_of Rental
  end

  it 'returns rentals array from Book object' do
    expect(@book.rentals).not_to be_nil
  end
end
