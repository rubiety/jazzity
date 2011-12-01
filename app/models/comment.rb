class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  belongs_to :author, :class_name => "Musician"
  has_many :timeline_events, :as => :subject, :dependent => :destroy

  acts_as_nested_set if table_exists?

  attr_accessible :content

  validates :content, :presence => true

  fires :new_comment, :on => :create, :actor => :author, :secondary_subject => :commentable

  def as_json(options = nil)
    super.slice("id", "author_id", "parent_id", "lft", "rgt", "content", "created_at").tap do |o|
      o["author_name"] = author.try(:name)
      o["author_avatar_url"] = author.avatar_url
      o["children_attributes"] = children.as_json(options)
    end
  end
end

