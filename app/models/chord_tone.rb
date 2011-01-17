class ChordTone < Tone
  belongs_to :chord

  acts_as_list :scope => :chord

  delegate :key, :to => :chord

end