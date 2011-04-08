class Tagmention < ActiveRecord::Base
  belongs_to :tag
  belongs_to :tweet

  validates_uniqueness_of :tag_id, :scope => :tweet_id
end
