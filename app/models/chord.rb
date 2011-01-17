class Chord < ActiveRecord::Base
  include KeyContext
  
  acts_as_tree
  
  belongs_to :chord_quality

  has_many :symbols, :class_name => 'ChordSymbol', :extend => ChordSymbolCollection
  has_one :primary_symbol, :class_name => 'ChordSymbol', :conditions => {:primary => true}

  has_many :chord_scales
  has_many :modes, :through => :chord_scales
  has_many :tones, :class_name => 'ChordTone', :extend => ToneSequence
  has_many :voicings

  delegate :notes, :to => :tones

  def symbols_list
    self.symbols.map {|s| s.name }.join(', ')
  end

  class << self
  
    # Resolves a chord symbol into a chord.
    # Implementation is somewhat flakey due to the potential ambiguities arising 
    # from specifying key and symbols together.
    def resolve(symbol)
      in_key = nil
    
      return nil if symbol.nil?
      symbol = symbol.dup
    
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
    alias_method :[], :resolve
  
  end

end