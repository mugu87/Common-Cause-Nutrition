class AddStUserIdToDonation < ActiveRecord::Migration
  def change
    add_column :donations, :stu_user_ID, :integer
  end
end
