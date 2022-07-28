require 'json'

class Book
  def to_json(*args)
    {
      JSON.create_id  => self.class.name,
      'a'             => [ tittle, author]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['a'])
  end
end

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

class Person 
  def to_json(*args)
    {
    JSON.create_id => self.class.name,
    'age' => age,
    'name' => name,
    'id' => id,
    'parent_permission' => @parent_permission,
    }.to_json(*args)
  end

  def self.json_create(h)
    new(h['name'], h['age'], h['id'], parent_permission: h['parent_permission'])
  end
end

class Student < Person
  def to_json(*args)
    {
    JSON.create_id  => self.class.name,
    'age' => age,
    'name' => name,
    'id' => id,
    'parent_permission' => @parent_permission,
    }.to_json(*args)
  end

  def self.json_create(h)
    new(h['age'], h['name'], h['id'], parent_permission: h['parent_permission'])
  end
end

class Teacher < Person
  def to_json(*args)
    {
      JSON.create_id  => self.class.name,
      'a'             => [ age, @specialization, name, id ]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['a'])
  end
end

class Rental
  def to_json(*args)
    {
      JSON.create_id  => self.class.name,
      'date' => date,
      'person' => person,
      'book' => book,
    }.to_json(*args)
  end

  def self.json_create(h)
    new(h['date'], h['person'], h['book'])
  end
end
