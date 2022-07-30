# frozen_string_literal: true

require 'spec_helper'

describe Classroom do
  before(:all) do
    @classroom = Classroom.new 'Fisic'
    @student = Student.new 20, 'Jhon'
  end

  it 'takes one parameter and returns a Classroom object' do
    expect(@classroom).to be_instance_of Classroom
  end

  it 'returns label value from Classroom object' do
    expect(@classroom.label).to eq('Fisic')
  end

  it 'add_student method takes one Student object as a parameter' do
    expect(@classroom.add_student(@student)).not_to be_nil
  end
  it 'students return an array of Student objects' do
    expect(@classroom.students).not_to be_nil
  end
end
