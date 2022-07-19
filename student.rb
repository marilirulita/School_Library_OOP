# frozen_string_literal: true

require './person'

# child class inherits from person
class Student < Person
  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

student1 = Student.new(25, 'math', 'monic', parent_permission: false)
p student1
