class Concept < ActiveRecord::Base
  extend FriendlyId
  include Commentable
  include Searchable::Model

  friendly_id :name, :use => :slugged

  validates :name, :presence => true

  define_searchables do
    searchables.create(:name => name)
  end

  def to_s
    name
  end

  def self.resolve(name)
    find_by_name(name)
  end

  class << self
    alias_method :[], :resolve
  end
end
