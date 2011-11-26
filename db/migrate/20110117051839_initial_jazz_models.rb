class InitialJazzModels < ActiveRecord::Migration
  def change
    create_table :keys do |t|
      t.string :name
      t.string :long_name
      t.boolean :primary, :default => true
      t.integer :index
      t.integer :letter_index
      t.integer :cycle_index
    end

    add_index :keys, :name, :unique => true
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
      t.text :information
    end

    add_index :modes, :scale_id
    add_index :modes, :mode
    add_index :modes, :cached_slug, :unique => true
    
    create_table :chord_scales do |t|
      t.references :chord
      t.references :mode
      t.integer :offset, :default => 0, :null => false
      t.integer :strength, :default => 1
      t.text :information
    end

    add_index :chord_scales, :chord_id
    add_index :chord_scales, :mode_id
    
    create_table :voicings do |t|
      t.references :chord
      t.integer :parent_id
      t.string :name
      t.string :cached_slug
      t.integer :octave_offset, :default => 0
      t.text :information
    end

    add_index :voicings, :chord_id
    add_index :voicings, :cached_slug, :unique => true
    
    create_table :voicing_tones do |t|
      t.references :voicing
      t.integer :position
      t.integer :tone
      t.integer :letter_index
      t.integer :strength
      t.boolean :omitable, :default => false
      t.text :information
    end

    add_index :voicing_tones, :voicing_id
    
    create_table :forms do |t|
      t.string :name
      t.string :cached_slug
      t.timestamps
    end

    add_index :forms, :cached_slug, :unique => true
    
    create_table :tunes do |t|
      t.string :name
      t.string :alternate_name
      t.string :cached_slug
      t.integer :based_on_progression_id
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
    
    create_table :tune_progressions do |t|
      t.references :tune
      t.references :progression
      t.string :comment
      t.integer :start_measure
      t.integer :end_measure
      t.timestamps
    end
    
    add_index :tune_progressions, :tune_id
    add_index :tune_progressions, :progression_id
    
    create_table :tune_concepts do |t|
      t.references :tune
      t.references :concept
      t.string :comment
      t.integer :start_measure
      t.integer :end_measure
      t.timestamps
    end
    
    add_index :tune_concepts, :tune_id
    add_index :tune_concepts, :concept_id
    
    create_table :vehicles do |t|
      t.string :name
      t.string :cached_slug
      t.integer :parent_id
      t.timestamps
    end
    
    add_index :vehicles, :parent_id
    add_index :vehicles, :cached_slug, :unique => true
    
    create_table :meters do |t|
      t.string :name
      t.string :cached_slug
      t.integer :beats
      t.integer :division
      t.timestamps
    end

    add_index :meters, :cached_slug, :unique => true
    
    create_table :progressions do |t|
      t.string :name
      t.string :cached_slug
      t.integer :bars
      t.boolean :full_tune, :default => false
      t.integer :meter_id
      t.integer :form_id
      t.string :summary
      t.text :information
      t.timestamps
    end

    add_index :progressions, :meter_id
    add_index :progressions, :cached_slug, :unique => true
    
    create_table :progression_components do |t|
      t.integer :progression_id
      t.integer :position
      t.integer :chord_id
      t.integer :index
      t.string :comment
      t.timestamps
    end

    add_index :progression_components, :progression_id
    add_index :progression_components, :position
    add_index :progression_components, :chord_id
    
    create_table :concepts do |t|
      t.string :name
      t.string :cached_slug
      t.text :about
      t.timestamps
    end

    add_index :concepts, :cached_slug, :unique => true
  end
end
