class CreateMusicians < ActiveRecord::Migration
  def self.up
    create_table :musicians do |t|
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.string :cached_slug
      t.date :born_on
      t.date :died_on
      t.integer :prominence
      t.integer :instrument_id
      t.text :biography
      t.timestamps
    end

    add_index :musicians, :instrument_id
    add_index :musicians, :cached_slug, :unique => true
  end

  def self.down
    drop_table :musicians
  end
end
