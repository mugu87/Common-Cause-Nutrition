# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string(255)
#  height                 :integer
#  weight                 :integer
#  sex                    :string(255)
#  total_calorie_in       :integer
#  total_calorie_out      :integer
#

class StUser < User
  has_many :donations
  belongs_to :organization
  has_many :calories

  def get_calories_lost_todate
      this_user_calories = Calory.where(:user_id => @st_user)
      sum = 0
      x = 0
      while x < this_user_calories.size do
	  sum = sum + this_user_calories[:outake]
	  x = x + 1
      end
  end

  #note
  def get_calories_lost_today
  end

  #note: can be done in the views
  def get_organizations_list
  end

  # return an int
  def get_balance_to_spend
  end

  #note: height, weight, and list of organization can be access in the views
end
