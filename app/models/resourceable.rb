module Resourceable
  extend ActiveSupport::Concern

  included do
    has_many :resource_applications, :as => :resourceable
    has_many :resources, :through => :resource_applications
  end
end

