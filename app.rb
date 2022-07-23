# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity
require './student'
require './teacher'
require './book'
require './rental'

@books = []
@people = []
def list_all_books
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
  selected = selected.to_i
  print 'Age: '
  age = gets.chomp
  age = age.to_i
  print 'Name: '
  name = gets.chomp

  print 'Has parent permission? [Y/N]: ' if selected == 1
  permission = gets.chomp if selected == 1
  permission = true if %w[y Y].include?(permission)
  permission = false if %w[n N].include?(permission)

  print 'Specialization: ' if selected == 2
  speciality = gets.chomp if selected == 2

  @people.push(Student.new(age, name, parent_permission: permission)) if selected == 1
  @people.push(Teacher.new(age, speciality, name)) if selected == 2

  puts 'Person created succesfully!'

  main
end

def create_a_book
  print 'Title: '
  title = gets.chomp
  print 'Author: '
  author = gets.chomp

  @books.push(Book.new(title, author))

  puts 'Book created succesfully!'

  main
end

def create_a_rental
  puts 'Selecte a book from the following list by number'
  @books.each_with_index do |v, i|
    puts "#{i}) Title: \"#{v.tittle}\", Author: #{v.author}"
  end

  selected_book = gets.chomp
  selected_book = selected_book.to_i

  puts 'Select a person from the followin list by number (not id)'
  @people.each_with_index do |v, i|
    puts "#{i}) [#{v.class.name}] Name: #{v.name}, ID: #{v.id}, Age: #{v.age}"
  end

  selected_person = gets.chomp
  selected_person = selected_person.to_i

  print 'Date: '
  date = gets.chomp

  Rental.new(date, @people[selected_person], @books[selected_book])
  puts 'Rental created succesfully!'

  main
end

def list_all_rental_by_id
  print 'ID of person: '
  id = gets.chomp
  id = id.to_i

  puts 'Rentals: '

  @people.map do |v|
    next unless v.id == id

    v.rentals.each do |n|
      puts "Date: #{n.date}, Book \"#{n.book.tittle}\" by #{n.book.author}"
    end
  end

  main
end
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
