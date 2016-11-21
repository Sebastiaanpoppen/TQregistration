class AddFullAccessToAdmin < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :full_access, :boolean, :default => false
  end
end
