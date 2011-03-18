# == Schema Information
# Schema version: 20110318001222
#
# Table name: messages
#
#  id         :integer         not null, primary key
#  subject    :string(255)     not null
#  body       :text            not null
#  from_id    :integer         not null
#  to_id      :integer         not null
#  created_at :datetime
#  updated_at :datetime
#

class Message < ActiveRecord::Base
  validates :subject, :presence => true
  validates :body, :presence => true
  validates :to_id, :presence => true, :associated => true
end
