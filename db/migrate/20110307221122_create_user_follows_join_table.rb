class CreateUserFollowsJoinTable < ActiveRecord::Migration
  def self.up
    create_table :follows_user, :id => false do |t|
      t.integer :follower_id
      t.integer :follows_id
    end
  end

  def self.down
    drop_table :follows_user
  end
end
