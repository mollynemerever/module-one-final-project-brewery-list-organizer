class CreateUsersTable < ActiveRecord::Migration[4.2]
<<<<<<< HEAD
  
=======

  def change
    create_table :users do |t|
      t.string :username #anders1216
      t.integer :age  #25
      t.string :user_location #seattle, wa
      t.string :favorite_beer #ipa
    end

  end

>>>>>>> origin
end
