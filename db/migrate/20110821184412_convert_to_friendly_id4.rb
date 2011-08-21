class ConvertToFriendlyId4 < ActiveRecord::Migration
  def up
    rename_column :chord_qualities, :cached_slug, :slug
    rename_column :chords, :cached_slug, :slug
    rename_column :concepts, :cached_slug, :slug
    rename_column :forms, :cached_slug, :slug
    rename_column :instruments, :cached_slug, :slug
    rename_column :meters, :cached_slug, :slug
    rename_column :modes, :cached_slug, :slug
    rename_column :musicians, :cached_slug, :slug
    rename_column :progressions, :cached_slug, :slug
    rename_column :scales, :cached_slug, :slug
    rename_column :tunes, :cached_slug, :slug
    rename_column :vehicles, :cached_slug, :slug
    rename_column :voicings, :cached_slug, :slug
    
    drop_table :slugs
  end

  def down
    rename_column :chord_qualities, :slug, :cached_slug
    rename_column :chords, :slug, :cached_slug
    rename_column :concepts, :slug, :cached_slug
    rename_column :forms, :slug, :cached_slug
    rename_column :instruments, :slug, :cached_slug
    rename_column :meters, :slug, :cached_slug
    rename_column :modes, :slug, :cached_slug
    rename_column :musicians, :slug, :cached_slug
    rename_column :progressions, :slug, :cached_slug
    rename_column :scales, :slug, :cached_slug
    rename_column :tunes, :slug, :cached_slug
    rename_column :vehicles, :slug, :cached_slug
    rename_column :voicings, :slug, :cached_slug
    
    create_table "slugs", :force => true do |t|
      t.string   "name"
      t.integer  "sluggable_id"
      t.integer  "sequence",                     :default => 1, :null => false
      t.string   "sluggable_type", :limit => 40
      t.string   "scope"
      t.datetime "created_at"
    end

    add_index "slugs", ["name", "sluggable_type", "sequence", "scope"], :name => "index_slugs_on_n_s_s_and_s", :unique => true
    add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"
  end
end
