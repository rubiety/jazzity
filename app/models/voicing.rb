class Voicing < ActiveRecord::Base
  include KeyContext
  include OctaveContext

  acts_as_tree
  has_friendly_id :name, :use_slug => true

  belongs_to :chord
  has_many :tones, :class_name => 'VoicingTone', :extend => ToneSequence

  delegate :notes, :to => :tones

  validates :name, :presence => true

  def to_s
    name
  end

  def title
    if key
      "#{name} Voicing in #{key}"
    else
      "#{name} Voicing"
    end
  end

  def self.resolve(name)
    find_by_name(name)
  end

  class << self
    alias_method :[], :resolve
  end

  def to_json(options = {})
    super({:methods => [:notes]}.merge(options))
  end
end
