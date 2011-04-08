# == Schema Information
# Schema version: 20110408191113
#
# Table name: tags
#
#  id         :integer         not null, primary key
#  tag        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Tag < ActiveRecord::Base
  has_many :tagmentions, :dependent => :destroy
  has_many :tweets, :through => :tagmentions

  validates_uniqueness_of :tag
end
