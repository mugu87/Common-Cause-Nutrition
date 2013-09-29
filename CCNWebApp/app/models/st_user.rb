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

    #Note: do not use this method. It is a private, helper method
    def calculate_total_calories(cal)
	sum = 0
	x = 0
	while x < cal.size do
	    puts cal[x][:outtake]
	    sum = sum + cal[x][:outtake]
	    x = x + 1
	end
    end

    def get_calories_lost_todate
	#puts @st_user.class.to_s
	this_user_calories = Calory.where(:user_id => id)
	sum = calculate_total_calories(this_user_calories)
	sum
    end

    #note
    def get_calories_lost_today
	today_calories = Calory.where("created_at >= ?", Time.zone.now.beginning_of_day)  
	sum = calculate_total_calories(today_calories)
	sum
    end

    #note: can be done in the views
    def get_organizations_list
    end

    # return an int
    def get_balance_to_spend
    end

    #note: height, weight, and list of organization can be access in the views
end
