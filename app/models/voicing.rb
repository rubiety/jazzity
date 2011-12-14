class Voicing < ActiveRecord::Base
  extend FriendlyId
  
  include KeyContext
  include OctaveContext
  include Commentable

  acts_as_tree
  friendly_id :name, :use => :scoped, :scope => :chord

  belongs_to :chord
  has_many :tones, :class_name => 'VoicingTone', :extend => Tones

  delegate :notes, :to => :tones
  delegate :octavized_notes, :to => :tones

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

  def specify_tones=(values)
    tones.specify(values)
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

