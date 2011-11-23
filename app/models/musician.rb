class Musician < ActiveRecord::Base
  PROFILE_FIELDS = [
    :instrument, :biography,
    :location, :external_avatar_url, :website_url, :time_zone_offset, :twitter_username,
    :secondary_instrument
  ]

  attr_accessible *(PROFILE_FIELDS + [
    :first_name, :last_name, :nickname, :slug, :email, :password, :password_confirmation, 
    :remember_me, :has_profile
  ])
  
  extend FriendlyId
  include Searchable::Model
  include Musician::Authentication
  include Commentable
  
  has_many :searchables, :as => :model
  belongs_to :instrument
  belongs_to :secondary_instrument, :class_name => "Instrument"

  has_many :musician_favorites
  has_many :favorite_musicians, :through => :musician_favorites, :source => :favorite_musician
  has_many :musician_friendships
  has_many :musician_friends, :through => :musician_friendships, :source => :friend_musician
  has_many :musician_tunes
  has_many :tunes, :through => :musician_tunes

  scope :with_profile, where(:has_profile => true)
  scope :without_profile, where(:has_profile => false)

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

  def has_avatar?
    avatar_url.present?
  end

  def avatar_url
    external_avatar_url  # TODO: Implement Internal Avatar
  end

  def clear_profile
    PROFILE_FIELDS.each do |field|
      self.send("#{field}=", nil)
    end

    update_attributes!(:has_profile => false)
    self
  end
end
