# == Schema Information
# Schema version: 20110307224716
#
# Table name: tweets
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  body       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Tweet < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :body
  attr_readonly :user_id
  validates :body, :length => {:maximum => 140, :minimum =>1}
end
