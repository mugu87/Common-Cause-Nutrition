class RemoveHeightFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :Height, :integer
  end
end
