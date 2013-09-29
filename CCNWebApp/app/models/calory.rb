# == Schema Information
#
# Table name: calories
#
#  id         :integer          not null, primary key
#  intake     :integer
#  outtake    :integer
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class Calory < ActiveRecord::Base
  belongs_to :st_user
end
