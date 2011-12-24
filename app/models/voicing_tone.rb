class VoicingTone < Tone
  belongs_to :voicing, :counter_cache => true

  acts_as_list :scope => :voicing

  delegate :key, :to => :voicing
  delegate :octave, :to => :voicing

  validates :tone, :presence => true, :numericality => true
  validates :letter_index, :presence => true, :numericality => true

end
