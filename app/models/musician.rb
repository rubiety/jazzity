class Musician < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :remember_me, 
                  :first_name, :last_name, :nick_name, :slug, :instrument, :biography
  
  extend FriendlyId
  include Searchable::Model
  include Musician::Authentication
  
  has_many :searchables, :as => :model
  belongs_to :instrument

  friendly_id :name, :use => :slugged

  validates :first_name, :presence => true
  validates :last_name, :presence => true

  define_searchables do
    searchables.create(:name => name)
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def to_s
    name
  end
end
