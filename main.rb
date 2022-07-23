require './app'

def main
# Present the user with a list of options to perform.

puts ""
puts "Please choose an option by enterin a number:"
options = ['List all books', 'List all people', 'Create a person', 'Create a book', 'Create a rental', 'List all rentals for a given person id', 'Exit']
options.each_with_index{ |v, k| puts "#{k+1} - #{v}" }

# Lets users choose an option.
selected = gets.chomp
selected = selected.to_i
# If needed, ask for parameters for the option.
create_a_person() if selected == 3
create_a_book() if selected == 4
list_all_books() if selected == 1
list_all_people() if selected == 2
create_a_rental() if selected == 5
list_all_rental_by_id() if selected == 6
puts "Thank you for using this app!" if selected == 7

end

puts "Welcome to School Library App!"
main()
