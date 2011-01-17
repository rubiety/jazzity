class Scale < ActiveRecord::Base
	include KeyContext
	include ModeContext
  
	has_many :modes, :extend => ModeSequence, :dependent => :destroy
	has_many :tones, :class_name => 'ScaleTone', :extend => ToneSequence, :dependent => :destroy

	delegate :notes, :to => :tones
	delegate :chords, :to => :main_mode

	class << self
		def resolve(symbol)
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
		
			scale = Scale.find_by_name(symbol)
		
			# Perhaps the matched key was really part of the name of the chord, try that:
			if scale.nil? && !in_key.nil?
				symbol = in_key.name + symbol
				scale = Scale.all.detect {|s| s.name == symbol}
			end
		
			# If still not found, must be invalid:
			return nil if scale.nil?
		
			scale.key = in_key
			scale
		end
		alias_method :[], :resolve
	end

	def [](name)
		name.is_a?(String) ? self.modes.find_by_name(name) : self.modes.find_by_mode(name)
	end

	def main_mode
		self[1]
	end

	def symmetric?
		!self.symmetry_index.nil?
	end


	def to_xml(options = {})
		super(options.merge(:skip_types => true))
	end

end
