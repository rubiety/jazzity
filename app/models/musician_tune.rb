class MusicianTune < ActiveRecord::Base
  belongs_to :musician
  belongs_to :tune
  has_many :timeline_events, :as => :subject, :dependent => :destroy

  scope :composed, where(:composed => true)
  scope :learning, where(:learning => true)
  scope :know, where(:know => true)

  fires :new_musician_tune, :on => :create, :actor => :musician, :secondary_subject => :tune

  def to_s
    tune.to_s
  end
end
