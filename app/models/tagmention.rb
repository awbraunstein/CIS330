# == Schema Information
# Schema version: 20110408191113
#
# Table name: tagmentions
#
#  id         :integer         not null, primary key
#  tweet_id   :integer
#  tag_id     :integer
#  created_at :datetime
#  updated_at :datetime
#

class Tagmention < ActiveRecord::Base
  belongs_to :tag
  belongs_to :tweet

  validates_uniqueness_of :tag_id, :scope => :tweet_id
end
