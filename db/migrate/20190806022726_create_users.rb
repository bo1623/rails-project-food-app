class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.boolean :admin, default: false
      t.boolean :restaurant_manager, default: false
      t.string :password_digest
      t.timestamps
    end
  end
end
