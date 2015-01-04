namespace :import do
  namespace :tunes do
    desc "Imports Tunes from a chords-json JSON file (FILE environment variable)"
    task :chords_json => :environment do
      fail "Please specify a FILE environment variable." unless ENV["FILE"]

      data = JSON.parse(File.read(ENV["FILE"]))
      puts "Found #{data.size} Tunes..."

      data.each do |raw_tune|
        Tune.find_or_initialize_by_name(raw_tune["name"]).tap do |tune|
          tune.primary_key_name = raw_tune["key"].to_s.gsub("-", "")
          tune.tonality = (raw_tune["key"].to_s.end_with?("-") or raw_tune["key"].to_s.end_with?("m")) ? "Minor" : "Major"
          tune.composer = raw_tune["composer"].to_s.split(" ", 2).reverse.join(" ").strip.presence
          tune.style = raw_tune["style"]

          if raw_changes = raw_tune["changes"]
            tune.changes_json = raw_tune["changes"].to_json
            changes = Changes.new(raw_changes)

            tune.form = Form[changes.form]
            tune.form_length = changes.bars.length
            tune.form_lengths = changes.sections.map {|s| s.bars.size }.join("-")

            if first_chord = changes.bars.first.try(:first)
              tune.starting_chord = Chord[first_chord] if first_chord.is_a?(String)
            end
            if last_chord = changes.bars.last.try(:last)
              tune.ending_chord = Chord[last_chord] if last_chord.is_a?(String)
            end

            if first_section = changes.sections.first
              tune.meter = Meter[first_section.time]
            end
          end

          tune.save!
          puts "  Imported #{raw_tune['name']}."
        end
      end
    end
  end
end
