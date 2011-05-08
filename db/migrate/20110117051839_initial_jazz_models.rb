class InitialJazzModels < ActiveRecord::Migration
  def self.up
    create_table :keys do |t|
      t.string :name
      t.string :cached_slug
      t.string :long_name
      t.boolean :primary, :default => true
      t.integer :index
      t.integer :letter_index
      t.integer :cycle_index
    end

    add_index :keys, :name, :unique => true
    add_index :keys, :cached_slug, :unique => true
    add_index :keys, :letter_index
    add_index :keys, :cycle_index
    
    create_table :chord_qualities do |t|
      t.string :name
      t.string :code
      t.string :cached_slug
    end

    add_index :chord_qualities, :cached_slug, :unique => true
    
    create_table :chords do |t|
      t.references :chord_quality
      t.integer :parent_id
      t.string :name
      t.string :cached_slug
      t.text :synonyms
      t.text :information
    end

    add_index :chords, :chord_quality_id
    add_index :chords, :parent_id
    add_index :chords, :cached_slug, :unique => true
    
    create_table :chord_symbols do |t|
      t.references :chord
      t.string :name
      t.boolean :case_sensitive, :default => false
      t.integer :strength
      t.boolean :primary, :default => false
    end

    add_index :chord_symbols, :chord_id
    add_index :chord_symbols, :name
    
    create_table :chord_tones do |t|
      t.references :chord
      t.integer :position
      t.integer :tone
      t.integer :letter_index
      t.integer :strength
      t.boolean :omitable, :default => false
      t.text :information
    end

    add_index :chord_tones, :chord_id
    
    create_table :scales do |t|
      t.string :name
      t.string :cached_slug
      t.string :information
      t.integer :symmetry_index
    end

    add_index :scales, :cached_slug, :unique => true
    
    create_table :scale_tones do |t|
      t.references :scale
      t.integer :position
      t.integer :tone
      t.integer :letter_index
    end
    
    create_table :modes do |t|
      t.references :scale
      t.integer :mode
      t.string :name
      t.string :cached_slug
      t.text :synonyms
      t.integer :dissonance
    end

    add_index :modes, :scale_id
    add_index :modes, :mode
    add_index :modes, :cached_slug, :unique => true
    
    create_table :chord_scales do |t|
      t.references :chord
      t.references :mode
      t.integer :strength
      t.text :information
    end

    add_index :chord_scales, :chord_id
    add_index :chord_scales, :mode_id
    
    create_table :voicings do |t|
      t.references :chord
      t.string :name
      t.string :cached_slug
      t.text :information
    end

    add_index :voicings, :chord_id
    add_index :voicings, :cached_slug, :unique => true
    
    create_table :voicing_tones do |t|
      t.references :voicing
      t.integer :position
      t.integer :tone
      t.integer :tone_reference_offset, :default => 0
      t.text :information
    end

    add_index :voicing_tones, :voicing_id
  end

  def self.down
    drop_table :voicing_tones
    drop_table :voicings
    drop_table :chord_scales
    drop_table :modes
    drop_table :scale_tones
    drop_table :scales
    drop_table :chord_tones
    drop_table :chord_symbols
    drop_table :chords
    drop_table :chord_qualities
    drop_table :keys
  end
end
