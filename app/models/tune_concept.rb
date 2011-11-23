class TuneConcept < ActiveRecord::Base
  belongs_to :tune
  belongs_to :concept
end
