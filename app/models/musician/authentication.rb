module Musician::Authentication
  extend ActiveSupport::Concern

  included do
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :token_authenticatable, :omniauthable

    has_many :authentications, :class_name => "MusicianAuthentication", :dependent => :destroy
  end

  module InstanceMethods
    def authenticated_with?(service)
      authentications.where(:provider => service).exists?
    end
  end

  module ClassMethods

    def new_with_session(params, session)
      super.tap do |musician|
        if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["user_hash"]
          musician.email = data["email"]
          musician.first_name = data["first_name"]
          musician.last_name = data["last_name"]
        end
      end
    end

    def find_for_facebook_oauth(access_token, signed_in_resource = nil)
      uid = access_token["uid"]
      token = access_token["credentials"]["token"]
      data = access_token["extra"]["raw_info"]
      info = access_token["info"]

      if authentication = MusicianAuthentication.find_by_provider_and_uid("facebook", uid)
        authentication.musician
      else
        Musician.create!(
          :first_name => data["first_name"], 
          :last_name => data["last_name"], 
          :email => data["email"], 
          :encrypted_password => Devise.friendly_token[0,20],
          :biography => data["bio"],
          :location => info["location"],
          :remote_avatar_url => info["image"],
          :facebook_url => data["link"],
          :website_url => nil,
          :time_zone_offset => data["timezone"]
        ).tap do |musician|
          musician.authentications.create!(:provider => "facebook", :uid => uid, :token => token, :user_information => data)
        end
      end
    end

    def find_for_twitter_oath(access_token, signed_in_resource = nil)
      uid = access_token["uid"]
      token = access_token["credentials"]["token"]
      secret = access_token["credentials"]["secret"]
      data = access_token["info"]

      if authentication = MusicianAuthentication.find_by_provider_and_uid("twitter", uid)
        authentication.musician
      else
        Musician.create!(
          :first_name => data["first_name"], 
          :last_name => data["last_name"], 
          :email => data["email"], 
          :encrypted_password => Devise.friendly_token[0,20],
          :biography => data["description"],
          :location => data["location"],
          :remote_avatar_url => data["image"],
          :website_url => (data["urls"] || []).first,
          :twitter_username => data["nickname"]
        ).tap do |musician|
          musician.authentications.create!(:provider => "twitter", :uid => uid, :token => token, :secret => secret, :user_information => data)
        end
      end
    end

  end
end
