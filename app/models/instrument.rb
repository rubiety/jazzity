class Instrument < ActiveRecord::Base
  has_many :musicians

  has_friendly_id :name, :use_slug => true

  validates :name, :presence => true

  def to_s
    name
  end
end
