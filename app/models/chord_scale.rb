class ChordScale < ActiveRecord::Base
  belongs_to :chord
  belongs_to :mode

  delegate :scale, :to => :mode
  delegate :key, :to => :chord

  def self.specify(mode, strength = 1)
    chord_scale = self.new
    chord_scale.mode = mode
    chord_scale.strength = strength
    chord_scale
  end
end