Progression.create!(:name => "ii-V-I", :full_tune => false,  :summary => "The most commonly-used progression in Jazz.", :information => "").tap do |p|
  p.components.create([
    {:position => 1, :index => 2, :chord => Chord["min7"]},
    {:position => 2, :index => 7, :chord => Chord["7"]},
    {:position => 3, :index => 0, :chord => Chord["ma7"]},
  ])
end

Progression.create!(:name => "ii-V", :full_tune => false,  :summary => "Simple ii-V", :information => "").tap do |p|
  p.components.create([
    {:position => 1, :index => 2, :chord => Chord["min7"]},
    {:position => 2, :index => 7, :chord => Chord["7"]}
  ])
end

Progression.create!(:name => "iii-iv-ii-V-I", :full_tune => false,  :summary => "Most common turn-around in Jazz.", :information => "").tap do |p|
  p.components.create([
    {:position => 1, :index => 4, :chord => Chord["min7"]},
    {:position => 2, :index => 9, :chord => Chord["7"]},
    {:position => 3, :index => 2, :chord => Chord["min7"]},
    {:position => 4, :index => 7, :chord => Chord["7"]},
    {:position => 5, :index => 0, :chord => Chord["maj7"]},
  ])
end

# Small Progressions
Progression.create!(:name => "Blues", :bars => 12, :full_tune => true, :form => Form['A-B-C'],
  :summary => "The most commonly-played progression in Jazz, this 12-bar form has many variations.",
  :information => ""  
)

Progression.create!(:name => "Rhythm Changes", :bars => 32, :full_tune => true, :form => Form['A-A-B-A'], 
  :summary => "The second most commonly-played progression in Jazz, this A-A-B-A progression borrows from the famous tune, I've Got Rhythm.",
  :information => ""
)

