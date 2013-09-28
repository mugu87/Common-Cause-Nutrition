class AddTotalCalorieInToUser < ActiveRecord::Migration
  def change
    add_column :users, :total_calorie_in, :integer
  end
end
