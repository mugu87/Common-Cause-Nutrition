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

  $calories_per_dollar = 2000.00

  #Note: do not use this method. It is a private, helper method
  def calculate_total_calories(cal)
    sum = 0
    x = 0
    while x < cal.size do
      puts cal[x][:outtake]
      sum = sum + cal[x][:outtake]
      x = x + 1
    end
    sum
  end

  def get_calories_lost_todate
    #puts @st_user.class.to_s
    this_user_calories = Calory.where(:user_id => id)
    sum = calculate_total_calories(this_user_calories)
    sum
  end

  def get_money_for_calories_lost
    result = self.get_calories_lost_todate / $calories_per_dollar
    result
  end

  #note
  def get_calories_lost_today
    today_calories = Calory.where("created_at >= ?", Time.zone.now.beginning_of_day)  
    sum = calculate_total_calories(today_calories)
    sum
  end

  #update new data. Data to be updated
  #1. calorie_in
  #2. calorie_out
  #3. weight
  #4. height
  #
  #params: new_data.class.eql?Hash
  def update_data (new_data)
    new_cal = self.calories.build
    new_cal.intake = new_data["calorie_in"] 
    new_cal.outtake = new_data["calorie_out"]
    self.weight = new_data["weight"]
    self.height = new_data["height"]
    self.save
    new_cal.save
  end

  #returns hash.Eg: {:day_one => 1, :day_two => 2, ..., :day_five => 5}
  def get_org_total_cal_in_five_days
    five_day_ago = Time.now - 5.days
    four_day_ago = Time.now - 4.days
    three_day_ago = Time.now - 3.days
    two_day_ago = Time.now - 2.days
    one_day_ago = Time.now - 1.days
    today  = Time.now

    five_days_ago_tot_cal = Calory.where("updated_at > ? and updated_at < ?", five_day_ago, four_day_ago)
    four_days_ago_tot_cal = Calory.where("updated_at > ? and updated_at < ?", four_day_ago, three_day_ago)
    three_days_ago_tot_cal = Calory.where("updated_at > ? and updated_at < ?", three_day_ago, two_day_ago)
    two_days_ago_tot_cal = Calory.where("updated_at > ? and updated_at < ?", two_day_ago, one_day_ago)
    one_days_ago_tot_cal = Calory.where("updated_at > ? and updated_at < ?", one_day_ago, today)

    result = {:day_one => calculate_total_calories(five_days_ago_tot_cal),
              :day_two => calculate_total_calories(four_days_ago_tot_cal),
              :day_three => calculate_total_calories(three_days_ago_tot_cal),
              :day_four => calculate_total_calories(two_days_ago_tot_cal),
              :day_five => calculate_total_calories(one_days_ago_tot_cal),
    }
    result
  end 

  #note: can be done in the views
  def get_organizations_list
    return Organization.all
  end

  def get_money_donated

  end

  # return an int
  def get_money_to_spend
  end

  #note: height, weight, and list of organization can be access in the views
end

#todo:
#1.  money donated
#2. money to spend   ---done. see calories_to_spend
# 
#
