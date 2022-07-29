require 'spec_helper'

describe Teacher do
  before(:all) do 
    @book = Book.new "Teacher Book", "Teacher Author"
    @teacher = Teacher.new 30, "Philosophy", "Monic"
    @date = '06-04-2020'
  end 

  it "takes two to four parameters and returns a Teacher object" do
    expect(@teacher).to be_instance_of Teacher
  end

  it "returns name value from Teacher object that heritages from Person" do
    expect(@teacher.name).to eq("Monic")
  end

  it "returns age value from Teacher object that heritages from Person" do
    expect(@teacher.age).to eq(30)
  end

  it "add_rental method takes two parameters and returns a Rental object" do
    expect(@teacher.add_rental(@date, @book)).to be_instance_of Rental
  end

  it "returns rentals array from Teacher object that heritages from Person" do
    expect(@teacher.rentals).not_to be_nil
  end
end