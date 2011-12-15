class ProgressionComponent < ActiveRecord::Base
  belongs_to :progression
  belongs_to :included_progression, :class_name => "Progression"
  belongs_to :chord

  def to_s
    included_progression || chord
  end
  
  def all_chords
    if included_progression
      included_progression.all_chords
    else
      [chord]
    end
  end

  def all_chords_in_key(key)
    if included_progression
      included_progression.components.map {|c| c.all_chords_in_key((key || Key.default).shifted(index)) }.compact
    elsif chord
      [chord.in_key_of((key || Key.default).shifted(index))]
    end
  end
  
end
