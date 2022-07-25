# rubocop:disable Metrics/CyclomaticComplexity
require './app'

def main
  options

  selected = gets.chomp

  list_all_books if selected.to_i == 1
  list_all_people if selected.to_i == 2
  create_a_person if selected.to_i == 3
  create_a_book if selected.to_i == 4
  create_a_rental if selected.to_i == 5
  list_all_rental_by_id if selected.to_i == 6
  puts 'Thank you for using this app!' if selected.to_i == 7
end

def options
  puts ''
  puts 'Please choose an option by enterin a number:'
  options = ['List all books', 'List all people', 'Create a person', 'Create a book', 'Create a rental',
             'List all rentals for a given person id', 'Exit']
  options.each_with_index { |v, k| puts "#{k + 1} - #{v}" }
end

puts 'Welcome to School Library App!'
main

# rubocop:enable Metrics/CyclomaticComplexity
