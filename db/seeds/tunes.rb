Tune.create!(
  :name => "All The Things You Are",
  :vehicle => Vehicle["Standard"],
  :meter => Meter["4/4"],
  :primary_key => Key["Ab"],
  :tonality => "Major",
  :concept => "Instrumental",
  :form => Form["A-A-B-A"],
  :form_length => 8,
  :form_lengths => "8-8-8-8",
  :starting_chord => Chord["Cmaj7"],
  :tempo => 132,
  :aebersold_playalong_number => 43,
  :based_on_progression => Progression["Blues"]
).tap do |tune|
  tune.tune_progressions.create(:progression => ::Progression["ii-V-I"])
  tune.tune_concepts.create(:concept => ::Concept["Drop-2"], :start_measure => 8, :end_measure => 10)
end

Tune.create!(
  :name => "Autumn Leaves",
  :vehicle => Vehicle["Standard"],
  :meter => Meter["4/4"],
  :primary_key => Key["G"],
  :tonality => "Minor",
  :concept => "Instrumental",
  :form => Form["A-A-B-A"],
  :form_length => 8,
  :form_lengths => "8-8-8-8",
  :starting_chord => Chord["Cmaj7"],
  :tempo => 100,
  :aebersold_playalong_number => 54
)

