class ChordScale < ActiveRecord::Base
  belongs_to :chord
  belongs_to :mode

  delegate :scale, :to => :mode
  delegate :key, :to => :chord
end
