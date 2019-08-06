class CreateCorporations < ActiveRecord::Migration[5.2]
  def change
    create_table :corporations do |t|
      t.string :name
      t.integer :revenue
      t.string :cuisine
      t.integer :rating

      t.timestamps
    end
  end
end
