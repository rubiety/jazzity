class Meter < ActiveRecord::Base

  def to_s
    name
  end
  
  class << self
    def resolve(name)
      self.find_by_name(name)
    end
    alias_method :[], :resolve
  end

end
