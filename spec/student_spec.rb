# frozen_string_literal: true

require 'spec_helper'

describe Student do
  before(:all) do
    @book = Book.new 'Student Book', 'Student Author'
    @student = Student.new 20, 'Jhon'
    @date = '13-09-2020'
    @classroom = Classroom.new('Math')
  end

  it 'takes two to four parameters and returns a Student object' do
    expect(@student).to be_instance_of Student
  end

  it 'returns name value from Student object that heritages from Person' do
    expect(@student.name).to eq('Jhon')
  end

  it 'returns value for use service from Student object that heritages from Person' do
    expect(@student.can_use_services?).to be true
  end

  it 'add_rental method takes two parameters and returns a Rental object' do
    expect(@student.add_rental(@date, @book)).to be_instance_of Rental
  end

  it 'returns rentals array from Student object that heritages from Person' do
    expect(@student.rentals).not_to be_nil
  end

  it 'classroom method takes one parameter and returns a Classroom object' do
    expect(@student.classroom = (@classroom)).to be_instance_of Classroom
  end
end
