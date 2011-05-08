class Mode < ActiveRecord::Base
	include KeyContext

	belongs_to :scale

	has_many :chord_scales
	has_many :chords, :through => :chord_scales, :extend => ChordCollection

	delegate :notes, :to => :tones

  def to_s
    name
  end

	def tones
		if self.key
			self.scale.tones.in_mode(self.mode).in_key_of(self.key)
		else
			self.scale.tones.in_mode(self.mode)
		end
	end

end
