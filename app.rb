require './student'
require './teacher'

def list_all_books

end

def list_all_people

end

def create_a_person
  print "Do you want to create a student (1) or a teacher (2)? [input the number]: "
  selected = gets.chomp
  selected = selected.to_i
  print 'Age: '
  age = gets.chomp
  age = age.to_i
  print 'Name: '
  name = gets.chomp

  print 'Has parent permission? [Y/N]: ' if selected == 1
  permission = gets.chomp if selected == 1
  permission = true if permission == 'y' || permission == 'Y'
  permission = false if permission == 'n' || permission == 'N'

  print 'Specialization: ' if selected == 2
  speciality = gets.chomp if selected == 2

  person = Student.new(age, name, parent_permission: permission) if selected == 1
  person = Teacher.new(age, speciality, name) if selected == 2

  puts 'Person created succesfully!'
  puts ''
  main()
end

def create_a_book
  puts 'You create a book'
end

def create_a_rental

end

def list_all_rental_by_id

end