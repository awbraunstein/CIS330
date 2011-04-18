class CreateMessagerelations < ActiveRecord::Migration
  def self.up
    create_table :messagerelations do |t|
      t.integer :message_id, :presence => true
      t.integer :from_id, :presence => true
      t.integer :to_id, :presence => true
      t.boolean :read, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :messagerelations
  end
end
