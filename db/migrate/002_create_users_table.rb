class CreateUsersTable < ActiveRecord::Migration[4.2]

  def change
    create_table :users do |t|
      t.string :username
      t.string :name
      t.integer :age
      t.string :user_location
      t.string :favorite_beer
    end
  end
end
