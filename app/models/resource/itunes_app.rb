require "itunes"

class Resource::ItunesApp < Resource
  ITUNES_COMMISSION = 0.05

  def expected_payout
    (price || 0) * ITUNES_COMMISSION
  end

  def self.search_provider(query, options = {})
    options[:limit] ||= 50

    ITunes.software(query, options).results.map do |hash|
      from_provider(hash)
    end
  end
  
  def self.from_provider(hash)
    find_or_initialize_by_identifier(hash.track_id).tap do |track|
      track.attributes = {
        :subtype => hash.wrapper_type,
        :identifier => hash.track_id,
        :name => hash.track_name,
        :collection_identifier => hash.collection_id,
        :collection_name => hash.collection_name,
        :collection_track_number => hash.track_number,
        :author_identifier => hash.artist_id,
        :author_name => hash.author_name,
        :price => hash.track_price,
        :image_url => hash.artworkurl100,
        :view_url => hash.track_view_url,
        :audio_preview_url => hash.preview_url,
        :description => hash.description
      }
    end
  end

  def self.from_provider!(hash)
    from_itunes(hash).save!
  end
end
