#Seed file to create some Users
require_relative "../config/environment.rb"
# username: username,
# name: name,
# age: age,
# user_location: user_location,
# favorite_beer: favorite_beer
User.create({username: "Stan1", name: "Stan", age: 25, user_location: "Seattle", favorite_beer: "ipa"})
User.create({username: "Bettsy1", name: "Bettsy", age: 30, user_location: "Seattle", favorite_beer: "ipa"})
User.create({username: "Bobby111", name: "Bobby", age: 31, user_location: "Seattle", favorite_beer: "ipa"})

Pry.start
