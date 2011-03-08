class User < ActiveRecord::Base
  has_many :tweets
  belongs_to :user
  
  validates_presence_of :username, :firstname, :lastname, :email, :privacy
  validates_format_of :email,
                      :with =>  /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
                      :message => "Invalid email format"
end
