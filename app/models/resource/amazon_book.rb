class Resource::AmazonBook < Resource
  COMMISSION = 0.04

  class AmazonError < StandardError; end

  def title
    name.gsub(" (Book & CD Set)", "")
  end

  def expected_payout
    (price || 0) * COMMISSION
  end

  def self.search_provider(query, options = {})
    options[:response_group] ||= "Medium"
    options[:sort] ||= "salesrank"

    response = Amazon::Ecs.item_search(query, options)
    
    if response.has_error?
      raise AmazonError, response.error
    else
      response.items.map {|i| from_provider(i) }
    end
  end

  def self.from_provider_id(provider_id, options = {})
    options[:response_group] ||= "Medium"
    options[:sort] ||= "salesrank"

    response = Amazon::Ecs.item_lookup(provider_id, options)
    
    if response.has_error?
      raise AmazonError, response.error
    else
      from_provider(response.items.first)
    end
  end

  def self.from_provider(item)
    find_or_initialize_by_identifier(item.get("ASIN")).tap do |book|
      book.provider_response = item
      book.attributes = {
        :identifier => item.get("ASIN"),
        :subtype => subtype_from_provider(item),
        :name => item.get_unescaped("ItemAttributes/Title"),
        :author_name => item.get("ItemAttributes/Author") || item.get("ItemAttributes/Publisher"),
        :image_url => item.get("MediumImage/URL") || item.get("LargeImage/URL"),
        :view_url => item.get("DetailPageURL"),
        :price => item.get("ItemAttributes/ListPrice/FormattedPrice").to_s.gsub(/\$/, ""),
        :volume => volume_from_provider(item)
      }
    end
  end


  protected

  def self.volume_from_provider(item)
    if md = /Vol\. (\d+)/.match(item.get("ItemAttributes/Title"))
      md[1]
    end
  end

  def self.subtype_from_provider(item)
    case item.get("ItemAttributes/Author")
    when /Jamey Aebersold/
      "aebersold"
    end
  end
end

