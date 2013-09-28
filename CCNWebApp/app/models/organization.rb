# == Schema Information
#
# Table name: organizations
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  location    :string(255)
#  discription :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Organization < ActiveRecord::Base
  has_many :donations
  has_many :st_users
end
