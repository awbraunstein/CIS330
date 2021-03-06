class CreateFollowslists < ActiveRecord::Migration
  def self.up
    create_table :followslists do |t|
      t.integer :list_id, :presence => true
      t.integer :user_id, :presence => true

      t.timestamps
    end
  end

  def self.down
    drop_table :followslists
  end
end
