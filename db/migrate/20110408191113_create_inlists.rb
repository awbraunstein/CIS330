class CreateInlists < ActiveRecord::Migration
  def self.up
    create_table :inlists do |t|
      t.integer :list_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :inlists
  end
end
