# == Schema Information
# Schema version: 20110408191113
#
# Table name: inlists
#
#  id         :integer         not null, primary key
#  list_id    :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Inlist < ActiveRecord::Base
  belongs_to :user
  belongs_to :list

    validates_uniqueness_of :user_id, :scope => :list_id
end
