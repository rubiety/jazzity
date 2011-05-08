class ChordQuality < ActiveRecord::Base
  has_many :chords

  has_friendly_id :name, :use_slug => true

  validates :name, :presence => true
  validates :code, :presence => true

  def to_s
    name
  end

  def self.resolve(name)
    find_by_name(name)
  end

  class << self
    alias_method :[], :resolve
  end

end
