class Message < ActiveRecord::Base
  validates :subject, :presence => true
  validates :body, :presence => true
  validates :to, :presence => true
end
