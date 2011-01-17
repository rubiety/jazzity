class ChordSymbol < ActiveRecord::Base
  belongs_to :chord

  class << self
    # Finds a chord symbol
    def resolve(symbol)
      self.all.detect do |cs|
        cs.case_sensitive? ? (cs.name == symbol) : (cs.name.downcase == symbol.downcase)
      end
    end
    alias_method :[], :resolve
  end

end