class Scale < ActiveRecord::Base
  extend FriendlyId
  include KeyContext
  include ModeContext
  include Searchable::Model
  
  has_many :modes, :dependent => :destroy
  has_many :tones, :class_name => 'ScaleTone', :extend => Tones, :dependent => :destroy

  friendly_id :name, :use => :slugged

  delegate :notes, :to => :tones
  delegate :octavized_notes, :to => :tones
  delegate :chords, :to => :main_mode
  delegate :intervals, :to => :tones
  delegate :step_names, :to => :tones
  delegate :interval_names, :to => :tones

  validates :name, :presence => true

  define_searchables do
    searchables.create(:name => "#{name} Scale")

    Key.primaries.each do |key|
      searchables.create(:name => "#{key.name} #{name} Scale", :key_name => key.name)
    end
  end

  def to_s
    name
  end

  def title
    if key
      "The #{key} #{name} Scale"
    else
      "The #{name} Scale"
    end
  end

  def staff_notes
    octavized_notes.map {|n| [n]}
  end

  def specify_tones=(values)
    tones.specify(values)
  end

  def self.resolve(symbol)
    in_key = nil
  
    return nil if symbol.nil?
    symbol = symbol.dup

    symbol.gsub!(/ Scale/i, "")
  
    Key.all.each do |k|
      if symbol.starts_with?(k.name)
        in_key = k
        symbol.gsub!(/^#{k.name}/, '').strip!
        break
      end
    end
  
    scale = find_by_name(symbol)
  
    # Perhaps the matched key was really part of the name, try that:
    if scale.nil? && !in_key.nil?
      symbol = in_key.name + symbol
      scale = all.detect {|s| s.name == symbol}
    end
  
    # If still not found, must be invalid:
    return nil if scale.nil?
  
    scale.key = in_key
    scale
  end

  class << self
    alias_method :[], :resolve
  end

  def main_mode
    modes.find_by_mode(1)
  end

  def symmetric?
    !self.symmetry_index.nil?
  end

  def to_json
    super(:methods => [:notes])
  end

end
