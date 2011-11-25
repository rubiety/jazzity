class Key < ActiveRecord::Base
  extend FriendlyId
  
  Letters = {'C' => 0, 'D' => 1, 'E' => 2, 'F' => 3, 'G' => 4, 'A' => 5, 'B' => 6}
  Steps = {'H' => 1, 'W' => 2, 'm3' => 3, 'M3' => 4, '4' => 5, '#4' => 6, '5' => 7}
  Intervals = {
    'u' => 0, 'unison' => 0,
    'b2' => 1, 'min2' => 1, 'S' => 1, 'H' => 1, 'm2' => 1, 
    'M2' => 2, 'maj2' => 2, 'T' => 2, 'W' => 2, '2' => 2,
    'b3' => 3, 'min3' => 3, 'm3' => 3,
    '3' => 4, 'maj3' => 4, 'M3' => 4,
    'p4' =>  5, '4' => 5,
    'b5' => 6, 'aug4' => 6, 'dim5' => 6, '#4' => 6,
    'p5' =>  7, '5' => 7,
    'b6' => 8, 'aug5' => 8, '#5' => 8,
    'M6' =>  9, 'maj6' => 9, '6' => 9,
    'm7' => 10, 'min7' => 10, 'dom7' => 10, 'b7' => 10,
    'maj7' => 11, 'M7' => 11,
    '8' => 12, 'octave' => 12 
  }

  friendly_id :name

  validates :name, :presence => true
  validates :index, :presence => true
  validates :letter_index, :presence => true
  validates :cycle_index, :presence => true

  def to_s
    name
  end

  def main?
    name == "C"
  end
  
  def shifted(offset)
    self.class.primaries.find_by_index((index + offset) % 12)
  end

  # Finds a key given a tonal index 0-11 and a letter index (to disambiguate enharmonic keys)
  def self.from_index(value, preferred_letter = nil)
    all.find {|k| k.index == value && (preferred_letter.nil? || k.letter_index == preferred_letter)}
  end

  # Finds a key object given the name (such as Eb)
  def self.from_name(value)
    all.find {|k| k.name == value}
  end

  # Finds a key object based on the name:
  # +Key['Eb']+
  # 
  def self.[](value)
    from_name(value) || self.from_index(value)
  end

  # Returns an array of the 12 primary keys (definitions around the cycle of fourths)
  def self.primaries
    where(:primary => true)
  end

  def self.default
    self['C']
  end

  # Tests whether the current key is enharmonic with +another_key+.
  def enharmonic_with?(another_key)
    self.index == another_key.index
  end

  def to_json
    attributes.except("id").merge("id" => name).to_json
  end
end
