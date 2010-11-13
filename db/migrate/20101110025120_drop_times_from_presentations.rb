class DropTimesFromPresentations < ActiveRecord::Migration
  def self.up
    remove_column :presentations, :start, :stop, :location_id
  end

  def self.down
    add_column :presentations, :start, :datetime
    add_column :presentations, :stop, :datetime
    add_column :presentations, :location_id, :integer
  end
end
