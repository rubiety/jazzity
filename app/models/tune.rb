class Tune < ActiveRecord::Base
  belongs_to :vehicle
  belongs_to :meter
  belongs_to :key
  belongs_to :secondary_key, :class_name => "Key"
  belongs_to :form
  belongs_to :starting_chord, :class_name => "Chord"
  belongs_to :ending_chord, :class_name => "Chord"
  belongs_to :contrafact_of_tune, :class_name => "Tune"

  validates :name, :presence => true
  validates :tonality, :inclusion => ["Major", "Minor"]
  validates :concept, :inclusion => ["Instrumental", "Vocal"]

end
