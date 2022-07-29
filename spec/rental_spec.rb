# frozen_string_literal: true

require 'spec_helper'

describe Rental do
  before(:all) do
    @book = Book.new 'Year Book', 'Year Author'
    @person = Person.new 16, 'Marc', parent_permission: false
    @date = '15-03-2020'
    @rental = Rental.new @date, @person, @book
  end

  it 'takes three parameters and returns a Rental object' do
    expect(@rental).to be_instance_of Rental
  end

  it 'returns book object from Rental object' do
    expect(@rental.book).to eq(@book)
  end

  it 'returns person object from Rental object' do
    expect(@rental.person).to eq(@person)
  end
end
