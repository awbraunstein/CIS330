class DropMessagesFromTo < ActiveRecord::Migration
  def self.up
    remove_column :messages, :from_id
    remove_column :messages, :to_id
  end

  def self.down
    add_column :messages, :from_id, :integer
    add_column :messages, :to_id, :integer
  end
end
