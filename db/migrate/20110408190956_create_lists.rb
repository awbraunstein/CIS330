class CreateLists < ActiveRecord::Migration
  def self.up
    create_table :lists do |t|
      t.string :name, :uniqueness => :true, :presence => :true
      t.boolean :private, :default => false
      t.integer :creator_id, :presence => true

      t.timestamps
    end
  end

  def self.down
    drop_table :lists
  end
end
