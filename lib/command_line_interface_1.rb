 # require 'pry'
require_relative "../config/environment.rb"

@current_user_id = nil
@brewery_id_to_add = nil

def welcome
  puts "Welcome to your Brewery List Organizer!"
  puts
  are_you_a_user
end

def are_you_a_user
  puts "Are you a new user?(y/n)"
  input = gets.chomp
  puts
  if input.downcase == "y"|| input.downcase == "yes"
    create_new_user
  elsif input.downcase == "n"|| input.downcase == "no"
    puts "Please enter your username!"
    input = gets.chomp
    puts
      if User.where(username: "#{input}").count >= 1
        @current_user_id = User.where(username: "#{input}").pluck(:id).first
        system("clear")
        what_to_do
      else
        puts "Username not found! Are you sure you typed it correctly?"
        are_you_a_user
      end
  else
    puts "Invalid input
    Does-nert-compert!
    zeep-berp-pop
    please enter 'y' or 'n' "
    puts
    are_you_a_user
  end
end

def what_to_do
    username = User.where(id: "#{@current_user_id}").pluck(:username).first
    puts "So #{username}, what would you like to do?

      Press: 1 to view search menu and create a wishlist
      Press: 2 to see your wishlist
      Press: 3 to exit"
      puts
    input = gets.chomp
    puts
    if input == "1"
      search_menu
    elsif input == "2"
      display_wishlist
    elsif input == "3" || input.downcase == "exit"
      puts "Goodbye :)"
      exit
    else
      puts "Are you already drunk!?  Choose from the menu please. :)"
      what_to_do
    end
end

def search_menu
  puts "How would like to search our brewery database?

      Press: 1 to search by city
      Press: 2 to search by state
      Press: 3 to search by brewery name
      Press: 4 to view our most popular brewery
      Press: 5 to return to main menu
      Press: 6 to exit"
  puts
  input = gets.chomp
  puts
  if input == "1"
    search_breweries_by_city
  elsif input == "2"
    search_breweries_by_state
  elsif input == "3"
    search_breweries_by_name
  elsif input == "4"
    most_popular_brewery
  elsif input == "5"
    what_to_do
  elsif input == "6" || input.downcase == "exit"
    "Goodbye :)"
    exit
  else
    puts "Sorry I couldn't understand that...**mumble-grumble** please enter something from the selection menu."
    puts
    search_menu
  end
end



def get_wishlist  #creates a wishlist for the user
  wishlist_array = [] #holds all brewery information for wishlist
    user_wishlist = BreweryWishlist.where(user_id: @current_user_id) #array of users wishlist
    user_wishlist.each do |brewery_object|
      id_inquestion = brewery_object["brewery_id"]
      wishlist_array << Brewery.where(id: id_inquestion)
    end
   wishlist_array
end


def wishlist_options
  puts "What would you like to do next?"
  puts "
      Press: 1 to delete a brewery from your wishlist
      Press: 2 to search brewery database and add another brewery
      Press: 3 to go back to main menu
      Press: 4 to view your wishlist
      Press: 5 to exit"
  puts
  input = gets.chomp
  puts
  if input == "1"
    get_brewery_and_delete
  elsif input == "2"
    search_menu
  elsif input == "3"
    what_to_do
  elsif input == "4"
    display_wishlist
  elsif input == "5" || input.downcase == "exit"
    puts "Goodbye :)"
    exit
  else
    puts "Stop playing around or I'll kick you out!"
    puts
    wishlist_options
  end
end


def display_wishlist  #prints out the wishlist for the user
  wishlist = get_wishlist
  if wishlist.length >= 1 #checking if user wishlist is populated.
    puts "Your wishlist:"
    puts
    i = 1
      while i <= wishlist.length do
        wishlist.each do |brewery|
          brewery_array = brewery.inspect.split(",")
          puts "#{i}. #{brewery_array.join("\n")} \n"
          puts
          i += 1
        end
      end
  else
    puts "Your wishlist is empty! Lets browse our brewery database and make one!"
    search_menu
  end
  puts
  puts
  wishlist
  wishlist_options
end

def get_brewery_and_delete #get brewery to delete and delete
  puts "Type the number of the brewery you'd like to delete from your wishlist"
    wishlist = display_wishlist_for_delete
    user_delete_input = gets.chomp
    if user_delete_input == "exit"
      what_to_do
    end
    puts
    index = user_delete_input.to_i - 1 #represents the index of the brewery that should be removed from wishlist
  puts "Sad to see you delete a brewery!"
  puts
    delete_id = wishlist[index][0]["id"] #brewery id that needs to be removed
    delete_me = BreweryWishlist.where(user_id: @current_user_id, brewery_id: delete_id)
    BreweryWishlist.destroy(delete_me)
  puts "Wishlist Updated!"
  puts
  delete_another?
end

def display_wishlist_for_delete  #prints out the wishlist for the user
  wishlist = get_wishlist
  if wishlist.length >= 1 #checking if user wishlist is populated.
    puts "Your wishlist:"
    puts
    i = 1
      while i <= wishlist.length do
        wishlist.each do |brewery|
          brewery_array = brewery.inspect.split(",")
          puts "#{i}. #{brewery_array.join("\n")} \n"
          puts
          i += 1
        end
      end
  else
    puts "Your wishlist is empty! Lets browse our brewery database and make one!"
    puts
    search_menu
  end
  puts
  puts
  wishlist
end

def delete_another?
  puts "Would you like to delete another?(y/n)"
    input = gets.chomp
    puts
    if input.downcase == "y" || input.downcase == "yes"
      get_brewery_and_delete
    elsif input.downcase == "n" || nput.downcase == "no"
      wishlist_options
    elsif input.downcase == "exit"
      exit
    else
      puts "its a yes or no question...or exit I guess"
    end
end

def get_brewery_selection #would user like to add a brewery to their wishlist
  puts "To add a brewery to your wishlist, type the brewery's number or press 0 to return to search menu:"
  user_choice = gets.chomp  #integer
  puts
    if user_choice == "0"
      search_menu
    else
      index = user_choice.to_i - 1
      index
  end
end

def search_breweries_by_city
  puts "What city do you want to search by? (capitalize first letter)"
  city_input = gets.chomp #go back and revise to acoomodate up/downcase
  puts
  system("clear")
  if breweries_by_city = Brewery.where(city: city_input).count >= 1 # is an array
    breweries_by_city = Brewery.where(city: city_input).order(:state) #lists alphabetically by state
    puts "Results Below:"
    i = 1
      while i < breweries_by_city.length do
        breweries_by_city.each do |brewery|
          brewery_array = brewery.inspect.split(",")
          puts "#{i}. #{brewery_array.join("\n")} \n"
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
  puts
  system("clear")
  if breweries_by_state = Brewery.where(state: state_input).count >= 1
    breweries_by_state = Brewery.where(state: state_input).order(:city) #lists alphabetically by city
    puts "Results Below:"
    i = 1
      while i < breweries_by_state.length do
        breweries_by_state.each do |brewery|
          brewery_array = brewery.inspect.split(",")
          puts "#{i}. #{brewery_array.join("\n")} \n"
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
  puts
  system("clear")
if breweries_by_name = Brewery.where(name: name_input).count >= 1
  breweries_by_name = Brewery.where(name: name_input).order(:state) #orders by state incase multiple results
  puts "Results Below:"
  i = 1
  while i <= breweries_by_name.length do
    breweries_by_name.each do |brewery|
      brewery_array = brewery.inspect.split(",")
      puts "#{i}. #{brewery_array.join("\n")} \n"
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
  puts
  puts "Username?"
  username = gets.chomp
  puts
  puts "Name?"
  name = gets.chomp
  puts
  puts "Age?"
  age = gets.chomp
  puts
  puts "Location?"
  user_location = gets.chomp
  puts
  puts "Favorite Beer?"
  favorite_beer = gets.chomp
  puts
  system("clear")

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
  if BreweryWishlist.all.where(user_id: @current_user_id, brewery_id: @brewery_id_to_add).count < 1
  BreweryWishlist.create({
    user_id: @current_user_id,
    brewery_id: @brewery_id_to_add
    })
    puts "Wishlist Updated!"
    add_another?
  elsif BreweryWishlist.all.where(user_id: @current_user_id, brewery_id: @brewery_id_to_add).count >= 1
    puts "You already have that brewery saved on your wishlist"
    add_another?
  end
end

def add_another?
  puts
  puts "Search again?(y/n)"
  puts
  input = gets.chomp
  if input.downcase == "y" || input.downcase == "yes"
    search_menu
  elsif input.downcase == "n" || nput.downcase == "no"
    display_wishlist
  elsif input.downcase == "exit"
    exit
  else
    puts "It's a yes or no question...or exit I guess"
  end
end

def most_popular_brewery
  brewery_count = BreweryWishlist.group(:brewery_id).order('count_id DESC').count(:id).first
  most_wli = BreweryWishlist.all.select do |brewery|
      brewery.brewery_id == brewery_count[0]
    end
  most_pop = Brewery.where(id: most_wli.first["brewery_id"])
  brewery_array = most_pop[0].inspect.split(",")
  puts "#{1}. #{brewery_array.join("\n")} \n"
  puts
  puts "Do you want to add this brewrey to your wishlist?(y/n/exit)"
  puts
  input = gets.chomp
  puts
    if input.downcase == "y" || input.downcase == "yes"
      @brewery_id_to_add = most_pop[0]["id"]
      add_to_wishlist
    elsif input.downcase == "n" || input.downcase == "no"
      puts
      search_menu
    elsif input.downcase == "exit"
      exit
    else
      search_menu
    end
end


# Pry.start
