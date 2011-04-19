# == Schema Information
# Schema version: 20110418222911
#
# Table name: users
#
#  id         :integer         not null, primary key
#  username   :string(255)
#  firstname  :string(255)
#  lastname   :string(255)
#  email      :string(255)
#  privacy    :integer
#  webpage    :string(255)
#  time_zone  :string(255)
#  bio        :text
#  location   :string(255)
#  language   :string(255)
#  created_at :datetime
#  updated_at :datetime
#  password   :string(255)
#

# == Schema Information
# Schema version: 20110408191113
#
# Table name: users
#
#  id         :integer         not null, primary key
#  username   :string(255)
#  firstname  :string(255)
#  lastname   :string(255)
#  email      :string(255)
#  privacy    :integer
#  webpage    :string(255)
#  time_zone  :string(255)
#  bio        :text
#  location   :string(255)
#  language   :string(255)
#  created_at :datetime
#  updated_at :datetime
#  password   :string(255)
#
require 'digest/sha1'

class User < ActiveRecord::Base
  has_many :tweets, :dependent => :destroy

  has_many :followsusers, :foreign_key => "follower_id", :dependent => :destroy
  has_many :following, :through => :followsusers, :source => :following,
           :conditions => ["approved = ?", true]
  has_many :followrequests, :through => :followsusers, :source => :following,
           :conditions => ["approved = ?", false]

  has_many :usersfollow, :class_name => "Followsuser",
           :foreign_key => "following_id", :dependent => :destroy
  has_many :followers, :through => :usersfollow, :source => :follower,
           :conditions => ["approved = ?", true]
  has_many :followerrequests, :through => :usersfollow, :source => :follower,
           :conditions => ["approved = ?", false]
  
  has_many :mentions, :dependent => :destroy
  has_many :tweetmentions, :through => :mentions, :source => :tweet

  has_many :createdlists, :class_name => "List", :foreign_key => :creator_id,
           :dependent => :destroy

  has_many :inlists, :dependent => :destroy
  has_many :contained_in_lists, :through => :inlists, :source => :user

  has_many :followslists, :dependent => :destroy
  has_many :listsfollowing, :through => :followslists, :source => :user

  has_many :messagerelation_senders, :class_name => "Messagerelation",
           :foreign_key => :from_id, :dependent => :destroy
  has_many :sent_messages, :through => :messagerelation_senders,
           :source => :message

  has_many :messagerelation_receivers, :class_name => "Messagerelation",
           :foreign_key => :to_id, :dependent => :destroy
  has_many :received_messages, :through => :messagerelation_receivers,
           :source => :message

  has_many :favoritetweets, :dependent => :destroy
  has_many :favorites, :through => :favoritetweets, :source => :tweet
  
  attr_accessible :username, :firstname, :lastname, :email, :privacy, :webpage
  attr_accessible :time_zone, :bio, :location, :language, :password, :password_confirmation
  validates_presence_of :username, :firstname, :lastname, :email, :privacy, :password,:password_confirmation
  validates :username, :uniqueness => true
  validates :email, :presence => true,
                    :format =>  /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
                    :uniqueness => {:case_sensitive => false}
  validates_confirmation_of :password

  #  attr_accessor :password, :password_confirmation
  #  before_save Digest::SHA1.hexdigest(password)

  def follows?(user)
    if user.nil?
      return false
    end
    rel = followsusers.find_by_following_id(user.id)
    if rel.nil?
      return false
    elsif !rel.approved
      return false
    end
      return true
  end

  def requested?(user)
    if user.nil?
      return false
    end
    rel = followsusers.find_by_following_id(user.id)
    if rel.nil?
      return false
    elsif !rel.approved
      return true
    end
    return false
  end
  
  def approve!(user)
    rel = usersfollow.find_by_follower_id(user.id)
    rel.approved = true
    rel.save
  end
    
  
  def follow!(user)
    if follows?(user) || requested?(user)
      return
    end
    if user.privacy == 0
      followsusers.create!(:following_id => user.id, :approved => true)
    else
      followsusers.create!(:following_id => user.id, :approved => false)
    end
  end

  def unfollow!(user)
    followsusers.find_by_following_id(user.id).destroy
  end

  
  def all_following_tweets
    all_tweets = []
    self.following.each do |u|
      u.tweets.each do |t|
        all_tweets << t
      end
    end
    return all_tweets.sort_by { |t| t.created_at }.reverse 
  end

  def follow_suggestion
    all_follow_follow = []
    following.each do |u|
      all_follow_follow << u.following
    end
    all_follow_follow = all_follow_follow.flatten
    all_follow_follow.delete(self)
    all_follow_follow.delete_if{|u| following.include?(u)}
    return all_follow_follow[rand(all_follow_follow.length)] unless all_follow_follow.empty?
  end

  def common_following_count(user)
    return user.followers.delete_if{|u| !following.include?(u)}.count
  end
  
  def self.encrypt_password
    print password
    self.password = encrypt(password)
    print password
  end

  def encrypt(string)
    Digest::SHA1.hexdigest(string)
  end

  def self.authenticate(username, password)
    user = find_by_username(username)
    if user.nil?
      return nil
    elsif user.password == password
      return user
    end
  end

  def self.search(term)
    users = find(:all, :conditions => ['username LIKE ?', "%" + term + "%"])
  end

  def self.search_mentions(term)
    users = find(:all, :conditions => ['username LIKE ?', "%" + term + "%"])
    mention_tweets = []
    users.each do |u|
      u.mentions.each do |m|
        mention_tweets << m.tweet
      end
    end
    return mention_tweets.flatten.sort_by{|t| t.created_at}.reverse
  end
  
end
