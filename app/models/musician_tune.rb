class MusicianTune < ActiveRecord::Base
  belongs_to :musician
  belongs_to :tune

  scope :composed, where(:composed => true)
  scope :learning, where(:learning => true)
  scope :know, where(:know => true)

end
