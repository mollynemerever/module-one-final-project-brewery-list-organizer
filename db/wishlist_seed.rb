require_relative "../config/environment.rb"
BreweryWishlist.destroy_all

BreweryWishlist.create({user_id: 1, brewery_id: 13096})
BreweryWishlist.create({user_id: 1, brewery_id: 13167})
BreweryWishlist.create({user_id: 2, brewery_id: 8058})
BreweryWishlist.create({user_id: 3, brewery_id: 8060})
