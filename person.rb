require './decorate'

# parent class Person.new(age, name, parent_permision)
class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    if of_age? || @parent_permission
      true
    else
      false
    end
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end

# person1 = Person.new(10, 'maria', parent_permission: false)
# p person1.can_use_services?


person = Person.new(22, 'maximilianus')
p person.correct_name
capitalizedPerson = CapitalizeDecorator.new(person)
p capitalizedPerson.correct_name
capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
p capitalizedTrimmedPerson.correct_name