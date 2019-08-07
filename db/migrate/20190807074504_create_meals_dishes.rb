class CreateMealsDishes < ActiveRecord::Migration[5.2]
  def change
    create_table :meals_dishes do |t|
      t.integer :meal_id
      t.integer :dish_id
      t.integer :meal_dish_rating

      t.timestamps
    end
  end
end
