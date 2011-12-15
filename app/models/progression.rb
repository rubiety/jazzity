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

  # TODO: Needs more refinement. For now just alternating Type I and Type II voicings, if they exist!
  def chord_voicings
    i = -1
    chords.map do |chord|
      i += 1
      if voicing = chord.voicings.find_by_name(i % 2 == 0 ? "Type I" : "Type II")
        voicing.in_key_of(chord.key)
      else
        voicing.first
      end
    end
  end

  def chord_voicing_notes(force_root = false)
    chord_voicings.map do |voicing|
      force_root && voicing.rootless ? ["#{voicing.key}/3"] + voicing.octavized_notes : voicing.octavized_notes
    end
  end

  def notes
    chords.map(&:notes)
  end
  def octavized_notes
    chords.map(&:octavized_notes)
  end
  def staff_notes
    chord_voicing_notes
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
