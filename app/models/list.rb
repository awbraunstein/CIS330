# == Schema Information
# Schema version: 20110408191113
#
# Table name: lists
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  private    :boolean
#  creator_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class List < ActiveRecord::Base
  belongs_to :creator, :class_name => :User, :foreign_key => :creator_id
  
  has_many :followslists, :dependent => :destroy
  has_many :followers, :through => :followslists, :source => :user

  has_many :inlists, :dependent => :destroy
  has_many :users_in_list, :through => :inlists, :source => :user

  validates_uniqueness_of :name

  def public_tweets
    all_tweets = []
    self.users_in_list.each do |u|
      if u.privacy == 0
        all_tweets += u.tweets
      end
    end
    return all_tweets.sort_by { |t| t.created_at }.reverse 
  end

  def visible_tweets(user)
    all_tweets = []
    self.users_in_list.each do |u|
      if u.privacy == 0 || user.follows?(u)
        all_tweets += u.tweets
      end
    end
    return all_tweets.sort_by { |t| t.created_at }.reverse 
  end
end
