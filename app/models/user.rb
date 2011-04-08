# == Schema Information
# Schema version: 20110307224716
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
#  time_zone  :string
#  bio        :text
#  location   :string(255)
#  language   :string(255)
#  created_at :datetime
#  updated_at :datetime
#
require 'digest/sha1'

class User < ActiveRecord::Base
  has_many :tweets, :dependent => :destroy

  has_many :followsusers, :foreign_key => "follower_id", :dependent => :destroy
  has_many :following, :through => :followsusers, :source => :following,
           :conditions => ["approved = ?", true]
  
  has_many :usersfollow, :class_name => "Followsuser",
           :foreign_key => "following_id", :dependent => :destroy
  has_many :followers, :through => :usersfollow, :source => :follower,
           :conditions => ["approved = ?", true]
  
  has_many :followerrequests, :through => :usersfollow, :source => :follower,
           :conditions => ["approved = ?", false]

  has_many :followrequests, :through => :followsusers, :source => :following,
           :conditions => ["approved = ?", false]
  
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
    Tweet.all.each do |t|
      if follows?(t.user)
        all_tweets << t
      end
    end
    return all_tweets.sort_by! { |t| t.created_at }.reverse 
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
  
end
