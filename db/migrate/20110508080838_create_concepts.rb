class CreateConcepts < ActiveRecord::Migration
  def self.up
    create_table :concepts do |t|
      t.string :name
      t.string :cached_slug
      t.text :about
      t.timestamps
    end

    add_index :concepts, :cached_slug, :unique => true
  end

  def self.down
    drop_table :concepts
  end
end
