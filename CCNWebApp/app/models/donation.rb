# == Schema Information
#
# Table name: donations
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  amount     :decimal(, )
#

class Donation < ActiveRecord::Base

  belongs_to :st_users
  belongs_to :organization
end
