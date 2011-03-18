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
#  time_zone  :integer
#  bio        :text
#  location   :string(255)
#  language   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  has_many :tweets, :dependent => :destroy
  has_many :users
  belongs_to :user
  
  attr_accessible :username, :firstname, :lastname, :email, :privacy, :webpage
  attr_accessible :time_zone, :bio, :location, :language
  validates_presence_of :username, :firstname, :lastname, :email, :privacy
  validates :username, :uniqueness => true
  validates :email, :presence => true,
                    :format =>  /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
                    :uniqueness => {:case_sensitive => false}
  
end
