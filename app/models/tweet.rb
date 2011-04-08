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

  has_many :mentions
  has_many :users, :through => :mentions
  
  attr_accessible :body
  attr_readonly :user_id
  validates :body, :length => {:maximum => 140, :minimum =>1}

  def self.all_public_tweets
    all_tweets = []
    Tweet.all.each do |t|
      if t.user.privacy == 0
        all_tweets << t
      end
    end
    return all_tweets.sort_by! { |t| t.created_at }.reverse 
  end

end
