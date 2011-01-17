class VoicingTone < Tone
	belongs_to :voicing

	acts_as_list :scope => :voicing

end