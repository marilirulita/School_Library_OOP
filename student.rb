require './person'
require './classroom'

# child class inherits from person
class Student < Person
  attr_reader :classroom

  def initialize(age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end

student1 = Student.new(25, 'monic', parent_permission: false)
p student1
math = Classroom.new("math")
p math
math.add_student(student1)
p math.students