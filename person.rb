require './decorate'

# parent class Person.new(age, name, parent_permision)
class Person < Nameable
  attr_reader :id, :rentals
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
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

# person = Person.new(22, 'maximilianus')
# p person.correct_name
# capitalized_person = CapitalizeDecorator.new(person)
# p capitalized_person.correct_name
# capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
# p capitalized_trimmed_person.correct_name
