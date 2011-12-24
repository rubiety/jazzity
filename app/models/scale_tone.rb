class ScaleTone < Tone
  belongs_to :scale, :counter_cache => true

  acts_as_list :scope => :scale

  delegate :key, :to => :scale

  validates :tone, :presence => true, :numericality => true
  validates :letter_index, :presence => true, :numericality => true

end
