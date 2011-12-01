module Commentable
  extend ActiveSupport::Concern

  included do
    has_many :comments, :as => :commentable, :order => "created_at ASC"
  end
end

