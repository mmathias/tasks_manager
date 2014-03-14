class RemovePasswordPlainFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :password_plain
  end
end
