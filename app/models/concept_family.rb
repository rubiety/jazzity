class ConceptFamily < ActiveRecord::Base
  extend FriendlyId

  has_many :concepts

  friendly_id :name, :use => :slugged

  def to_s
    name
  end
end
