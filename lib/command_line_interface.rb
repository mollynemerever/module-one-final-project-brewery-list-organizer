#this file holds methods that print out to the CLI
<<<<<<< HEAD
# require 'pry'
# require_relative "../config/environment.rb"

puts "You're in command_line_interface.rb"
=======


require 'pry'
require_relative "../config/environment.rb"
#create new user
# t.string :username
# t.string :name
# t.integer :age
# t.string :user_location
# t.string :favorite_beer
puts "test"
>>>>>>> 49426ac4860433495be36887ba06fd7e3d9533c1

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

end
<<<<<<< HEAD
# Pry.start
=======
Pry.start

>>>>>>> 49426ac4860433495be36887ba06fd7e3d9533c1
