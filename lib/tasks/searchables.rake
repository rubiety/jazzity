namespace :searchables do
  desc "Regenerates all searchables"
  task :regenerate => :environment do
    Searchable.regenerate_all
  end
end
