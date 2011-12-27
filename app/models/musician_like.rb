class MusicianLike < ActiveRecord::Base
  belongs_to :musician
  belongs_to :likeable, :polymorphic => true

  fires :new_musician_like, :on => :create, :actor => :musician, :secondary_subject => :likeable

  scope :musicians, where(:likeable_type => "Musician")
  scope :tunes, where(:likeable_type => "Tune")

  delegate :to_s, :to => :likeable, :allow_nil => true

end
