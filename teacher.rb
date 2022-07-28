# frozen_string_literal: true

require './person'

# child class inherit from person
class Teacher < Person
  def initialize(age, specialization, name = 'Unknown', id = Random.rand(1..1000), parent_permission: true)
    super(age, name, id, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
