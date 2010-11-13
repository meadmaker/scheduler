class CreateCategoriesPresentations < ActiveRecord::Migration
  def self.up
    create_table :categories_presentations, :id => false do |t|
      t.integer :category_id
      t.integer :presentation_id
    end
  end

  def self.down
    drop_table :categories_presentations
  end
end
