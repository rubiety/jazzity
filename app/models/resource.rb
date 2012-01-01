class Resource < ActiveRecord::Base
  has_many :applications, :class_name => "ResourceApplication"

  attr_accessor :provider_response

  def title
    name
  end

  def self.from_provider!(hash)
    from_provider(hash).save!
  end
end

