class Favoritetweet < ActiveRecord::Base
  belongs_to :user
  belongs_to :tweet
end
