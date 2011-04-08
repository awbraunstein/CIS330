class Mention < ActiveRecord::Base
  belongs_to :user
  belongs_to :tweet

  validates_uniqueness_of :user_id, :scope => :tweet_id
end
