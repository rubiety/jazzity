class Search
  def initialize(query)
    @query = query
  end
  
  def all
    extract_key(@query)
    returned = results(@query).flatten.compact
    returned = normalize_results(returned)

    add_key_context(returned)
  end


  protected

  def results(query)
    Searchable.where("name LIKE ?", "%#{query}%").map(&:target)
  end

  def normalize_results(results)
    results.map do |result|
      if result.is_a?(Mode)
        [result.scale, result]
      else
        result
      end
    end
  end

  def add_key_context(results)
    results.map do |result|
      last_piece = [result].flatten.last

      if last_piece.respond_to?(:key) and (@key || last_piece.key)
        ([@key || last_piece.key] + [result].flatten)
      else
        result
      end
    end
  end

  def extract_key(query)
    query.gsub!(/(major|minor)$/i, "").to_s.strip!.to_s

    if match = /in ([a-gA-G](b|#)?)$/.match(query)
      query.gsub!(/in ([a-gA-G](b|#)?)$/, "").to_s.strip!.to_s
      @key = Key[match[1]]
    else
      nil
    end
  end
end
