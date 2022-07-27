require 'json'
require './student'
require './teacher'
require './book'
require './rental'
require './manage_data'

@books = []
@students = []
@teachers = []
@rentals = []

def list_all_books
  @books = recover_data(@books, 'books')
  @books = [] if @books == nil
  @books.each do |v|
    puts "Title: \"#{v.tittle}\", Author: #{v.author}"
  end

  main
end

def list_all_people
  students = recover_data(@students, 'student')
  teachers = recover_data(@teachers, 'teacher')

  people = [*students, *teachers]
  
  people.each do |v|
    puts "[#{v.class.name}] Name: #{v.name}, ID: #{v.id}, Age: #{v.age}"
  end

  main
end

def create_a_person
  print 'Do you want to create a student (1) or a teacher (2)? [input the number]: '
  selected = gets.chomp
  print 'Age: '
  age = gets.chomp
  print 'Name: '
  name = gets.chomp

  create_student(age, name) if selected.to_i == 1
  create_teacher(age, name) if selected.to_i == 2

  puts 'Person created succesfully!'
  main
end

def create_student(age, name)
  print 'Has parent permission? [Y/N]: '
  permission = gets.chomp
  permission = true if %w[y Y].include?(permission)
  permission = false if %w[n N].include?(permission)

  @students.push(Student.new(age.to_i, name, parent_permission: permission))

  save_data(@students, 'student')
end

def create_teacher(age, name)
  print 'Specialization: '
  speciality = gets.chomp

  @teachers.push(Teacher.new(age.to_i, speciality, name))

  save_data(@teachers, 'teacher')
end

def create_a_book
  print 'Title: '
  title = gets.chomp
  print 'Author: '
  author = gets.chomp

  @books.push(Book.new(title, author))
  save_data(@books, 'books')

  puts 'Book created succesfully!'

  main
end

def create_a_rental
  select_book
  selected_book = gets.chomp

  select_person
  selected_person = gets.chomp

  print 'Date: '
  date = gets.chomp

  Rental.new(date, @people[selected_person.to_i], @books[selected_book.to_i])
  puts 'Rental created succesfully!'

  main
end

def select_book
  puts 'Selecte a book from the following list by number'
  @books.each_with_index do |v, i|
    puts "#{i}) Title: \"#{v.tittle}\", Author: #{v.author}"
  end
end

def select_person
  puts 'Select a person from the followin list by number (not id)'
  @people.each_with_index do |v, i|
    puts "#{i}) [#{v.class.name}] Name: #{v.name}, ID: #{v.id}, Age: #{v.age}"
  end
end

def list_all_rental_by_id
  print 'ID of person: '
  id = gets.chomp

  puts 'Rentals: '

  @people.map do |v|
    next unless v.id == id.to_i

    v.rentals.each do |n|
      puts "Date: #{n.date}, Book \"#{n.book.tittle}\" by #{n.book.author}"
    end
  end

  main
end

def exit
  puts 'Thank you for using this app!'
  
  #save_data(@rentals, 'rentals')
end

def save_data(data, file)
  json = JSON.generate(data)

  # create file
  #first ask if the file exists?
  if File.exists?("#{file}.json") == false
    File.write("#{file}.json", json)
  elsif File.exists?("#{file}.json") == true
    json = File.read("#{file}.json")
    ruby = JSON.parse(json, create_additions: true)
    new_data = JSON.generate([*ruby, *data])
    File.write("#{file}.json", new_data)
  end
end

def recover_data(data, file)
  if File.exists?("#{file}.json") == true
    json = File.read("#{file}.json")
    data = JSON.parse(json, create_additions: true)
  end
end
