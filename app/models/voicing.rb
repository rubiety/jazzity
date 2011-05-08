class Voicing < ActiveRecord::Base
	belongs_to :chord
	has_many :voicing_tones

  has_friendly_id :name, :use_slug => true

	delegate :key, :to => :chord

  validates :name, :presence => true

  def to_s
    name
  end

end
