# == Schema Information
# Schema version: 20110418223441
#
# Table name: messagerelations
#
#  id         :integer         not null, primary key
#  message_id :integer
#  from_id    :integer
#  to_id      :integer
#  read       :boolean         default(TRUE)
#  created_at :datetime
#  updated_at :datetime
#

class Messagerelation < ActiveRecord::Base
  belongs_to :from, :class_name => "User"
  belongs_to :to, :class_name => "User"
  belongs_to :message
  
end
