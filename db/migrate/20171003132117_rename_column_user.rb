class RenameColumnUser < ActiveRecord::Migration[5.1]
  def change
  	rename_column :users, :password, :password_digest
  	rename_column :menus, :Name, :name
  end
end
