class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :user_id
      t.integer :location_id
      t.datetime :opening_time
      t.datetime :closing_time
      t.integer :revenue
      t.integer :restaurant_rating
      t.integer :cuisine_id

      t.timestamps
    end
  end
end
