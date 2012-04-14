namespace :import do
  namespace :tunes do
    desc "Imports Tunes from a chords-json JSON file (FILE environment variable)"
    task :chords_json => :environment do
      fail "Please specify a FILE environment variable." unless ENV["FILE"]

      data = JSON.parse(File.read(ENV["FILE"]))
      puts "Found #{data.size} Tunes..."

      data.each do |raw_tune|
        Tune.find_or_initialize_by_name(raw_tune["name"]).tap do |tune|
          tune.primary_key_name = raw_tune["key"]
          tune.changes_json = raw_tune["changes"].to_json
          tune.save!
          puts "  Imported #{raw_tune['name']}."
        end
      end
    end
  end
end
