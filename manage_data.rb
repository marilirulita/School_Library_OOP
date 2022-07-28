# frozen_string_literal: true

require 'json'

# Helper to store book data in json file
class Book
  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'a' => [tittle, author]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['a'])
  end
end

# Helper to store classroom data in json file
class Classroom
  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'a' => [label]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['a'])
  end
end

# Helper to store person data in json file
class Person
  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'age' => age,
      'name' => name,
      'id' => id,
      'parent_permission' => @parent_permission
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['name'], object['age'], object['id'], parent_permission: object['parent_permission'])
  end
end

# Helper to store student data in json file
class Student < Person
  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'age' => age,
      'name' => name,
      'id' => id,
      'parent_permission' => @parent_permission
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['age'], object['name'], object['id'], parent_permission: object['parent_permission'])
  end
end

# Helper to store teacher data in json file
class Teacher < Person
  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'a' => [age, @specialization, name, id]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['a'])
  end
end

# Helper to store rental data in json file
class Rental
  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'date' => date,
      'person' => person,
      'book' => book
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['date'], object['person'], object['book'])
  end
end
