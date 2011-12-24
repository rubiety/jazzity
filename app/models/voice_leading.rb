class VoiceLeading < ActiveRecord::Base
  belongs_to :from_voicing, :class_name => "Voicing"
  belongs_to :to_voicing, :class_name => "Voicing"

  scope :from_chord, lambda {|c| joins("INNER JOIN voicings AS from_voicings ON from_voicings.id = voice_leadings.from_voicing_id").where(:from_voicings => {:chord_id => c.id}) }
  scope :to_chord,   lambda {|c| joins("INNER JOIN voicings AS to_voicings ON to_voicings.id = voice_leadings.to_voicing_id").where(:to_voicings => {:chord_id => c.id}) }

  # Determines a good set of voicings using voice leading rules for the given set of chords
  # TODO: This needs major refinement - tree traversal algorithms are necessary here.
  # TODO: Currently the randomizes the voice leadings it chooses, probably not ideal.
  #
  def self.voicings_for_chords(chords, options = {})
    [].tap do |voicings|
      last_chord = chords.first

      chords.each_with_index do |chord, i|
        next if i == 0
        
        offset = (chord.key.index - last_chord.key.index) % 12

        if last_voicing = voicings.last
          if leading = last_voicing.voice_leadings_from.where(:offset => offset).to_chord(chord).sample
            voicings << leading.to_voicing.in_key_of(chord.key)
          else
            voicings << chord.voicings.first.in_key_of(chord.key)
          end
        else
          if leading = VoiceLeading.where(:offset => offset).from_chord(last_chord).to_chord(chord).sample
            voicings << leading.from_voicing.in_key_of(last_chord.key)
            voicings << leading.to_voicing.in_key_of(chord.key)
          else
            voicings << last_chord.voicings.first.in_key_of(last_chord.key)
            voicings << chord.voicings.first.in_key_of(chord.key)
          end
        end

        last_chord = chord
      end
    end
  end
end
