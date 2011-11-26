class Musician < ActiveRecord::Base
  PROFILE_FIELDS = [
    :instrument_id, :secondary_instrument_id, :biography,
    :location, :external_avatar_url, :website_url, :time_zone_offset, :twitter_username, :youtube_username,
    :music_school, :plays_professionally, :studies_privately
  ]

  attr_accessible *(PROFILE_FIELDS + [
    :first_name, :last_name, :nickname, :slug, :email, :password, :password_confirmation, 
    :remember_me, :has_profile, 
    :musician_favorites_attributes, :musician_friendships_attributes, :musician_tunes_attributes
  ])
  
  extend FriendlyId
  include Searchable::Model
  include Musician::Authentication
  include Commentable
  
  belongs_to :instrument
  belongs_to :secondary_instrument, :class_name => "Instrument"

  has_many :musician_favorites, :dependent => :destroy
  has_many :favorite_musicians, :through => :musician_favorites, :source => :favorite_musician
  has_many :musician_friendships, :dependent => :destroy
  has_many :musician_friends, :through => :musician_friendships, :source => :friend_musician
  has_many :musician_tunes, :dependent => :destroy
  has_many :tunes, :through => :musician_tunes

  accepts_nested_attributes_for :musician_favorites, :allow_destroy => true, :reject_if => lambda {|m| m["favorite_musician_id"].blank? }
  accepts_nested_attributes_for :musician_friendships, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :musician_tunes, :allow_destroy => true, :reject_if => lambda {|m| m["tune_id"].blank? }

  scope :with_profile, where(:has_profile => true)
  scope :without_profile, where(:has_profile => false)
  scope :famous, where(:famous => true)

  friendly_id :name, :use => :slugged

  validates :first_name, :presence => true
  validates :last_name, :presence => true

  define_searchables do
    searchables.create(:name => name) if famous?
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
