class Vehicle < ActiveRecord::Base
  has_many :tunes

  validates :name, :presence => true

  def to_s
    name
  end
end
