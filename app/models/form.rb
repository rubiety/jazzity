class Form < ActiveRecord::Base
  has_many :progressions
  has_many :tunes

  has_friendly_id :name, :use_slug => true

  validates :name, :presence => true

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
