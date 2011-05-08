# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)


### CLEAR EXISTING JAZZ MODEL TABLE ###
%w(
  meters
  forms
  vehicles
  tunes
  instruments
  musicians
  progressions
  progression_components
  concepts
  chord_qualities
  chord_scales
  chord_symbols
  chord_tones
  chords
  keys
  modes
  scale_tones
  scales
  voicing_tones
  voicings
).each do |table|
  ActiveRecord::Base.connection.execute "TRUNCATE TABLE `#{table}`"
end


### Meters ###

Meter.create!(:name => "2/4", :beats => 2, :division => 4)
Meter.create!(:name => "4/4", :beats => 4, :division => 4)
Meter.create!(:name => "3/4", :beats => 3, :division => 4)
Meter.create!(:name => "6/8", :beats => 6, :division => 8)
Meter.create!(:name => "7/8", :beats => 7, :division => 8)

### FORMS ###

Form.create!(:name => "A-A-B-A")
Form.create!(:name => "A-A-B")
Form.create!(:name => "A-B-A-C")
Form.create!(:name => "A-B-C")
Form.create!(:name => "A-B-A")
Form.create!(:name => "A-B")
Form.create!(:name => "A-B-C-D")
Form.create!(:name => "A-B-A-B")

### VEHICLES ###

Vehicle.create!(:name => "Standard")
Vehicle.create!(:name => "Bebop")
Vehicle.create!(:name => "Swing")
Vehicle.create!(:name => "Bossa")
Vehicle.create!(:name => "Waltz")
Vehicle.create!(:name => "Dixieland")
Vehicle.create!(:name => "Ballad")

### TUNES ###

# TODO
#

### INSTRUMENTS ###

Instrument.create!(:name => "Piano")
Instrument.create!(:name => "Bass")
Instrument.create!(:name => "Drums")
Instrument.create!(:name => "Saxophone")
Instrument.create!(:name => "Trumpet")
Instrument.create!(:name => "Trombone")

### MUSICIANS ###

# TODO
# 

### PROGRESSIONS ###

Progression.create!(:name => "Blues", :bars => 12, :full_tune => true, :form => Form['A-B-C'])
Progression.create!(:name => "Rhythm Changes", :bars => 32, :full_tune => true, :form => Form['A-A-B-A'])

### CONCEPTS ###

Concept.create!(:name => "Drop-2", :about => "Test")
Concept.create!(:name => "Tri-Tone Substitution", :about => "Test")

### KEYS ###

Key.create!(:name => 'C', :long_name => 'C', :index => 0, :letter_index => 0, :cycle_index => 0)
Key.create!(:name => 'B#', :long_name => 'B Sharp', :index => 0, :letter_index => 6, :cycle_index => 0, :primary => false)
Key.create!(:name => 'Dbb', :long_name => 'D Double-Flat', :index => 0, :letter_index => 1, :cycle_index => 0, :primary => false)

Key.create!(:name => 'F', :long_name => 'F', :index => 5, :letter_index => 3, :cycle_index => 1)
Key.create!(:name => 'E#', :long_name => 'E Sharp', :index => 5, :letter_index => 2, :cycle_index => 1, :primary => false)
Key.create!(:name => 'Gbb', :long_name => 'G Double-Flat', :index => 5, :letter_index => 4, :cycle_index => 1, :primary => false)

Key.create!(:name => 'Bb', :long_name => 'B Flat', :index => 10, :letter_index => 6, :cycle_index => 2)
Key.create!(:name => 'A#', :long_name => 'A Sharp', :index => 10, :letter_index => 5, :cycle_index => 2, :primary => false)
Key.create!(:name => 'Cbb', :long_name => 'C Double-Flat', :index => 10, :letter_index => 0, :cycle_index => 2, :primary => false)

Key.create!(:name => 'Eb', :long_name => 'E Flat', :index => 3, :letter_index => 2, :cycle_index => 3)
Key.create!(:name => 'D#', :long_name => 'D Sharp', :index => 3, :letter_index => 1, :cycle_index => 3, :primary => false)
Key.create!(:name => 'Fbb', :long_name => 'F Double Flat', :index => 3, :letter_index => 3, :cycle_index => 3, :primary => false)

Key.create!(:name => 'Ab', :long_name => 'A Flat', :index => 8, :letter_index => 5, :cycle_index => 4)
Key.create!(:name => 'G#', :long_name => 'G Sharp', :index => 8, :letter_index => 4, :cycle_index => 4, :primary => false)

Key.create!(:name => 'Db', :long_name => 'D Flat', :index => 1, :letter_index => 1, :cycle_index => 5)
Key.create!(:name => 'C#', :long_name => 'C Sharp', :index => 1, :letter_index => 0, :cycle_index => 5, :primary => false)
Key.create!(:name => 'B##', :long_name => 'B Double-Sharp', :index => 1, :letter_index => 6, :cycle_index => 5, :primary => false)

Key.create!(:name => 'Gb', :long_name => 'G Flat', :index => 6, :letter_index => 4, :cycle_index => 6)
Key.create!(:name => 'F#', :long_name => 'F Sharp', :index => 6, :letter_index => 3, :cycle_index => 6, :primary => false)
Key.create!(:name => 'E##', :long_name => 'E Double-Sharp', :index => 6, :letter_index => 2, :cycle_index => 6, :primary => false)   

Key.create!(:name => 'B', :long_name => 'B', :index => 11, :letter_index => 6, :cycle_index => 7)
Key.create!(:name => 'Cb', :long_name => 'C Flat', :index => 11, :letter_index => 0, :cycle_index => 7, :primary => false)
Key.create!(:name => 'A##', :long_name => 'A Double-Sharp', :index => 11, :letter_index => 5, :cycle_index => 7, :primary => false)

Key.create!(:name => 'E', :long_name => 'E', :index => 4, :letter_index => 2, :cycle_index => 8)
Key.create!(:name => 'Fb', :long_name => 'F Flat', :index => 4, :letter_index => 3, :cycle_index => 8, :primary => false)
Key.create!(:name => 'D##', :long_name => 'D Double-Sharp', :index => 4, :letter_index => 1, :cycle_index => 8, :primary => false)

Key.create!(:name => 'A', :long_name => 'A', :index => 9, :letter_index => 5, :cycle_index => 9)
Key.create!(:name => 'Bbb', :long_name => 'B Double-Flat', :index => 9, :letter_index => 6, :cycle_index => 9, :primary => false)
Key.create!(:name => 'G##', :long_name => 'G Double-Sharp', :index => 9, :letter_index => 4, :cycle_index => 9, :primary => false)   

Key.create!(:name => 'D', :long_name => 'D', :index => 2, :letter_index => 1, :cycle_index => 10)
Key.create!(:name => 'C##', :long_name => 'C Double-Sharp', :index => 2, :letter_index => 0, :cycle_index => 10, :primary => false)
Key.create!(:name => 'Ebb', :long_name => 'E Double-Flat', :index => 2, :letter_index => 2, :cycle_index => 10, :primary => false)

Key.create!(:name => 'G', :long_name => 'G', :index => 7, :letter_index => 4, :cycle_index => 11)
Key.create!(:name => 'F##', :long_name => 'F Double-Sharp', :index => 7, :letter_index => 3, :cycle_index => 11, :primary => false)
Key.create!(:name => 'Abb', :long_name => 'A Double-Flat', :index => 7, :letter_index => 5, :cycle_index => 11, :primary => false)



Scale.create!(:name => 'Major').tap do |s|
  s.tones.create([
    {:tone => 0, :letter_index => Tone::LetterInterval::FIRST},
    {:tone => 2, :letter_index => Tone::LetterInterval::SECOND},
    {:tone => 4, :letter_index => Tone::LetterInterval::THIRD},
    {:tone => 5, :letter_index => Tone::LetterInterval::FOURTH},
    {:tone => 7, :letter_index => Tone::LetterInterval::FIFTH},
    {:tone => 9, :letter_index => Tone::LetterInterval::SIXTH},
    {:tone => 11, :letter_index => Tone::LetterInterval::SEVENTH}
  ])
  
  s.modes.create!(:mode => 1, :name => 'Ionian')
  s.modes.create!(:mode => 2, :name => 'Dorian')
  s.modes.create!(:mode => 3, :name => 'Phrygian')
  s.modes.create!(:mode => 4, :name => 'Lydian')
  s.modes.create!(:mode => 5, :name => 'Mixolydian')
  s.modes.create!(:name => 6, :name => 'Aeolian')
  s.modes.create!(:name => 7, :name => 'Locrian')
end

Scale.create!(:name => 'Melodic Minor').tap do |s|
  s.tones.create([
    {:tone => 0, :letter_index => Tone::LetterInterval::FIRST},
    {:tone => 2, :letter_index => Tone::LetterInterval::SECOND},
    {:tone => 3, :letter_index => Tone::LetterInterval::THIRD},
    {:tone => 5, :letter_index => Tone::LetterInterval::FOURTH},
    {:tone => 7, :letter_index => Tone::LetterInterval::FIFTH},
    {:tone => 9, :letter_index => Tone::LetterInterval::SIXTH},
    {:tone => 11, :letter_index => Tone::LetterInterval::SEVENTH}
  ])

  s.modes.create!(:mode => 1, :name => 'Melodic Minor')
  s.modes.create!(:mode => 2, :name => 'Phrygian #6', :synonyms => 'Dorian b2')
  s.modes.create!(:mode => 3, :name => 'Lydian Augmented')
  s.modes.create!(:mode => 4, :name => 'Lydian Dominant', :synonyms => 'Mixolydian #4')
  s.modes.create!(:mode => 5, :name => 'Mixolydian b6')
  s.modes.create!(:name => 6, :name => 'Locrian #2', :synonyms => 'Aeolian b5')
  s.modes.create!(:name => 7, :name => 'Super Locrian', :synonyms => 'Diminished Whole Tone')
end

Scale.create!(:name => 'Whole Tone', :symmetry_index => 2).tap do |s|
  s.tones.create([
    {:tone => 0, :letter_index => Tone::LetterInterval::FIRST},
    {:tone => 2, :letter_index => Tone::LetterInterval::SECOND},
    {:tone => 4, :letter_index => Tone::LetterInterval::THIRD},
    {:tone => 6, :letter_index => Tone::LetterInterval::FOURTH},
    {:tone => 8, :letter_index => Tone::LetterInterval::FIFTH},
    {:tone => 10, :letter_index => Tone::LetterInterval::SEVENTH}
  ])

  s.modes.create!(:mode => 1, :name => 'Whole Tone')
end

Scale.create!(:name => 'Pentatonic').tap do |s|
  s.tones.create([
    {:tone => 0, :letter_index => Tone::LetterInterval::FIRST},
    {:tone => 2, :letter_index => Tone::LetterInterval::SECOND},
    {:tone => 4, :letter_index => Tone::LetterInterval::THIRD},
    {:tone => 7, :letter_index => Tone::LetterInterval::FIFTH},
    {:tone => 9, :letter_index => Tone::LetterInterval::SIXTH}
  ])

  s.modes.create!(:mode => 1, :name => 'Pentatonic')
end

Scale.create!(:name => 'Blues').tap do |s|
  s.tones.create([
    {:tone => 0, :letter_index => Tone::LetterInterval::FIRST},
    {:tone => 2, :letter_index => Tone::LetterInterval::SECOND},
    {:tone => 3, :letter_index => Tone::LetterInterval::THIRD},
    {:tone => 4, :letter_index => Tone::LetterInterval::THIRD},
    {:tone => 7, :letter_index => Tone::LetterInterval::FIFTH}, 
    {:tone => 9, :letter_index => Tone::LetterInterval::SIXTH}
  ])

  s.modes.create!(:mode => 1, :name => 'Major Blues')
  s.modes.create!(:mode => 5, :name => 'Minor Blues')
end

Scale.create!(:name => 'Diminished', :symmetry_index => 3).tap do |s|
  s.tones.create([
    {:tone => 0, :letter_index => Tone::LetterInterval::FIRST},
    {:tone => 1, :letter_index => Tone::LetterInterval::SECOND},
    {:tone => 3, :letter_index => Tone::LetterInterval::THIRD},
    {:tone => 4, :letter_index => Tone::LetterInterval::THIRD},
    {:tone => 6, :letter_index => Tone::LetterInterval::FOURTH},
    {:tone => 7, :letter_index => Tone::LetterInterval::FIFTH},
    {:tone => 9, :letter_index => Tone::LetterInterval::SIXTH},
    {:tone => 10, :letter_index => Tone::LetterInterval::SEVENTH}
  ])

  s.modes.create!(:mode => 1, :name => 'Half-Whole')
  s.modes.create!(:mode => 2, :name => 'Whole-Half')
end

Scale.create!(:name => 'Harmonic Minor').tap do |s|
  s.tones.create([
    {:tone => 0, :letter_index => Tone::LetterInterval::FIRST},
    {:tone => 2, :letter_index => Tone::LetterInterval::SECOND},
    {:tone => 3, :letter_index => Tone::LetterInterval::THIRD},
    {:tone => 5, :letter_index => Tone::LetterInterval::FOURTH},
    {:tone => 7, :letter_index => Tone::LetterInterval::FIFTH},
    {:tone => 8, :letter_index => Tone::LetterInterval::SIXTH},
    {:tone => 11, :letter_index => Tone::LetterInterval::SEVENTH}
  ])
end

Scale.create!(:name => 'Bebop').tap do |s|
  s.tones.create([
    {:tone => 0, :letter_index => Tone::LetterInterval::FIRST},
    {:tone => 2, :letter_index => Tone::LetterInterval::SECOND},
    {:tone => 4, :letter_index => Tone::LetterInterval::THIRD},
    {:tone => 5, :letter_index => Tone::LetterInterval::FOURTH},
    {:tone => 7, :letter_index => Tone::LetterInterval::FIFTH},
    {:tone => 9, :letter_index => Tone::LetterInterval::SIXTH},
    {:tone => 10, :letter_index => Tone::LetterInterval::SEVENTH},
    {:tone => 11, :letter_index => Tone::LetterInterval::SEVENTH}
  ])

  s.modes.create!(:mode => 1, :name => 'Dominant Bebop')
  s.modes.create!(:mode => 2, :name => 'Major Bebop')
end


##### Initialize Chords #####

ChordQuality.create!(:name => 'Major', :code => 'MAJ').tap do |q|
  q.chords.create!(:name => 'Major Triad').tap do |c|
    c.symbols.create!(:name => 'maj', :primary => true)
    c.symbols.create!(:name => 'M', :case_sensitive => true)
    c.symbols.create!(:name => 'major')

    c.tones.create([
      {:tone => Tone::Interval::ROOT, :letter_index => Tone::LetterInterval::FIRST, :strength => 0},
      {:tone => Tone::Interval::MAJOR_3RD, :letter_index => Tone::LetterInterval::THIRD, :strength => 2},
      {:tone => Tone::Interval::PERFECT_5TH, :letter_index => Tone::LetterInterval::FIFTH, :strength => 1}
    ])

    c.chord_scales << ChordScale.specify(Scale['Major'][1])
  end

  q.chords.create!(:name => 'Major 7').tap do |c|
    c.symbols.create!(:name => 'maj7', :primary => true)
    c.symbols.create!(:name => 'M7', :case_sensitive => true)
    c.symbols.create!(:name => 'major7')

    c.tones.create([
      {:tone => Tone::Interval::ROOT, :letter_index => Tone::LetterInterval::FIRST, :strength => 0, :omitable => true},
      {:tone => Tone::Interval::MAJOR_3RD, :letter_index => Tone::LetterInterval::THIRD, :strength => 1},
      {:tone => Tone::Interval::PERFECT_5TH, :letter_index => Tone::LetterInterval::FIFTH, :strength => 2, :omitable => true},
      {:tone => Tone::Interval::MAJOR_7TH, :letter_index => Tone::LetterInterval::SEVENTH, :strength => 2}
    ])

    c.children.create!(:name => 'Major 7 #11').tap do |cc|
      cc.symbols.create!(:name => 'maj7#11', :primary => true)
      cc.symbols.create!(:name => 'M7#11')
      cc.symbols.create!(:name => 'major7#11')
      cc.symbols.create!(:name => 'lyd')
      cc.symbols.create!(:name => 'lydian')

      cc.tones.create([
        {:tone => Tone::Interval::ROOT, :letter_index => Tone::LetterInterval::FIRST, :strength => 0, :omitable => true},
        {:tone => Tone::Interval::MAJOR_3RD, :letter_index => Tone::LetterInterval::THIRD, :strength => 1},
        {:tone => Tone::Interval::PERFECT_5TH, :letter_index => Tone::LetterInterval::FIFTH, :strength => 2, :omitable => true},
        {:tone => Tone::Interval::MAJOR_7TH, :letter_index => Tone::LetterInterval::SEVENTH, :strength => 2},
        {:tone => Tone::Interval::AUGMENTED_4TH, :letter_index => Tone::LetterInterval::FOURTH, :strength => 3}
      ])

      cc.chord_scales << ChordScale.specify(Scale['Major'][4])
    end

    c.children.create!(:name => 'Lydian Augmented').tap do |cc|
      cc.symbols.create!(:name => 'maj7#4#5', :primary => true)
      cc.symbols.create!(:name => 'lydaug')
      cc.symbols.create!(:name => 'maj7#11#5')

      cc.tones.create([
        {:tone => Tone::Interval::ROOT, :letter_index => Tone::LetterInterval::FIRST, :strength => 0, :omitable => true},
        {:tone => Tone::Interval::MAJOR_3RD, :letter_index => Tone::LetterInterval::THIRD, :strength => 1},
        {:tone => Tone::Interval::AUGMENTED_5TH, :letter_index => Tone::LetterInterval::FIFTH, :strength => 2, :omitable => true},
        {:tone => Tone::Interval::MAJOR_7TH, :letter_index => Tone::LetterInterval::SEVENTH, :strength => 2},
        {:tone => Tone::Interval::AUGMENTED_4TH, :letter_index => Tone::LetterInterval::FOURTH, :strength => 3}
      ])

      cc.chord_scales << ChordScale.specify(Scale['Melodic Minor'][3])
    end

    c.chord_scales << ChordScale.specify(Scale['Major'][1])
  end

  q.chords.create!(:name => 'Major 6').tap do |c|
    c.symbols.create!(:name => '6', :primary => true)
    c.symbols.create!(:name => 'maj6')
    c.symbols.create!(:name => 'M6', :case_sensitive => true)
    c.symbols.create!(:name => 'major6')

    c.tones.create([
      {:tone => Tone::Interval::ROOT, :letter_index => Tone::LetterInterval::FIRST, :strength => 0},
      {:tone => Tone::Interval::MAJOR_3RD, :letter_index => Tone::LetterInterval::THIRD, :strength => 1},
      {:tone => Tone::Interval::PERFECT_5TH, :letter_index => Tone::LetterInterval::FIFTH, :strength => 2},
      {:tone => Tone::Interval::MAJOR_6TH, :letter_index => Tone::LetterInterval::SIXTH, :strength => 3}
    ])

    c.chord_scales << ChordScale.specify(Scale['Pentatonic'][1])
    c.chord_scales << ChordScale.specify(Scale['Major'][1], 2)
  end
end


ChordQuality.create!(:name => 'Minor', :code => 'MIN').tap do |q|
  q.chords.create!(:name => 'Minor Triad').tap do |c|
    c.symbols.create!(:name => 'min', :primary => true)
    c.symbols.create!(:name => 'm', :case_sensitive => true)
    c.symbols.create!(:name => 'minor')

    c.tones.create([
      {:tone => Tone::Interval::ROOT, :letter_index => Tone::LetterInterval::FIRST, :strength => 0},
      {:tone => Tone::Interval::MINOR_3RD, :letter_index => Tone::LetterInterval::THIRD, :strength => 1},
      {:tone => Tone::Interval::PERFECT_5TH, :letter_index => Tone::LetterInterval::FIFTH, :strength => 2}
    ])

    c.chord_scales << ChordScale.specify(Scale['Major'][2])
    c.chord_scales << ChordScale.specify(Scale['Major'][6], 2)
    c.chord_scales << ChordScale.specify(Scale['Major'][3], 3)
  end

  q.chords.create!(:name => 'Minor 7').tap do |c|
    c.symbols.create!(:name => 'min7', :primary => true)
    c.symbols.create!(:name => 'm7', :case_sensitive => true)
    c.symbols.create!(:name => 'minor7')

    c.tones.create([
      {:tone => Tone::Interval::ROOT, :letter_index => Tone::LetterInterval::FIRST, :strength => 0, :omitable => true},
      {:tone => Tone::Interval::MINOR_3RD, :letter_index => Tone::LetterInterval::THIRD, :strength => 1},
      {:tone => Tone::Interval::PERFECT_5TH, :letter_index => Tone::LetterInterval::FIFTH, :strength => 2, :omitable => true},
      {:tone => Tone::Interval::MINOR_7TH, :letter_index => Tone::LetterInterval::SEVENTH, :strength => 1}
    ])

    c.chord_scales << ChordScale.specify(Scale['Major'][2])
    c.chord_scales << ChordScale.specify(Scale['Major'][6], 2)
  end

  q.chords.create!(:name => 'Minor 6').tap do |c|
    c.symbols.create!(:name => 'min6', :primary => true)
    c.symbols.create!(:name => 'm6', :case_sensitive => true)
    c.symbols.create!(:name => 'minor6')

    c.tones.create([
      {:tone => Tone::Interval::ROOT, :letter_index => Tone::LetterInterval::FIRST, :strength => 0, :omitable => true},
      {:tone => Tone::Interval::MINOR_3RD, :letter_index => Tone::LetterInterval::THIRD, :strength => 1},
      {:tone => Tone::Interval::PERFECT_5TH, :letter_index => Tone::LetterInterval::FIFTH, :strength => 2},
      {:tone => Tone::Interval::MAJOR_6TH, :letter_index => Tone::LetterInterval::SIXTH, :strength => 1}
    ])

    c.chord_scales << ChordScale.specify(Scale['Major'][1])
  end

  q.chords.create!(:name => 'Phrygian').tap do |c|
    c.symbols.create!(:name => 'phryg', :primary => true)
    c.symbols.create!(:name => 'minb2')
    c.symbols.create!(:name => 'mb2')
    c.symbols.create!(:name => 'minorb2')
    c.symbols.create!(:name => 'phrygian')
    c.symbols.create!(:name => 'susb9')

    c.tones.create([
      {:tone => Tone::Interval::ROOT, :letter_index => Tone::LetterInterval::FIRST, :strength => 0, :omitable => true},
      {:tone => Tone::Interval::MINOR_3RD, :letter_index => Tone::LetterInterval::THIRD, :strength => 1},
      {:tone => Tone::Interval::PERFECT_5TH, :letter_index => Tone::LetterInterval::FIFTH, :strength => 2},
      {:tone => Tone::Interval::MINOR_2ND, :letter_index => Tone::LetterInterval::SECOND, :strength => 1},
      {:tone => Tone::Interval::MINOR_6TH, :letter_index => Tone::LetterInterval::SIXTH, :strength => 3}
    ])

    c.chord_scales << ChordScale.specify(Scale['Major'][3])
  end

  q.chords.create!(:name => 'Minor b6').tap do |c|
    c.symbols.create!(:name => 'minb6', :primary => true)
    c.symbols.create!(:name => 'mb6')
    c.symbols.create!(:name => 'minorb6')
    c.symbols.create!(:name => 'aeolian')

    c.tones.create([
      {:tone => Tone::Interval::ROOT, :letter_index => Tone::LetterInterval::FIRST, :strength => 0, :omitable => true},
      {:tone => Tone::Interval::MINOR_3RD, :letter_index => Tone::LetterInterval::THIRD, :strength => 1},
      {:tone => Tone::Interval::PERFECT_5TH, :letter_index => Tone::LetterInterval::FIFTH, :strength => 2},
      {:tone => Tone::Interval::MINOR_6TH, :letter_index => Tone::LetterInterval::SIXTH, :strength => 3}
    ])

    c.chord_scales << ChordScale.specify(Scale['Major'][6])
  end

  q.chords.create!(:name => 'Major-Minor').tap do |c|
    c.symbols.create!(:name => 'min#7', :primary => true)
    c.symbols.create!(:name => 'majmin')
    c.symbols.create!(:name => 'm#7', :case_sensitive => true)
    c.symbols.create!(:name => 'minor#7')
    c.symbols.create!(:name => 'major-minor')

    c.tones.create([
      {:tone => Tone::Interval::ROOT, :letter_index => Tone::LetterInterval::FIRST, :strength => 0, :omitable => true},
      {:tone => Tone::Interval::MINOR_3RD, :letter_index => Tone::LetterInterval::THIRD, :strength => 1},
      {:tone => Tone::Interval::PERFECT_5TH, :letter_index => Tone::LetterInterval::FIFTH, :strength => 2},
      {:tone => Tone::Interval::MAJOR_7TH, :letter_index => Tone::LetterInterval::SEVENTH, :strength => 1}
    ])

    c.chord_scales << ChordScale.specify(Scale['Melodic Minor'][1])
  end
end


ChordQuality.create!(:name => 'Dominant', :code => 'DOM').tap do |q|
  q.chords.create!(:name => 'Dominant 7').tap do |c|
    c.symbols.create!(:name => '7', :primary => true)
    c.symbols.create!(:name => 'dom')

    c.tones.create([
      {:tone => Tone::Interval::ROOT, :letter_index => Tone::LetterInterval::FIRST, :strength => 0, :omitable => true},
      {:tone => Tone::Interval::MAJOR_3RD, :letter_index => Tone::LetterInterval::THIRD, :strength => 1},
      {:tone => Tone::Interval::PERFECT_5TH, :letter_index => Tone::LetterInterval::FIFTH, :strength => 3, :omitable => true},
      {:tone => Tone::Interval::DOMINANT_7TH, :letter_index => Tone::LetterInterval::SEVENTH, :strength => 2}
    ])

    c.chord_scales << ChordScale.specify(Scale['Major']['Mixolydian'])

    c.children.create!(:name => 'Dominant 9').tap do |cc|
      cc.symbols.create!(:name => '9', :primary => true)
      cc.symbols.create!(:name => 'dom9')

      cc.tones.create([
        {:tone => Tone::Interval::ROOT, :letter_index => Tone::LetterInterval::FIRST, :strength => 0, :omitable => true},
        {:tone => Tone::Interval::MAJOR_3RD, :letter_index => Tone::LetterInterval::THIRD, :strength => 1},
        {:tone => Tone::Interval::PERFECT_5TH, :letter_index => Tone::LetterInterval::FIFTH, :strength => 3, :omitable => true},
        {:tone => Tone::Interval::DOMINANT_7TH, :letter_index => Tone::LetterInterval::SEVENTH, :strength => 2},
        {:tone => Tone::Interval::MAJOR_2ND, :letter_index => Tone::LetterInterval::SECOND, :strength => 4}
      ])

      cc.chord_scales << ChordScale.specify(Scale['Major']['Mixolydian'])
    end

    c.children.create!(:name => 'Dominant 6/9').tap do |cc|
      cc.symbols.create!(:name => '6/9', :primary => true)
      cc.symbols.create!(:name => '69')

      cc.tones.create([
        {:tone => Tone::Interval::ROOT, :letter_index => Tone::LetterInterval::FIRST, :strength => 0, :omitable => true},
        {:tone => Tone::Interval::MAJOR_3RD, :letter_index => Tone::LetterInterval::THIRD, :strength => 1},
        {:tone => Tone::Interval::PERFECT_5TH, :letter_index => Tone::LetterInterval::FIFTH, :strength => 3, :omitable => true},
        {:tone => Tone::Interval::DOMINANT_7TH, :letter_index => Tone::LetterInterval::SEVENTH, :strength => 2},
        {:tone => Tone::Interval::MAJOR_2ND, :letter_index => Tone::LetterInterval::SECOND, :strength => 4},
        {:tone => Tone::Interval::MAJOR_6TH, :letter_index => Tone::LetterInterval::SIXTH, :strength => 4}
      ])

      cc.chord_scales << ChordScale.specify(Scale['Major']['Mixolydian'])
      cc.chord_scales << ChordScale.specify(Scale['Major']['Ionian'])
    end

    c.children.create!(:name => 'Dominant b9').tap do |cc|
      cc.symbols.create!(:name => '7b9', :primary => true)

      cc.tones.create([
        {:tone => Tone::Interval::ROOT, :letter_index => Tone::LetterInterval::FIRST, :strength => 0, :omitable => true},
        {:tone => Tone::Interval::MAJOR_3RD, :letter_index => Tone::LetterInterval::THIRD, :strength => 1},
        {:tone => Tone::Interval::PERFECT_5TH, :letter_index => Tone::LetterInterval::FIFTH, :strength => 3, :omitable => true},
        {:tone => Tone::Interval::DOMINANT_7TH, :letter_index => Tone::LetterInterval::SEVENTH, :strength => 2},
        {:tone => Tone::Interval::MINOR_2ND, :letter_index => Tone::LetterInterval::SECOND, :strength => 4}
      ])

      cc.chord_scales << ChordScale.specify(Scale['Diminished'][1])
      cc.chord_scales << ChordScale.specify(Scale['Major']['Mixolydian'], 2)
    end

    c.children.create!(:name => 'Dominant #9').tap do |cc|
      cc.symbols.create!(:name => '7#9', :primary => true)

      cc.tones.create([
        {:tone => Tone::Interval::ROOT, :letter_index => Tone::LetterInterval::FIRST, :strength => 0, :omitable => true},
        {:tone => Tone::Interval::MAJOR_3RD, :letter_index => Tone::LetterInterval::THIRD, :strength => 1},
        {:tone => Tone::Interval::PERFECT_5TH, :letter_index => Tone::LetterInterval::FIFTH, :strength => 3, :omitable => true},
        {:tone => Tone::Interval::DOMINANT_7TH, :letter_index => Tone::LetterInterval::SEVENTH, :strength => 2},
        {:tone => Tone::Interval::AUGMENTED_2ND, :letter_index => Tone::LetterInterval::SECOND, :strength => 4}
      ])

      cc.chord_scales << ChordScale.specify(Scale['Melodic Minor'][7])
      cc.chord_scales << ChordScale.specify(Scale['Diminished'][1], 2)
    end

    c.children.create!(:name => 'Dominant #11').tap do |cc|
      cc.symbols.create!(:name => '7#11', :primary => true)
      cc.symbols.create!(:name => 'lyd7')
      cc.symbols.create!(:name => 'lydiandom')

      cc.tones.create([
        {:tone => Tone::Interval::ROOT, :letter_index => Tone::LetterInterval::FIRST, :strength => 0, :omitable => true},
        {:tone => Tone::Interval::MAJOR_3RD, :letter_index => Tone::LetterInterval::THIRD, :strength => 1},
        {:tone => Tone::Interval::PERFECT_5TH, :letter_index => Tone::LetterInterval::FIFTH, :strength => 3, :omitable => true},
        {:tone => Tone::Interval::DOMINANT_7TH, :letter_index => Tone::LetterInterval::SEVENTH, :strength => 2},
        {:tone => Tone::Interval::AUGMENTED_4TH, :letter_index => Tone::LetterInterval::FOURTH, :strength => 4}
      ])

      cc.chord_scales << ChordScale.specify(Scale['Melodic Minor'][4])
    end

    c.children.create!(:name => 'Mixoylidian b6').tap do |cc|
      cc.symbols.create!(:name => '7b6', :primary => true)

      cc.tones.create([
        {:tone => Tone::Interval::ROOT, :letter_index => Tone::LetterInterval::FIRST, :strength => 0, :omitable => true},
        {:tone => Tone::Interval::MAJOR_3RD, :letter_index => Tone::LetterInterval::THIRD, :strength => 1},
        {:tone => Tone::Interval::PERFECT_5TH, :letter_index => Tone::LetterInterval::FIFTH, :strength => 3},
        {:tone => Tone::Interval::DOMINANT_7TH, :letter_index => Tone::LetterInterval::SEVENTH, :strength => 2},
        {:tone => Tone::Interval::MINOR_6TH, :letter_index => Tone::LetterInterval::SIXTH, :strength => 4}
      ])

      cc.chord_scales << ChordScale.specify(Scale['Melodic Minor'][5])
    end

    c.children.create!(:name => 'Altered').tap do |cc|
      cc.symbols.create!(:name => 'alt', :primary => true)
      cc.symbols.create!(:name => 'altered')
      cc.symbols.create!(:name => '7#9#5')
      cc.symbols.create!(:name => '7#5#9')
      cc.symbols.create!(:name => '7b9#9')
      cc.symbols.create!(:name => '7#9b9')
      cc.symbols.create!(:name => '7#5')

      cc.tones.create([
        {:tone => Tone::Interval::ROOT, :letter_index => Tone::LetterInterval::FIRST, :strength => 0, :omitable => true},
        {:tone => Tone::Interval::MAJOR_3RD, :letter_index => Tone::LetterInterval::THIRD, :strength => 1},
        {:tone => Tone::Interval::DOMINANT_7TH, :letter_index => Tone::LetterInterval::SEVENTH, :strength => 2},
        {:tone => Tone::Interval::MINOR_2ND, :letter_index => Tone::LetterInterval::SECOND, :strength => 4},
        {:tone => Tone::Interval::AUGMENTED_2ND, :letter_index => Tone::LetterInterval::SECOND, :strength => 4},
        {:tone => Tone::Interval::AUGMENTED_5TH, :letter_index => Tone::LetterInterval::FIFTH, :strength => 4}
      ])

      cc.chord_scales << ChordScale.specify(Scale['Melodic Minor'][7])
    end

    c.children.create!(:name => 'Dominant b5').tap do |cc|
      cc.symbols.create!(:name => '7b5', :primary => true)

      cc.tones.create([
        {:tone => Tone::Interval::ROOT, :letter_index => Tone::LetterInterval::FIRST, :strength => 0, :omitable => true},
        {:tone => Tone::Interval::MAJOR_3RD, :letter_index => Tone::LetterInterval::THIRD, :strength => 1},
        {:tone => Tone::Interval::DIMINISHED_5TH, :letter_index => Tone::LetterInterval::FIFTH, :strength => 3},
        {:tone => Tone::Interval::DOMINANT_7TH, :letter_index => Tone::LetterInterval::SEVENTH, :strength => 2}
      ])

      cc.chord_scales << ChordScale.specify(Scale['Melodic Minor'][4])
    end

  end
end


ChordQuality.create!(:name => 'Diminished', :code => 'DIM').tap do |q|
  q.chords.create!(:name => 'Diminished Triad').tap do |c|
    c.symbols.create!(:name => 'dim', :primary => true)
    c.symbols.create!(:name => 'b5')

    c.tones.create([
      {:tone => Tone::Interval::ROOT, :letter_index => Tone::LetterInterval::FIRST, :strength => 0},
      {:tone => Tone::Interval::MINOR_3RD, :letter_index => Tone::LetterInterval::THIRD, :strength => 1},
      {:tone => Tone::Interval::DIMINISHED_5TH, :letter_index => Tone::LetterInterval::FIFTH, :strength => 1}
    ])

    c.chord_scales << ChordScale.specify(Scale['Diminished'][1])
    c.chord_scales << ChordScale.specify(Scale['Diminished'][2])
  end

  q.chords.create!(:name => 'Half Diminished').tap do |c|
    c.symbols.create!(:name => 'dim7', :primary => true)
    c.symbols.create!(:name => '7b5')

    c.tones.create([
      {:tone => Tone::Interval::ROOT, :letter_index => Tone::LetterInterval::FIRST, :strength => 0},
      {:tone => Tone::Interval::MINOR_3RD, :letter_index => Tone::LetterInterval::THIRD, :strength => 2},
      {:tone => Tone::Interval::DIMINISHED_5TH, :letter_index => Tone::LetterInterval::FIFTH, :strength => 1},
      {:tone => Tone::Interval::MINOR_7TH, :letter_index => Tone::LetterInterval::SEVENTH, :strength => 1}
    ])

    c.chord_scales << ChordScale.specify(Scale['Major'][7])
    c.chord_scales << ChordScale.specify(Scale['Melodic Minor'][6])
  end

  q.chords.create!(:name => 'Full Diminished').tap do |c|
    c.symbols.create!(:name => 'fulldim', :primary => true)
    c.symbols.create!(:name => 'b5bb7')

    c.tones.create([
      {:tone => Tone::Interval::ROOT, :letter_index => Tone::LetterInterval::FIRST, :strength => 0},
      {:tone => Tone::Interval::MINOR_3RD, :letter_index => Tone::LetterInterval::THIRD, :strength => 2},
      {:tone => Tone::Interval::DIMINISHED_5TH, :letter_index => Tone::LetterInterval::FIFTH, :strength => 1},
      {:tone => Tone::Interval::DIMINISHED_7TH, :letter_index => Tone::LetterInterval::SEVENTH, :strength => 1}
    ])

    c.chord_scales << ChordScale.specify(Scale['Diminished'][1])
    c.chord_scales << ChordScale.specify(Scale['Diminished'][2])
  end
end
