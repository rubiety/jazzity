class ResourceApplication < ActiveRecord::Base
  belongs_to :resource
  belongs_to :resourceable, :polymorphic => true
end
