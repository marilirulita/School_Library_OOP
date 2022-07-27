require 'json'
require './book'
require './teacher'
require './person'
require './student'

class Book
  # Serialize Foo object with its class name and arguments
  def to_json(*args)
    {
      JSON.create_id  => self.class.name,
      'a'             => [ tittle, author]
    }.to_json(*args)
  end
  # Deserialize JSON string by constructing new Foo object with arguments.
  def self.json_create(object)
    new(*object['a'])
  end
end

class Person 
  # Serialize Foo object with its class name and arguments
  def to_json(*args)
    {
    JSON.create_id => self.class.name,
    'name' => name,
    'age' => age,
    'parent_permission' => @parent_permission,
    }.to_json(*args)
  end
  # Deserialize JSON string by constructing new Foo object with arguments.
  def self.json_create(h)
    new(h['name'], h['age'], parent_permission: h['parent_permission'])
  end
end

class Student < Person
  # Serialize Foo object with its class name and arguments
  def to_json(*args)
    {
    JSON.create_id  => self.class.name,
  } 
end
end