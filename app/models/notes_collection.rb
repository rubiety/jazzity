require "set"

class NotesCollection
	include Enumerable
	include KeyContext

	attr_accessor :keys
	attr_accessor :invalid_keys

	def initialize(value = [])
		@value_as_given = value
		@keys = []
		@invalid_keys = []
	
		value = value.split(/,| /).map(&:strip) if value.instance_of?(String)
		value.each do |key_name|
			key_object = Key[key_name]
		
			if key_object.nil?
				@invalid_keys << key_name
			else
				@keys << key_object
			end
		end
	end

	class << self
		alias_method :[], :new
	end

	delegate :each, :to => :keys

	# Chords associated with this collection of notes
	def chords
		if key
			chords_in_key(key)
		else
			Key.primaries.map do |in_key|
				chords_in_key(in_key)
			end.flatten
		end.extend(ChordCollection)
	end

	private

	def chords_in_key(in_key)
		Chord.all.select do |c|
			c.tones.map(&:tone).to_set == keys.map {|k| (k.index - (in_key ? in_key.index : 0)) % 12 }.to_set
		end.map {|c| c.key = in_key; c}
	end

end
