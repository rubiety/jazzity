class Mode < ActiveRecord::Base
  include KeyContext

  belongs_to :scale

  has_many :chord_scales
  has_many :chords, :through => :chord_scales, :extend => Chords

  has_friendly_id :name, :use_slug => true

  delegate :notes, :to => :tones

  validates :name, :presence => true
  validates :mode, :presence => true, :numericality => true
  validates :scale, :presence => true

  def to_s
    name
  end

  def title
    if key
      "#{key} #{name}"
    else
      name
    end
  end

  def main?
    mode == 1
  end

  def tones
    if self.key
      self.scale.tones.in_mode(self.mode).in_key_of(self.key)
    else
      self.scale.tones.in_mode(self.mode)
    end
  end

  def self.resolve(symbol)
    in_key = nil
  
    return nil if symbol.nil?
    symbol = symbol.dup
  
    Key.all.each do |k|
      if symbol.starts_with?(k.name)
        in_key = k
        symbol.gsub!(/^#{k.name}/, '').strip!
        break
      end
    end
  
    mode = find_by_name(symbol)
  
    # Perhaps the matched key was really part of the name, try that:
    if mode.nil? && !in_key.nil?
      symbol = in_key.name + symbol
      mode = all.detect {|s| s.name == symbol}
    end
  
    # If still not found, must be invalid:
    return nil if mode.nil?
  
    mode.key = in_key
    mode
  end

  class << self
    alias_method :[], :resolve
  end

end
