class CreateBreweryWishlistTable < ActiveRecord::Migration
  def change
    create_table :brewery_wishlists do |t|
        t.integer :brewery_id
        t.integer :user_id
    end
  end
end
