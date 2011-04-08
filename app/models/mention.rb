# == Schema Information
# Schema version: 20110408191113
#
# Table name: mentions
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  tweet_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Mention < ActiveRecord::Base
  belongs_to :user
  belongs_to :tweet

  validates_uniqueness_of :user_id, :scope => :tweet_id
end
