class Progression < ActiveRecord::Base
  belongs_to :meter
  belongs_to :form
  has_many :components, :class_name => "ProgressionComponent"

  scope :full_tune, where(:full_tune => true)
  scope :partial, where(:full_tune => false)

  def to_s
    name
  end

  def beats
    bars * meter.beats
  end

  class << self
    def resolve(name)
      self.find_by_name(name)
    end
    alias_method :[], :resolve
  end

end
