class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :corporation_id
      t.integer :location_id
      t.datetime :opening_time
      t.datetime :closing_time
      t.integer :revenue
      t.integer :rating

      t.timestamps
    end
  end
end