# frozen_string_literal: true

require 'spec_helper'

describe Person do
  before(:all) do
    @book = Book.new 'Year Book', 'Year Author'
    @person = Person.new 16, 'Marc', parent_permission: false
    @date = '22-10-2020'
  end

  it 'takes two to four parameters and returns a Person object' do
    expect(@person).to be_instance_of Person
  end

  it 'returns name value from Person object' do
    expect(@person.name).to eq('Marc')
  end

  it 'takes one parameter for age setter and update age' do
    expect(@person.age = 19).to eq(19)
  end

  it 'returns updated value for use service from Person object' do
    expect(@person.can_use_services?).to be true
  end

  it 'add_rental method takes two parameters and returns a Rental object' do
    expect(@person.add_rental(@date, @book)).to be_instance_of Rental
  end

  it 'returns rentals array from Person object' do
    expect(@person.rentals).not_to be_nil
  end
end
