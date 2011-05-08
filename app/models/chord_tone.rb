class ChordTone < Tone
  belongs_to :chord

  acts_as_list :scope => :chord

  delegate :key, :to => :chord

  validates :chord, :presence => true
  validates :tone, :presence => true, :numericality => true
  validates :letter_index, :presence => true, :numericality => true

end
