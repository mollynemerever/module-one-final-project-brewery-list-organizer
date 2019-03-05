require 'pry'
require_relative "../config/environment.rb"
# def welcome
#   puts "Welcome to your Brewery List Organizer!"
#   are_you_a_user
# end
#
# def are_you_a_user
#   puts "Are you a new user?(y/n)"
#   input = gets.chomp
#   if input.downcase == "y"|| input.downcase == "yes"|| input.downcase == "yES"|| input.downcase == "yeS"
#     what_to_do
#   elsif input.downcase == "n"|| input.downcase == "no"|| input.downcase == "nO"
#     create_new_user
#   else
#     puts "Does-nert-compert/
#     enter a valid option! zeep-berp-pop"
#     are_you_a_user
#   end
# end
#
# def what_to_do
#   puts "Oh hi again! Thanks for coming back!"
#   puts "Please enter your username!"
#   input = gets.chomp
#   puts "So #{input}, what whould you like to do?"
#     puts "press 1 to search menu"
#     puts "press 2 to see your wishlist"
#     puts "press 3  to GTFO of 'ere"
#   input1 = gets.chomp
#   if input1 == "1"
#     search_menu
#   elsif input1 == "2"
#     display_wishlist
#   elsif input1 == "3"
#     puts "good-bye"
#     exit
#   else
#     what_to_do
#   end
# end
#
# def search_menu
#   puts "How would like to search your brewery database?
#
#           Press 1 to search by city
#
#           Press 2 to search by state
#
#           Press 3 to search by brewery type
#
#           Press 4 to search by brewery name
#
#           Press 5 to search by brewery postal code"
#
#   input = gets.chomp
#
#   if input == "1"
#     search_breweries_by_city
#   elsif input == "2"
#     serach_breweries_by_state
#   elsif input == "3"
#     search_breweries_by_type
#   elsif input == "4"
#     search_breweries_by_name
#   elsif input == "5"
#     search_breweries_by_postalcode
#   else
#     puts "Sorry I counldn't understand that...**mumble-grumble** please enter
#     somthing from the selection menu."
#     search_menu
#   end
# end
#
# def display_wishlist
#   puts "Here's your wishlist!"
#   brewerylists.input1
#   #we need to save the username input from the earlier welcome method in oreder
#   #to be used to search the brewery list db for the users list.
#   #We need to make this database!!
# end

def search_breweries_by_city
  puts "What city do you want to search by?"
  city_input = gets.chomp.downcase #puts user input in all downcase
  city_return = breweries.find_by(city: city_input)
  binding.pry
  city_return
end

# def serach_breweries_by_state
#   puts "What state do you want to search by?"
#   input = gets.chomp
# end

# #def search_breweries_by_type
#   puts "What type do you want to search by?"
#   input = gets.chomp
# #end

# def search_breweries_by_name
#   puts "What's the brewery name you want to search for?"
#   input = gets.chomp
# end

# #def search_breweries_by_postalcode
#   puts "What Postal Code do you want to search by?"
#   input = gets.chomp
# #end
Pry.start
