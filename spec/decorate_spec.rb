require 'spec_helper'

describe Decorator do
    before(:all) do
      @person = Person.new 17, "dany", parent_permission: false
      @person2 = Person.new 25, "george maximilian"
      @decorator = Decorator.new(@person)
      @capitalize_decorator = CapitalizeDecorator.new(@person)
      @trimmer_decorator = TrimmerDecorator.new(@person)
      @trimmer_decorator2 = TrimmerDecorator.new(@person2)
    end 
  
    it "takes one person object as a parameter and returns a Decorator object" do
      expect(@decorator).to be_instance_of Decorator
    end
  
    it "correct_name method returns name value from Person object" do
      expect(@decorator.correct_name).to eq("dany")
    end
  
    it "correct_name method returns name value capitalized from Person object" do
      expect(@capitalize_decorator.correct_name).to eq("Dany")
    end
  
    it "correct_name method returns name lenght from Person object" do
      expect(@trimmer_decorator.correct_name.length).to be <= 10
    end
  
    it "correct_name method returns name length value to be less than 10 from Person object" do
        expect(@trimmer_decorator2.correct_name.length).to be <= 10
    end
  
  end
  
  