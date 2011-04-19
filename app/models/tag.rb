# == Schema Information
# Schema version: 20110408191113
#
# Table name: tags
#
#  id         :integer         not null, primary key
#  tag        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Tag < ActiveRecord::Base
  has_many :tagmentions, :dependent => :destroy
  has_many :tweets, :through => :tagmentions

  validates_uniqueness_of :tag

  def self.search(term)
    tags = find(:all, :conditions => ['tag LIKE ?', "%" + term + "%"])
    tag_tweets = []
    tags.each do |t|
      t.tagmentions.each do |m|
        tag_tweets << m.tweet
      end
    end
    return tag_tweets.flatten.sort_by {|t| t.created_at}.reverse
  end
end
