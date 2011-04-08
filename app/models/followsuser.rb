# == Schema Information
# Schema version: 20110408191113
#
# Table name: followsusers
#
#  id           :integer         not null, primary key
#  follower_id  :integer
#  following_id :integer
#  approved     :boolean
#  created_at   :datetime
#  updated_at   :datetime
#

class Followsuser < ActiveRecord::Base
  belongs_to :follower, :class_name => "User", :foreign_key => "follower_id"
  belongs_to :following, :class_name => "User", :foreign_key => "following_id"

  validates_uniqueness_of :follower_id, :scope => :following_id
end
