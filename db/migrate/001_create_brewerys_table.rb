class CreateBrewerysTable < ActiveRecord::Migration
  def change
    create_table :breweries do |t|
      t.string :name
      t.string :brewery_type
      t.string :street
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :phone
      t.string :website_url
  end
end
end 
