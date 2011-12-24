class VoiceLeading < ActiveRecord::Base
  belongs_to :from_voicing, :class_name => "Voicing"
  belongs_to :to_voicing, :class_name => "Voicing"

end
