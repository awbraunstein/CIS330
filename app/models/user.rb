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
  has_many :followees, :class_name => "User"
  belongs_to :followers, :class_name => "User"
  
  attr_accessible :username, :firstname, :lastname, :email, :privacy, :webpage
  attr_accessible :time_zone, :bio, :location, :language, :password, :password_confirmation
  validates_presence_of :username, :firstname, :lastname, :email, :privacy, :password,:password_confirmation
  validates :username, :uniqueness => true
  validates :email, :presence => true,
                    :format =>  /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
                    :uniqueness => {:case_sensitive => false}
  validates_confirmation_of :password

  attr_accessor :password, :password_confirmation
  #  before_save Digest::SHA1.hexdigest(password)

  
  def self.encrypt_password
    print password
    self.password = encrypt(password)
    print password
  end

  def encrypt(string)
    Digest::SHA1.hexdigest(string)
  end
  
end
