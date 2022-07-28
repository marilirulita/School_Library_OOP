require 'json'
require './student'
require './teacher'
require './book'
require './rental'
require './manage_data'

def get_data
  @books = [] if @books == nil
  @rentals = [] if @rentals == nil
  @people = [] if @people == nil
end

def list_all_books
  get_data
  @books.each do |v|
    puts "Title: \"#{v.tittle}\", Author: #{v.author}"
  end

  main
end

def list_all_people
  @people.each do |v|
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

  @people.push(Student.new(age.to_i, name, parent_permission: permission))

  save_data(@people, 'people')
end

def create_teacher(age, name)
  print 'Specialization: '
  speciality = gets.chomp

  @people.push(Teacher.new(age.to_i, speciality, name))

  save_data(@people, 'people')
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

  rental = Rental.new(date, @people[selected_person.to_i], @books[selected_book.to_i])
  @rentals.push(rental)

  puts 'Rental created succesfully!'

  save_data(@rentals, 'rentals')
  main
end

def not_element
  puts 'There is any element to select'
  main
end  

def select_book
  not_element if @books.empty? == true
  puts 'Selecte a book from the following list by number'
  @books.each_with_index do |v, i|
    puts "#{i}) Title: \"#{v.tittle}\", Author: #{v.author}"
  end
end

def select_person
  not_element if @people.empty? == true
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
  exit!
end

def save_data(data, file)
  json = JSON.generate(data)
  File.write("#{file}.json", json)
end

def recover_data(data, file)
  if File.exists?("#{file}.json") == true
    json = File.read("#{file}.json")
    data = JSON.parse(json, create_additions: true)
  end
end

@books = recover_data(@books, 'books')
@people = recover_data(@people, 'people')
@rentals = recover_data(@rentals, 'rentals')