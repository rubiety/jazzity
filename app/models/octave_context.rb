module OctaveContext
  DEFAULT_OCTAVE = 4

  def self.included(klass)
    klass.class_eval do
      attr_accessor :octave

      def in_octave(number)
        self.octave = number
        self
      end

      def without_octave
        self.octave = nil
        self
      end
    end
  end
end
