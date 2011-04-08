class CreateLists < ActiveRecord::Migration
  def self.up
    create_table :lists do |t|
      t.string :name
      t.boolean :private
      t.integer :creator_id

      t.timestamps
    end
  end

  def self.down
    drop_table :lists
  end
end
