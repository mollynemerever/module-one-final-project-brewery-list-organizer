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
    create_new_user
  elsif input.downcase == "n"|| input.downcase == "no"|| input.downcase == "nO"
    what_to_do
  else
    puts "Does-nert-compert/
    enter a valid option! zeep-berp-pop"
    are_you_a_user
  end
end

def what_to_do
  puts "Oh hi! Thanks for coming in!"
  puts "Please enter your username!"
  input = gets.chomp
  if User.where(username: "#{input}").count >= 1
    @current_user_id = User.where(username: "#{input}").pluck(:id).first

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
  else
    puts "Does-nert-compert/
    enter a valid option! zeep-berp-pop"
    what_to_do
    # create_new_user
  end
end

def search_menu
  puts "How would like to search your brewery database?
          Press 1 to search by city
          Press 2 to search by state
          Press 3 to search by brewery name"

  input = gets.chomp

  if input == "1"
    search_breweries_by_city
  elsif input == "2"
    search_breweries_by_state
  elsif input == "3"
    search_breweries_by_name
  else
    puts "Sorry I couldn't understand that...**mumble-grumble** please enter
    somthing from the selection menu."
    search_menu
  end
end



def get_wishlist  #creates a wishlist for the user
  puts "Getting Wishlist..."
  wishlist_array = [] #holds all brewery information for wishlist
  user_wishlist = BreweryWishlist.where(user_id: @current_user_id) #array of users wishlist

  user_wishlist.each do |brewery_object|
    id_inquestion = brewery_object["brewery_id"]
    wishlist_array << Brewery.where(id: id_inquestion)
  end
   wishlist_array
end

def display_wishlist  #prints out the wishlist for the user
  wishlist = get_wishlist
  puts "have wishlist"
  i = 1
    while i <= wishlist.length do
      wishlist.each do |brewery|
        puts "#{i}.  #{brewery.inspect} \n"
        puts
        i += 1
      end
    end
end

def delete_brewery
  puts "Sad to see you delete a brewery!"
  brewery_delete = get_brewery_deletion
end

def get_brewery_deletion
  puts "Type the number of the brewery you'd like to delete from your wishlist"
  user_delete_input = gets.chomp
  index = user_delete_input.to_i - 1
  index #represents the index of the brewery that should be removed from wishlist
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
  if breweries_by_city = Brewery.where(city: city_input).count >= 1 # is an array
    breweries_by_city = Brewery.where(city: city_input)
    puts "Results Below:"
    i = 1
      while i < breweries_by_city.length do
        breweries_by_city.each do |brewery|
          puts "#{i}. #{brewery.inspect} \n"
          puts
          i += 1  #print out brewery in numbered list
        end
      end
  elsif city_input.downcase == "exit"
    exit
  else
    puts "Please check your spelling and try again! Thanks :)"
    search_breweries_by_city
  end
  brewery_index = get_brewery_selection #call add to wishlist method
  @brewery_id_to_add = breweries_by_city[brewery_index]["id"]#access the brewery
  add_to_wishlist
end


def search_breweries_by_state
  puts "What state do you want to search by? (full name & capitalization)"
  state_input = gets.chomp #go back and revise to accomodate abbreviations
  if breweries_by_state = Brewery.where(state: state_input).count >= 1
    breweries_by_state = Brewery.where(state: state_input)
    puts "Results Below:"
    i = 1
      while i < breweries_by_state.length do
        breweries_by_state.each do |brewery|
          puts "#{i}.  #{brewery.inspect} \n" #prints breweries in numbered list
          puts
          i += 1
        end
      end
  elsif state_input.downcase == "exit"
    exit
  else
    puts "Please check your spelling and try again! Thanks :)"
    search_breweries_by_state
  end
  brewery_index = get_brewery_selection #call add to wishlist method
  @brewery_id_to_add = breweries_by_state[brewery_index]["id"] #access the brewery
  add_to_wishlist
end


def search_breweries_by_name
  puts "What's the brewery name you want to search for?"
  name_input = gets.chomp #go back and revise to acoomodate abbreviations
if breweries_by_name = Brewery.where(name: name_input).count >= 1
  breweries_by_name = Brewery.where(name: name_input)
  puts "Results Below:"
  i = 1
  while i <= breweries_by_name.length do
    breweries_by_name.each do |brewery|
      puts "#{i}.  #{brewery.inspect} \n"
      puts
      i += 1
    end
  end
  elsif name_input.downcase == "exit"
    exit
  else
    puts "Please check your spelling and try again! Thanks :)"
    search_breweries_by_name
  end
  brewery_index = get_brewery_selection #call add to wishlist method
  @brewery_id_to_add = breweries_by_name[brewery_index]["id"]
  add_to_wishlist #access the brewery
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

  user_object = User.create({
    username: username,
    name: name,
    age: age,
    user_location: user_location,
    favorite_beer: favorite_beer
    })
    @current_user_id = user_object.id

    what_to_do
end



def add_to_wishlist
  BreweryWishlist.create({
    user_id: @current_user_id,
    brewery_id: @brewery_id_to_add
    })
    what_to_do
end

Pry.start
