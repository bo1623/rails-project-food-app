class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.string :name
      t.integer :price
      t.integer :dish_id
      t.integer :user_id
      t.integer :rating

      t.timestamps
    end
  end
end
