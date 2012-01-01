Resource::AmazonBook.search_provider("Jamey Aebersold Vol").each do |resource|
  resource.save!
end

Tune.all.each do |tune|
  Resource::ItunesTrack.search_provider(tune.name).each do |track|
    track.save!
    tune.resources << track
  end

  Resource::AmazonBook.where(:subtype => "aebersold").where(:volume => tune.aebersold_playalong_number).each do |book|
    tune.resources << book
  end
end

