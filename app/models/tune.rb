class Tune < ActiveRecord::Base
  extend FriendlyId
  include Searchable::Model
  include Commentable
  
  has_many :searchables, :as => :model
  belongs_to :vehicle
  belongs_to :meter
  belongs_to :primary_key, :class_name => "Key"
  belongs_to :secondary_key, :class_name => "Key"
  belongs_to :form
  belongs_to :starting_chord, :class_name => "Chord"
  belongs_to :ending_chord, :class_name => "Chord"
  belongs_to :contrafact_of_tune, :class_name => "Tune"

  friendly_id :name, :use => :slugged

  validates :name, :presence => true
  validates :tonality, :inclusion => ["Major", "Minor"]
  validates :concept, :inclusion => ["Instrumental", "Vocal"]

  define_searchables do
    searchables.destroy_all
    searchables.create(:name => title)
  end

  def title
    alternate_name.present? ? "#{name} (#{alternate_name})" : name
  end

  def to_s
    title
  end

  def self.resolve(name)
    find_by_name(name)
  end

  class << self
    alias_method :[], :resolve
  end
end
