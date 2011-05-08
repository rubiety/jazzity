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
  s.modes.create!(:mode => 6, :name => 'Aeolian')
  s.modes.create!(:mode => 7, :name => 'Locrian')
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
  s.modes.create!(:mode => 6, :name => 'Locrian #2', :synonyms => 'Aeolian b5')
  s.modes.create!(:mode => 7, :name => 'Super Locrian', :synonyms => 'Diminished Whole Tone')
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


