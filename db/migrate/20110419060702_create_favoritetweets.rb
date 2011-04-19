class CreateFavoritetweets < ActiveRecord::Migration
  def self.up
    create_table :favoritetweets do |t|
      t.integer :tweet_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :favoritetweets
  end
end
