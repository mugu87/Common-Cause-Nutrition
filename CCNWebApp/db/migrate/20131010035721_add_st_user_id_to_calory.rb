class AddStUserIdToCalory < ActiveRecord::Migration
  def change
    add_column :calories, :st_user_id, :integer
  end
end
