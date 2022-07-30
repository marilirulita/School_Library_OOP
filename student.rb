require './person'
require './classroom'

# child class inherits from person
class Student < Person
  attr_reader :classroom

  def initialize(age, name = 'Unknown', id = Random.rand(1..1000), parent_permission: true)
    super(age, name, id, parent_permission: parent_permission)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
