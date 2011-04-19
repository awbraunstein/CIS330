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
    
  has_many :mentions, :dependent => :destroy
  has_many :users, :through => :mentions
  
  has_many :tagmentions, :dependent => :destroy
  has_many :tags, :through => :tagmentions

  has_many :favoritetweets, :dependent => :destroy
  has_many :favorites, :through => :favoritetweets, :source => :user
  
  attr_accessible :body
  attr_readonly :user_id
  validates :body, :length => {:maximum => 140, :minimum =>1}

  after_save :add_mentions, :add_tagmentions

  def add_mentions
    body.scan(/@[^ ]*/) do |m|
      username = m.to_s
      username = username[1, username.length]
      userobject = User.find_by_username(username)
      if !userobject.nil?
        uid = userobject.id
        Mention.create(:user_id => uid, :tweet_id => self.id)
      end
    end
  end

  def add_tagmentions
    body.scan(/#[^ ]*/) do |m|
      tag = m.to_s
      tag = tag[1, tag.length]
      tagobject = Tag.find_by_tag(tag)
      tagobject ||= Tag.create(:tag => tag)
      tid = tagobject.id
      if !tid.nil?
        Tagmention.create(:tag_id => tid, :tweet_id => self.id)
      end
    end
  end
  
  def self.all_public_tweets
    all_tweets = []
    Tweet.all.each do |t|
      if t.user.privacy == 0
        all_tweets << t
      end
    end
    return all_tweets.sort_by { |t| t.created_at }.reverse 
  end

end
