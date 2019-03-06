require 'pry'
require_relative "../config/environment.rb"

@current_user_id = nil
@brewery_id_to_add = nil

def welcome
  puts "Welcome to your Brewery List Organizer!"
  are_you_a_user
end

def are_you_a_user
  puts "Are you a new user?(y/n)"
  input = gets.chomp
  if input.downcase == "y"|| input.downcase == "yes"|| input.downcase == "yES"|| input.downcase == "yeS"
    what_to_do
  elsif input.downcase == "n"|| input.downcase == "no"|| input.downcase == "nO"
    create_new_user
  else
    puts "Does-nert-compert/
    enter a valid option! zeep-berp-pop"
    are_you_a_user
  end
end

def what_to_do
  puts "Oh hi again! Thanks for coming back!"
  puts "Please enter your username!"
  input = gets.chomp
  puts "So #{input}, what whould you like to do?"
    puts "press 1 to search menu"
    puts "press 2 to see your wishlist"
    puts "press 3  to GTFO of 'ere"
  input1 = gets.chomp
  if input1 == "1"
    search_menu
  elsif input1 == "2"
    display_wishlist
  elsif input1 == "3"
    puts "good-bye"
    exit
  else
    what_to_do
  end
end

def search_menu
  puts "How would like to search your brewery database?

          Press 1 to search by city

          Press 2 to search by state

          Press 3 to search by brewery type

          Press 4 to search by brewery name

          Press 5 to search by brewery postal code"

  input = gets.chomp

  if input == "1"
    search_breweries_by_city
  elsif input == "2"
    serach_breweries_by_state
  elsif input == "3"
    search_breweries_by_type
  elsif input == "4"
    search_breweries_by_name
  elsif input == "5"
    search_breweries_by_postalcode
  else
    puts "Sorry I counldn't understand that...**mumble-grumble** please enter
    somthing from the selection menu."
    search_menu
  end
end

def display_wishlist
  puts "Here's your wishlist!"
<<<<<<< HEAD
=======

  #brewerylists.
>>>>>>> d2fccaf5ad80d9849049bda57c82102a0749747d
  #we need to save the username input from the earlier welcome method in oreder
  #to be used to search the brewery list db for the users list.
  #We need to make this database!!
end

def get_brewery_selection #would user like to add a brewery to their wishlist
  puts "To add a brewery to your wishlist, type the brewery's number"
  user_choice = gets.chomp  #integer
  index = user_choice.to_i - 1
  index
end

def search_breweries_by_city
  puts "What city do you want to search by? (capitalize first letter)"
  city_input = gets.chomp #go back and revise to acoomodate up/downcase

  breweries_by_city = Brewery.where(city: city_input) # is an array
  puts "Results Below:"
  i = 1
  while i < breweries_by_city.length do
    breweries_by_city.each do |brewery|
      puts "#{i}. #{brewery.inspect}"
      i += 1  #print out brewery in numbered list
    end
  end
  brewery_index = get_brewery_selection #call add to wishlist method
  brewery_id_to_add = breweries_by_city[brewery_index]["id"] #access the brewery
end


def search_breweries_by_state
  puts "What state do you want to search by? (full name & capitalization)"
  state_input = gets.chomp #go back and revise to accomodate abbreviations
  breweries_by_state = Brewery.where(state: state_input)
  puts "Results Below:"
  i = 1
  while i < breweries_by_state.length do
    breweries_by_state.each do |brewery|
      puts "#{i}.  #{brewery.inspect}" #prints breweries in numbered list
      i += 1
    end
  end
  brewery_index = get_brewery_selection #call add to wishlist method
  brewery_id_to_add = breweries_by_state[brewery_index]["id"] #access the brewery
end



def search_breweries_by_name
  puts "What's the brewery name you want to search for?"
  name_input = gets.chomp #go back and revise to acoomodate abbreviations
  breweries_by_name = Brewery.where(name: name_input)
  puts "Results Below:"
  i = 1
  while i <= breweries_by_name.length do
    breweries_by_name.each do |brewery|
      puts "#{i}.  #{brewery.inspect}"
      i += 1
    end
  end
  brewery_index = get_brewery_selection #call add to wishlist method
  brewery_id_to_add = breweries_by_name[brewery_index]["id"] #access the brewery
end

#
# puts "Do you want to add a brewery to your breweries wishlist?(y/n)"
# input = gets.chomp
# if input.downcase == "y"|| input.downcase == "yes"|| input.downcase == "yES"|| input.downcase == "yeS"
#   add_to_wishlist
# elsif input.downcase == "n"|| input.downcase == "no"|| input.downcase == "nO"
#   what_to_do
# else
#   puts "Does-nert-compert/
#   enter a valid option! zeep-berp-pop"
#   search_breweries_by_name
# end



def create_new_user
  puts "Please fill out the following account info:"
  puts "Username?"
  username = gets.chomp
  puts username
  puts "Name?"
  name = gets.chomp
  puts "Age?"
  age = gets.chomp
  puts "Location?"
  user_location = gets.chomp
  puts "Favorite Beer?"
  favorite_beer = gets.chomp

   user_object = User.create({
    username: username,
    name: name,
    age: age,
    user_location: user_location,
    favorite_beer: favorite_beer
    })
    @current_user_id = user_object.id
end



def add_to_wishlist
  BreweryWishlist.create({
    user_id: @current_user_id
    brewery_id: @brewery_id_add
    })
end


Pry.start
