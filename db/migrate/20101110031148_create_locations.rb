class CreateLocations < ActiveRecord::Migration
  def self.up
    drop_table :locations if Location.table_exists?
    create_table :locations do |t|
      t.string :name

      t.timestamps
    end
    
    add_index :locations, :name, :unique => true
  end

  def self.down
    drop_table :locations
  end
end
