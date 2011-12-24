# EXAMPLE:
#
# Tune.create!(
#   :name => "All The Things You Are",
#   :vehicle => Vehicle["Standard"],
#   :meter => Meter["4/4"],
#   :primary_key_name => "Ab",
#   :tonality => "Major",
#   :concept => "Instrumental",
#   :form => Form["A-A-B-A"],
#   :form_length => 8,
#   :form_lengths => "8-8-8-8",
#   :starting_chord => Chord["Cmaj7"],
#   :tempo => 132,
#   :aebersold_playalong_number => 43,
#   :based_on_progression => Progression["Blues"]
# ).tap do |tune|
#   tune.tune_progressions.create(:progression => ::Progression["ii-V-I"])
#   tune.tune_concepts.create(:concept => ::Concept["Drop-2"], :start_measure => 8, :end_measure => 10)
# end

Tune.create!(
  :name             => "Autumn Leaves",
  :vehicle          => Vehicle["Standard"],
  :meter            => Meter["4/4"],
  :primary_key_name => "G",
  :tonality         => "Minor",
  :concept          => "Instrumental",
  :form             => Form["A-A-B-A"],
  :form_length      => 32,
  :form_lengths     => "8-8-8-8",
  :starting_chord   => Chord["Cmaj7"],
  :tempo            => 100,
  :aebersold_playalong_number => 54
)

Tune.create!(
  :name             => "There Will Never Be Another You",
  :vehicle          => Vehicle["Standard"],
  :meter            => Meter["4/4"],
  :primary_key_name => "Bb",
  :tonality         => "Major",
  :concept          => "Vocal",
  :form             => Form["A-A-B-A"],
  :form_length      => 32,
  :form_lengths     => "8-8-8-8",
  :starting_chord   => Chord["Ebmaj7"],
  :tempo            => 100
)

Tune.create!(
  :name             => "Alone Together",
  :vehicle          => Vehicle["Standard"],
  :meter            => Meter["4/4"],
  :primary_key_name => "D",
  :tonality         => "Minor",
  :concept          => "Instrumental",
  :form             => Form["A-A-B-A"],
  :form_length      => 32,
  :form_lengths     => "8-8-8-8",
  :starting_chord   => Chord["Dmin7"],
  :tempo            => 100
)

Tune.create!(
  :name             => "Have You Met Miss Jones",
  :vehicle          => Vehicle["Standard"],
  :meter            => Meter["4/4"],
  :primary_key_name => "F",
  :tonality         => "Major",
  :concept          => "Instrumental",
  :form             => Form["A-A-B-A"],
  :form_length      => 32,
  :form_lengths     => "8-8-8-8",
  :starting_chord   => Chord["Fmaj7"],
  :tempo            => 100
)

Tune.create!(
  :name             => "Blue Bossa",
  :vehicle          => Vehicle["Bossa"],
  :meter            => Meter["4/4"],
  :primary_key_name => "F",
  :tonality         => "Major",
  :concept          => "Instrumental",
  :form             => Form["A-A-B-A"],
  :form_length      => 32,
  :form_lengths     => "8-8-8-8",
  :starting_chord   => Chord["Fmaj7"],
  :tempo            => 100
)

Tune.create!(
  :name             => "Blue Bossa",
  :vehicle          => Vehicle["Bossa"],
  :meter            => Meter["4/4"],
  :primary_key_name => "D",
  :tonality         => "Minor",
  :concept          => "Instrumental",
  :form             => Form["A-A-B-A"],
  :form_length      => 32,
  :form_lengths     => "8-8-8-8",
  :starting_chord   => Chord["Cmin7"],
  :tempo            => 100
)

Tune.create!(
  :name             => "Up Jumped Spring",
  :vehicle          => Vehicle["Bossa"],
  :meter            => Meter["3/4"],
  :primary_key_name => "Bb",
  :tonality         => "Major",
  :concept          => "Instrumental",
  :form             => Form["A-A-B-A"],
  :form_length      => 32,
  :form_lengths     => "8-8-8-8",
  :starting_chord   => Chord["Bbmaj7"],
  :tempo            => 100
)

# # From "Learn Tunes" Book:
# Tune.create!(
#   :name             => "10/17/21",
#   :vehicle          => Vehicle["Bebop"],
#   :primary_key_name => "Db",
#   :tempo            => 126,
#   :aebersold_playalong_number => 76
# )
# 

# require "csv"
# 
# file = File.join(File.dirname(__FILE__), "aebersold_tunes.csv")
# 
# CSV.parse(File.read(file), :headers => true).each do |row|
#   Tune.create!(
#     :name => row["name"].gsub(/\*\*$/, ""),
#     :vehicle => Vehicle.find_or_create_by_name(row["vehicle_name"]),
#     :primary_key_name => row["key"].to_s.gsub(/\-$/, ""),
#     :tonality => (row["key"].to_s =~ /\-$/ ? "Minor" : "Major"),
#     :tempo => row["tempo"],
#     :aebersold_playalong_number => row["aebersold_playalong_number"]
#   )
# end


