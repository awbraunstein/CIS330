class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.string :subject, :null => false
      t.text :body, :null => false
      t.int :from_id, :null=> false
      t.int :to_id, null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
