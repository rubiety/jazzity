class CreateMeters < ActiveRecord::Migration
  def self.up
    create_table :meters do |t|
      t.string :name
      t.string :cached_slug
      t.integer :beats
      t.integer :division
      t.timestamps
    end

    add_index :meters, :cached_slug, :unique => true
  end

  def self.down
    drop_table :meters
  end
end
