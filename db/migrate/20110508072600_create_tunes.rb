class CreateTunes < ActiveRecord::Migration
  def self.up
    create_table :tunes do |t|
      t.string :name
      t.string :alternate_name
      t.string :cached_slug
      t.integer :vehicle_id
      t.integer :meter_id
      t.integer :primary_key_id
      t.integer :secondary_key_id
      t.string :tonality, :default => "Major"  # OR: Minor
      t.string :concept, :default => "Instrumental"  # OR: Vocal
      t.integer :form_id
      t.integer :form_length
      t.string :form_lengths
      t.integer :starting_chord_id
      t.integer :ending_chord_id
      t.integer :contrafact_of_tune_id
      t.integer :tempo
      t.integer :aebersold_playalong_number
      t.timestamps
    end

    add_index :tunes, :cached_slug, :unique => true
    add_index :tunes, :vehicle_id
    add_index :tunes, :meter_id
    add_index :tunes, :primary_key_id
    add_index :tunes, :secondary_key_id
    add_index :tunes, :form_id
    add_index :tunes, :aebersold_playalong_number
  end

  def self.down
    drop_table :tunes
  end
end
