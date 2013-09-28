class AddTotalCalorieOutToUser < ActiveRecord::Migration
  def change
    add_column :users, :total_calorie_out, :integer
  end
end
