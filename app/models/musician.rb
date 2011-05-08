class Musician < ActiveRecord::Base
  belongs_to :instrument

  validates :name, :presence => true

  def to_s
    name
  end
end
