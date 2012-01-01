class Tune < ActiveRecord::Base
  extend FriendlyId
  include Searchable::Model
  include Commentable
  include Resourceable
  
  has_many :searchables, :as => :model
  belongs_to :vehicle
  belongs_to :meter
  belongs_to :form
  belongs_to :starting_chord, :class_name => "Chord"
  belongs_to :ending_chord, :class_name => "Chord"
  belongs_to :contrafact_of_tune, :class_name => "Tune"
  belongs_to :based_on_progression, :class_name => "Progression"
  has_many :tune_progressions, :dependent => :destroy
  has_many :progressions, :through => :tune_progressions
  has_many :tune_concepts, :dependent => :destroy
  has_many :concepts, :through => :tune_concepts

  friendly_id :name, :use => :slugged

  scope :with_vehicle, lambda {|v| where(:vehicle_id => v.id) }
  scope :with_form, lambda {|f| where(:form_id => f.id) }
  scope :with_meter, lambda {|m| where(:meter_id => m.id) }
  scope :with_based_on_progression, lambda {|p| where(:based_on_progression_id => p.id) }
  scope :search, lambda {|q| where("name LIKE ?", "%#{q}%") }

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

  def primary_key
    Key[primary_key_name]
  end
  def secondary_key
    Key[secondary_key_name]
  end

  def recordings
    @recordings ||= begin
      require "itunes"
      ITunes.music(name, :limit => 10).results
    end
  end

  def self.resolve(name)
    find_by_name(name)
  end

  class << self
    alias_method :[], :resolve
  end
end
