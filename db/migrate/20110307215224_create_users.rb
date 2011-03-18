class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username, :presence => true, :uniqueness => true
      t.string :firstname, :presence => true
      t.string :lastname, :presence => true
      t.string :email, :presence => true, :uniqueness => true
      t.integer :privacy, :presence => true
      t.string :webpage
      t.integer :time_zone
      t.text :bio
      t.string :location
      t.string :language

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
