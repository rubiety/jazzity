module Commentable
  extend ActiveSupport::Concern

  included do
    has_many :comments, :as => :commentable, :order => "created_at DESC"
  end
end

