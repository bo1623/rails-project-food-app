class CreateDishes < ActiveRecord::Migration[5.2]
  def change
    create_table :dishes do |t|
      t.string :name
      t.integer :price
      t.integer :average_rating
      t.integer :restaurant_id

      t.timestamps
    end
  end
end