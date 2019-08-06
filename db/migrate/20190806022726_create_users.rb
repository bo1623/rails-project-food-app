class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.boolean :admin
      t.boolean :restaurant_manager
      t.sring :password_digest
      t.timestamps
    end
  end
end
