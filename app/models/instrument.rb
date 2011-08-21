class Instrument < ActiveRecord::Base
  extend FriendlyId
  
  has_many :musicians

  friendly_id :name, :use => :slugged

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
