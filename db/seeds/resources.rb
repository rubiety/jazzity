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

Musician.all.each do |musician|
  Resource::ItunesTrack.search_provider(musician.name).each do |track|
    track.save!
    musician.resources << track
  end

  Resource::AmazonBook.search_provider(musician.name).each do |book|
    book.save!
    musician.resources << book
  end
end

