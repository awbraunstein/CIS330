# == Schema Information
# Schema version: 20110418223441
#
# Table name: messages
#
#  id         :integer         not null, primary key
#  subject    :string(255)     not null
#  body       :text            not null
#  created_at :datetime
#  updated_at :datetime
#

class Message < ActiveRecord::Base
  has_one :messagerelation
  has_one :from, :through => :messagerelation
  has_one :to, :through => :messagerelation
  
  
  validates :subject, :presence => true
  validates :body, :presence => true
end
