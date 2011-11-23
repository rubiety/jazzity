Progression.create!(:name => "Blues", :bars => 12, :full_tune => true, :form => Form['A-B-C'],
  :summary => "The most commonly-played progression in Jazz, this 12-bar form has many variations.",
  :information => ""  
)

Progression.create!(:name => "Rhythm Changes", :bars => 32, :full_tune => true, :form => Form['A-A-B-A'], 
  :summary => "The second most commonly-played progression in Jazz, this A-A-B-A progression borrows from the famous tune, I've Got Rhythm.",
  :information => ""
)

Progression.create!(:name => "ii-V-I", :full_tune => false,  
  :summary => "The most commonly-used progression in Jazz.",
  :information => ""
)

