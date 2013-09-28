# == Schema Information
#
# Table name: donations
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

class Donation < ActiveRecord::Base

  belongs_to :users
  belongs_to :organization
end
