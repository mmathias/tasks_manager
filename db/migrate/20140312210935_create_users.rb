class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :login, null: false
      t.string :password, null: false

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :login, unique: true
  end
end
