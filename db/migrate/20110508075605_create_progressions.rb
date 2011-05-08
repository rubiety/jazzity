class CreateProgressions < ActiveRecord::Migration
  def self.up
    create_table :progressions do |t|
      t.string :name
      t.integer :bars
      t.boolean :full_tune, :default => false
      t.integer :meter_id
      t.integer :form_id
      t.timestamps
    end

    add_index :progressions, :meter_id
  end

  def self.down
    drop_table :progressions
  end
end
