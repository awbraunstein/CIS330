class Tag < ActiveRecord::Base
  has_many :tagmentions, :dependent => :destroy
  has_many :tweets, :through => :tagmentions

  validates_uniqueness_of :tag
end
