class CreateSlugs < ActiveRecord::Migration
  TABLES = [
    :chord_qualities, :chords, :concepts, :forms, :instruments, :meters, :modes,
    :musicians, :progressions, :scales, :tunes, :vehicles, :voicings
  ]
  
  def change
    TABLES.each do |table|
      add_column table, :slug, :string
      add_index table, :slug, :unique => true
    end
  end
end
