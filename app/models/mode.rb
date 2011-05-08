class Mode < ActiveRecord::Base
	include KeyContext

	belongs_to :scale

	has_many :chord_scales
	has_many :chords, :through => :chord_scales, :extend => ChordCollection

  has_friendly_id :name, :use_slug => true

	delegate :notes, :to => :tones

  validates :name, :presence => true
  validates :mode, :presence => true, :numericality => true
  validates :scale, :presence => true

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
