class DropColumnAdminInUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :admin, :boolean
    remove_column :users, :superadmin, :boolean
  end
end
