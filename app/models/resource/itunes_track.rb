require "itunes"

class Resource::ItunesTrack < Resource
  COMMISSION = 0.05

  def title
    "#{author_name} - #{name}"
  end

  def expected_payout
    (price || 0) * COMMISSION
  end

  def self.search_provider(query, options = {})
    options[:limit] ||= 50

    ITunes.music(query, options).results.map do |hash|
      from_provider(hash)
    end
  end
  
  def self.from_provider(hash)
    find_or_initialize_by_identifier(hash.track_id).tap do |track|
      track.provider_response = hash
      track.attributes = {
        :subtype => hash.wrapper_type,
        :identifier => hash.track_id,
        :name => hash.track_name,
        :collection_identifier => hash.collection_id,
        :collection_name => hash.collection_name,
        :collection_track_number => hash.track_number,
        :author_identifier => hash.artist_id,
        :author_name => hash.artist_name,
        :price => hash.track_price,
        :image_url => hash.artwork_url100,
        :view_url => hash.track_view_url,
        :audio_preview_url => hash.preview_url,
        :description => hash.description
      }
    end
  end
end
