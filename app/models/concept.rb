class Concept < ActiveRecord::Base
  extend FriendlyId
  include Searchable::Model
  include Commentable
  include Resourceable

  has_many :tune_concepts, :dependent => :destroy
  has_many :tunes, :through => :tune_concepts

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
