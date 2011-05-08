class Vehicle < ActiveRecord::Base
  has_many :tunes

  has_friendly_id :name, :use_slug => true

  validates :name, :presence => true

  def to_s
    name
  end
end
