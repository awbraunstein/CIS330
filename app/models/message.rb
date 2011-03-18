class Message < ActiveRecord::Base
  validates :subject, :presence => true
  validates :body, :presence => true
  validates :to_id, :presence => true, :associated => true
end
