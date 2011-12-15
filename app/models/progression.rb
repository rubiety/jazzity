class Progression < ActiveRecord::Base
  extend FriendlyId
  
  include KeyContext
  include Commentable
  include Searchable::Model
  
  friendly_id :name, :use => :slugged

  has_many :searchables, :as => :model
  belongs_to :meter
  belongs_to :form
  belongs_to :variant_of, :class_name => "Progression"
  has_many :variants, :class_name => "Progression", :foreign_key => "variant_of_id"
  has_many :components, :class_name => "ProgressionComponent", :order => "progression_components.position"
  has_many :tunes_based_on, :class_name => "Tune", :foreign_key => "based_on_progression_id"
  has_many :tune_progressions, :dependent => :destroy
  has_many :tunes, :through => :tune_progressions

  scope :full_tune, where(:full_tune => true)
  scope :partial, where(:full_tune => false)

  validates :name, :presence => true

  define_searchables do
    searchables.create(:name => name)
  end

  def to_s
    name
  end

  def title
    if key
      "#{name} Progression in #{key}"
    else
      "#{name} Progression"
    end
  end

  def chords
    components.map do |component|
      component.all_chords_in_key(key)
    end.flatten.compact
  end

  def notes
    chords.map(&:notes)
  end
  def octavized_notes
    chords.map(&:octavized_notes)
  end
  def staff_notes
    notes # octavized_notes
  end
  def beats
    bars * meter.beats
  end

  def self.resolve(name)
    find_by_name(name)
  end

  class << self
    alias_method :[], :resolve
  end

end
