class RemoveAdminFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :admin
    remove_column :users, :height
  end
end
