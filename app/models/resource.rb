class Resource < ActiveRecord::Base
  has_many :applications, :class_name => "ResourceApplication", :dependent => :destroy

  scope :itunes_tracks, where(:type => "Resource::ItunesTrack")
  scope :itunes_apps, where(:type => "Resource::ItunesApp")
  scope :amazon_books, where(:type => "Resource::AmazonBook")

  scope :random, order("RAND()")

  attr_accessor :provider_response

  def title
    name
  end

  def type_code
    type.gsub("Resource::", "").underscore
  end

  def self.from_provider!(hash)
    from_provider(hash).save!
  end
end

