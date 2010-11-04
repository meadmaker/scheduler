class CreatePresentations < ActiveRecord::Migration
  def self.up
    create_table :presentations do |t|
      t.string :name
      t.string :description
      t.datetime :start
      t.datetime :stop
      t.integer :event_id
      t.integer :location_id

      t.timestamps
    end
  end

  def self.down
    drop_table :presentations
  end
end
