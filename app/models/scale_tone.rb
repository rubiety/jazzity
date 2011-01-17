class ScaleTone < Tone
	belongs_to :scale

	acts_as_list :scope => :scale

	delegate :key, :to => :scale

end