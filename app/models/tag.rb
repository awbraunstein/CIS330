class Tag < ActiveRecord::Base
  has_many :tagmentions, :dependent => :destroy
  has_many :tweets, :through => :tagmentions
end
