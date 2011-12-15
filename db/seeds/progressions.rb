Progression.create!(:name => "Major ii-V", :full_tune => false,  :summary => "The most commonly-used progression in Jazz.", :information => "").tap do |p|
  p.components.create([
    {:position => 1, :index => 2, :chord => Chord["min7"]},
    {:position => 2, :index => 7, :chord => Chord["7"]}
  ])
end

Progression.create!(:name => "Major ii-V-I", :full_tune => false,  :summary => "The most commonly-used progression in Jazz.", :information => "").tap do |p|
  p.components.create([
    {:position => 1, :index => 0, :included_progression => Progression["Major ii-V"]},
    {:position => 2, :index => 0, :chord => Chord["maj7"]}
  ])
end

Progression.create!(:name => "Minor ii-V", :full_tune => false,  :summary => "The most commonly-used progression in Jazz.", :information => "").tap do |p|
  p.components.create([
    {:position => 1, :index => 2, :chord => Chord["dim7"]},
    {:position => 2, :index => 7, :chord => Chord["alt"]}
  ])
end

Progression.create!(:name => "Minor ii-V-I", :full_tune => false,  :summary => "The most commonly-used progression in Jazz.", :information => "").tap do |p|
  p.components.create([
    {:position => 1, :index => 0, :included_progression => Progression["Minor ii-V"]},
    {:position => 2, :index => 0, :chord => Chord["min7"]}
  ])
end



# Small Progressions
Progression.create!(:name => "Blues", :bars => 12, :full_tune => true, :form => Form['A-B-C'], :summary => "The most commonly-played progression in Jazz, this 12-bar form has many variations.", :information => "").tap do |p|
  p.components.create([
    {:position => 1, :index => 0, :chord => Chord["7"]},
    {:position => 2, :index => 5, :chord => Chord["7"]},
    {:position => 3, :index => 0, :chord => Chord["7"]},
    {:position => 4, :index => 0, :chord => Chord["7"]},
    {:position => 5, :index => 5, :chord => Chord["7"]},
    {:position => 6, :index => 5, :chord => Chord["7"]},
    {:position => 7, :index => 0, :chord => Chord["7"]},
    {:position => 8, :index => 0, :chord => Chord["7"]},
    {:position => 8, :index => 7, :chord => Chord["7"]},
    {:position => 10, :index => 7, :chord => Chord["7"]},
    {:position => 11, :index => 0, :chord => Chord["7"]},
    {:position => 12, :index => 0, :chord => Chord["7"]}
  ])
end

Progression.create!(:name => "Rhythm Changes", :bars => 32, :full_tune => true, :form => Form['A-A-B-A'], 
  :summary => "The second most commonly-played progression in Jazz, this A-A-B-A progression borrows from the famous tune, I've Got Rhythm.",
  :information => ""
)

