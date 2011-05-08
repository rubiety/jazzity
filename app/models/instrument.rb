class Instrument < ActiveRecord::Base
  has_many :musicians

  validates :name, :presence => true

  def to_s
    name
  end
end
