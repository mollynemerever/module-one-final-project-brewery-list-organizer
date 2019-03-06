#this file holds methods that print out to the CLI


require 'pry'
require_relative "../config/environment.rb"
#create new user
# t.string :username
# t.string :name
# t.integer :age
# t.string :user_location
# t.string :favorite_beer
puts "test"


def search_breweries_by_city
  puts "What city do you want to search by? (capitalize first letter)"
  city_input = gets.chomp #go back and revise to acoomodate up/downcase
  breweries_by_city = Brewery.where(city: city_input)
  breweries_by_city.type 
end


def search_breweries_by_state
  puts "What state do you want to search by? (full name & capitalization)"
  state_input = gets.chomp #go back and revise to accomodate abbreviations
  breweries_by_state = Brewery.where(state: state_input)
  breweries_by_state
end

def search_breweries_by_name
  puts "What's the brewery name you want to search for?"
  name_input = gets.chomp #go back and revise to acoomodate abbreviations
  breweries_by_name = Brewery.where(name: name_input)
  breweries_by_name
end

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

  # puts username
  # puts name
  # puts age

   user_object = User.create({
    username: username,
    name: name,
    age: age,
    user_location: user_location,
    favorite_beer: favorite_beer
    })

end
Pry.start
