module Commentable
  extend ActiveSupport::Concern

  included do
    has_many :comments, :as => :commentable, :order => "points DESC, created_at DESC"
  end
end

