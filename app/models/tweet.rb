class Tweet < ActiveRecord::Base
  belongs_to :user
  
  validates :body, :length => {:maximum => 140}
end
