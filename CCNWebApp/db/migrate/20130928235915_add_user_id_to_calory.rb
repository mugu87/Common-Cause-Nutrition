class AddUserIdToCalory < ActiveRecord::Migration
  def change
    add_column :calories, :user_id, :integer
  end
end
