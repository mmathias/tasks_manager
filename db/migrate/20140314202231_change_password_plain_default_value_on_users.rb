class ChangePasswordPlainDefaultValueOnUsers < ActiveRecord::Migration
  def change
    change_column :users, :password_plain, :string, null: true
  end
end
