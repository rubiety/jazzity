class Progression < ActiveRecord::Base
  belongs_to :meter
  belongs_to :form
  has_many :components, :class_name => "ProgressionComponent"
  has_many :chords, :through => :components

  scope :full_tune, where(:full_tune => true)
  scope :partial, where(:full_tune => false)

  validates :name, :presence => true

  def to_s
    name
  end

  def beats
    bars * meter.beats
  end

  def self.resolve(name)
    find_by_name(name)
  end

  class << self
    alias_method :[], :resolve
  end

end
