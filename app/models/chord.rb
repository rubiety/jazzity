class Chord < ActiveRecord::Base
  extend FriendlyId
  include KeyContext
  
  acts_as_tree
  friendly_id :name, :use => :slugged
  
  belongs_to :chord_quality

  has_many :symbols, :class_name => 'ChordSymbol'
  has_one :primary_symbol, :class_name => 'ChordSymbol', :conditions => {:primary => true}

  has_many :chord_scales
  has_many :modes, :through => :chord_scales
  has_many :tones, :class_name => 'ChordTone', :extend => Tones
  has_many :voicings

  delegate :notes, :to => :tones
  delegate :octavized_notes, :to => :tones

  validates :name, :presence => true
  validates :chord_quality, :presence => true

  def to_s
    name
  end

  def short_name
    "#{key}#{primary_symbol}"
  end

  def title
    if key
      "#{key} #{name}"
    else
      name
    end
  end

  def symbols_list
    self.symbols.map {|s| s.name }.join(', ')
  end

  # Resolves a chord symbol into a chord.
  # Implementation is somewhat flakey due to the potential ambiguities arising 
  # from specifying key and symbols together.
  def self.resolve(symbol)
    in_key = nil
  
    return nil if symbol.nil?
    symbol = symbol.dup
  
    symbol.gsub!(/ Chord/i, "")
  
    Key.all.each do |k|
      if symbol.starts_with?(k.name)
        in_key = k
        symbol.sub!(k.name, '').strip
        break
      end
    end
  
    chord_symbol = ChordSymbol[symbol]
  
    # Perhaps the matched key was really part of the name of the chord, try that:
    if chord_symbol.nil? && !in_key.nil?
      symbol = in_key.name + symbol
      chord_symbol = ChordSymbol[symbol]
    end
  
    # If still not found, must be invalid:
    return nil if chord_symbol.nil?
  
    chord = chord_symbol.chord
    chord.key = in_key unless in_key.nil?
    chord
  end

  class << self
    alias_method :[], :resolve
  end

  def to_json(options = {})
    super({:methods => [:notes]}.merge(options))
  end
end
