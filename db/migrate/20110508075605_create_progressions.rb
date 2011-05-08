class CreateProgressions < ActiveRecord::Migration
  def self.up
    create_table :progressions do |t|
      t.string :name
      t.string :cached_slug
      t.integer :bars
      t.boolean :full_tune, :default => false
      t.integer :meter_id
      t.integer :form_id
      t.timestamps
    end

    add_index :progressions, :meter_id
    add_index :progressions, :cached_slug, :unique => true
  end

  def self.down
    drop_table :progressions
  end
end
