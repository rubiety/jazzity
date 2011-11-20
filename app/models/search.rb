class Search
  def initialize(query)
    @query = query
  end
  
  def all
    returned = results(@query).flatten.compact
  end


  protected

  def results(query)
    Searchable.where("name LIKE ?", "%#{query}%")
  end
end
