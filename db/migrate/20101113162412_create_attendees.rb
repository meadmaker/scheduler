class CreateAttendees < ActiveRecord::Migration
  def self.up
    create_table :attendees do |t|
      t.integer :person_id
      t.integer :slot_id
      t.string :type

      t.timestamps
    end
  end

  def self.down
    drop_table :attendees
  end
end
