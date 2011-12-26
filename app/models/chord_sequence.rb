class ChordSequence
  extend ActiveModel::Naming
  include Enumerable
  include KeyContext

  attr_accessor :chords
  attr_accessor :chord_names
  attr_accessor :invalid_chords
  

  def initialize(value = [])
    @value_as_given = value
    @chords = []
    @chord_names = []
    @invalid_chords = []
  
    value = value.split(/,| /).map(&:strip).reject(&:blank?) if value.instance_of?(String)
    value.each do |chord_name|
      chord_object = chord_name.is_a?(Chord) ? chord_name : Chord[chord_name]
    
      if chord_object.nil?
        @invalid_chords << chord_name
      else
        @chords << chord_object
        @chord_names << chord_name.to_s
      end
    end
  end

  def to_s
    name
  end

  def name
    chord_names.join(", ")
  end

  def to_param
    chord_names.join(",")
  end

  def title
    if key
      "#{name} in #{key}"
    else
      name
    end
  end

  def chord_voicings(voicing_ids = {})
    VoiceLeading.voicings_for_chords(chords, voicing_ids)
  end

  def chord_voicing_notes(voicing_ids = {})
    chord_voicings(voicing_ids).map do |voicing|
      voicing.octavized_notes(3)
    end
  end

  def notes
    chords.map(&:notes)
  end
  def octavized_notes
    chords.map(&:octavized_notes)
  end
  def staff_notes(voicing_ids = {})
    chord_voicing_notes(voicing_ids)
  end

  class << self
    def resolve(value)
      collection = new(value)
      if collection.invalid_chords.empty? and collection.chords.size > 1
        collection
      else
        nil
      end
    end
    
    alias_method :[], :resolve
  end

  delegate :each, :to => :chords

  # TODO:
  def progressions
    Progression.all
  end

  # Progressions associated with this collection of notes
  # def progressions
  #   if key
  #     chords_in_key(key)
  #   else
  #     Key.primaries.map do |in_key|
  #       chords_in_key(in_key)
  #     end.flatten
  #   end.extend(Chords)
  # end

  # private

  # def chords_in_key(in_key)
  #   Chord.all.select do |c|
  #     c.tones.map(&:tone).to_set == keys.map {|k| (k.index - (in_key ? in_key.index : 0)) % 12 }.to_set
  #   end.map {|c| c.key = in_key; c}
  # end

end
