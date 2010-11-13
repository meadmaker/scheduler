class CreateSlots < ActiveRecord::Migration
  def self.up
    create_table :slots do |t|
      t.datetime :start
      t.datetime :stop
      t.integer :location_id
      t.integer :presentation_id

      t.timestamps
    end
  end

  def self.down
    drop_table :slots
  end
end
