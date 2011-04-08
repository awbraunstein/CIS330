class CreateTagmentions < ActiveRecord::Migration
  def self.up
    create_table :tagmentions do |t|
      t.integer :tweet_id, :presence => true
      t.integer :tag_id, :presence => true

      t.timestamps
    end
  end

  def self.down
    drop_table :tagmentions
  end
end
