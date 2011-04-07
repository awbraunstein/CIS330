class CreateFollowsusers < ActiveRecord::Migration
  def self.up
    create_table :followsusers do |t|
      t.integer :follower_id
      t.integer :following_id
      t.integer :approved

      t.timestamps
    end
  end

  def self.down
    drop_table :followsusers
  end
end
