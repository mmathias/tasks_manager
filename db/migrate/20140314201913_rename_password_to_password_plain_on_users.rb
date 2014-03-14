class RenamePasswordToPasswordPlainOnUsers < ActiveRecord::Migration
  def change
    rename_column :users, :password, :password_plain
  end
end
