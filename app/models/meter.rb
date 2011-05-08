class Meter < ActiveRecord::Base
  has_friendly_id :name, :use_slug => true

  validates :name, :presence => true
  validates :beats, :presence => true, :numericality => true
  validates :division, :presence => true, :numericality => true

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
