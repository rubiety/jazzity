class Tone
  attr_accessor :tone
  attr_accessor :letter_index
  attr_accessor :position

  def initialize(attributes = {})
    attributes.each do |k, v|
      self.send("#{k}=", v)
    end
  end

  def as_json(options = {})
    {:tone => tone, :letter_index => letter_index, :position => position}
  end
end
