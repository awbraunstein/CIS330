class CreateFollowsusers < ActiveRecord::Migration
  def self.up
    create_table :followsusers do |t|
      t.integer :follower_id, :presence => true
      t.integer :following_id, :presence => true
      t.boolean :approved, :presence => true

      t.timestamps
    end
    add_index :followsusers, :follower_id
    add_index :followsusers, :following_id
    add_index :followsusers, [:follower_id, :following_id], :unique => true
  end

  def self.down
    drop_table :followsusers
  end
end
