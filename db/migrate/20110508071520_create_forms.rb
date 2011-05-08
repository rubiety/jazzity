class CreateForms < ActiveRecord::Migration
  def self.up
    create_table :forms do |t|
      t.string :name
      t.string :cached_slug
      t.timestamps
    end

    add_index :forms, :cached_slug, :unique => true
  end

  def self.down
    drop_table :forms
  end
end
