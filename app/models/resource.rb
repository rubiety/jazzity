class Resource < ActiveRecord::Base
  has_many :applications, :class_name => "ResourceApplication"

  def title
    name
  end
end

