class CreateMessagerelations < ActiveRecord::Migration
  def self.up
    create_table :messagerelations do |t|
      t.integer :from_id
      t.integer :to_id
      t.boolean :read

      t.timestamps
    end
  end

  def self.down
    drop_table :messagerelations
  end
end
