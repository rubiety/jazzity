class Voicing < ActiveRecord::Base
	belongs_to :chord
	has_many :voicing_tones

	delegate :key, :to => :chord

  validates :name, :presence => true

  def to_s
    name
  end

end
