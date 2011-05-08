class ProgressionComponent < ActiveRecord::Base
  belongs_to :progression
  belongs_to :chord

  delegate :to_s, :to => :chord
  
end
