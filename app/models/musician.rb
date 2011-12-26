class Musician < ActiveRecord::Base
  PROFILE_FIELDS = [
    :instrument_id, :secondary_instrument_id, :biography,
    :location, :external_avatar_url, :website_url, :time_zone_offset, :facebook_url, :twitter_username, :youtube_username,
    :music_school, :plays_professionally, :studies_privately, :avatar, :remote_avatar_url, :remove_avatar
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
  has_many :timeline_events, :as => :actor

  has_many :likes, :class_name => "MusicianLike", :dependent => :destroy
  has_many :liked_musicians, :through => :likes, :source => :likeable, :source_type => "Musician"
  has_many :liked_tunes, :through => :likes, :source => :likeable, :source_type => "Tune"

  scope :with_profile, where(:has_profile => true)
  scope :without_profile, where(:has_profile => false)
  scope :famous, where(:famous => true)

  friendly_id :name, :use => :slugged
  mount_uploader :avatar, AvatarUploader

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

  def clear_profile
    PROFILE_FIELDS.each do |field|
      self.send("#{field}=", nil)
    end

    update_attributes!(:has_profile => false)
    self
  end
end
