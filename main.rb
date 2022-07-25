# frozen_string_literal: true

require './app'

def main
  options = [
    { id: 1, text: 'List all books', method: 'list_all_books' },
    { id: 2, text: 'List all people', method: 'list_all_people' },
    { id: 3, text: 'Create a person', method: 'create_a_person' },
    { id: 4, text: 'Create a book', method: 'create_a_book' },
    { id: 5, text: 'Create a rental', method: 'create_a_rental' },
    { id: 6, text: 'List all rentals for a given person id', method: 'list_all_rental_by_id' },
    { id: 7, text: 'Exit', method: 'exit' }
  ]
  option_cycle(options)
end

def option_cycle(option)
  puts ''
  puts 'Please choose an option by enterin a number:'

  option.each { |v| puts "#{v[:id]} - #{v[:text]}" }

  selected = gets.chomp

  option.each { |v| send(v[:method]) if v[:id] == selected.to_i }
end

puts 'Welcome to School Library App!'

main
