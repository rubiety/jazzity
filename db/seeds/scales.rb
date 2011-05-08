Scale.create!(:name => 'Major', :information => "The major scale and its modes is the most commonly-used scale in western music.").tap do |s|
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

Scale.create!(:name => 'Melodic Minor', :information => "The melodic minor scale is similar to the major scale with only one difference - it uses a minor third instead of a major third.").tap do |s|
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

Scale.create!(:name => 'Whole Tone', :symmetry_index => 2, :information => "The whole tone scale is in open, suspended harmony and works well with #5 chords.").tap do |s|
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

Scale.create!(:name => 'Pentatonic', :information => "A foundation of the major bebop scale and used significantly in jazz, the Pentatonic scale models the black keys on the piano.").tap do |s|
  s.tones.create([
    {:tone => 0, :letter_index => Tone::LetterInterval::FIRST},
    {:tone => 2, :letter_index => Tone::LetterInterval::SECOND},
    {:tone => 4, :letter_index => Tone::LetterInterval::THIRD},
    {:tone => 7, :letter_index => Tone::LetterInterval::FIFTH},
    {:tone => 9, :letter_index => Tone::LetterInterval::SIXTH}
  ])

  s.modes.create!(:mode => 1, :name => 'Pentatonic')
end

Scale.create!(:name => 'Blues', :information => "The blues scale is used pervasively in the jazz idiom, and works especiall well with the most common progression in Jazz - the Blues Progression.").tap do |s|
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

Scale.create!(:name => 'Diminished', :symmetry_index => 3, :information => "The diminished scale alternatives whole steps and half steps to produce a symmetric scale with some interesting attributes.").tap do |s|
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

Scale.create!(:name => 'Harmonic Minor', :information => "The harmonic minor scale is used mostly in classical but many jazz musicians alternate this with other minor scales.").tap do |s|
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

Scale.create!(:name => 'Bebop', :information => "The bebop scale introduces a passing tone 7th to the major scale, resulting in an 8-note scale that fits well with typical even meters.").tap do |s|
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


