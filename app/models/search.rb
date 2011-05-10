class Search
  def initialize(query)
    @query = query
  end
  
  def all
    [Chord, ChordQuality, Concept, Form, Instrument, Meter, Mode, Progression, Scale, Tune, Vehicle, Voicing].map do |klass|
      puts "Trying #{klass.name}..."
      klass[@query]
    end.flatten.compact.map do |result|
      if result.is_a?(Mode)
        [result.scale, result]
      else
        result
      end
    end.map do |result|
      last_piece = [result].flatten.last

      if last_piece.respond_to?(:key) and last_piece.key
        ([last_piece.key] + [result].flatten)
      else
        result
      end
    end
  end
end
