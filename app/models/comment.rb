class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  belongs_to :author, :class_name => "Musician"
  has_many :timeline_events, :as => :subject, :dependent => :destroy

  acts_as_nested_set :scope => :commentable if table_exists?

  attr_accessible :subject, :content

  validates :content, :presence => true

  fires :new_comment, :on => :create, :actor => :author, :secondary_subject => :commentable

  def to_param
    if subject
      "#{id}-#{subject.parameterize}"
    else
      super
    end
  end

  def discussion_category
    if commentable.is_a?(DiscussionCategory)
      commentable
    else
      DiscussionCategory.with_discussable_type(commentable_type).first
    end
  end

  # This is copied from ApplicationController. I am a very, very bad person for this.
  def html_content
    RedCloth.new(StaffNotation.parse(content)).to_html
  end
  
  def as_json(options = nil)
    super.slice("id", "author_id", "parent_id", "lft", "rgt", "content", "created_at").tap do |o|
      o["subject"] = subject.presence
      o["author_name"] = author.try(:name)
      o["author_param"] = author.try(:to_param)
      o["author_avatar_url"] = author.avatar_url
      o["html_content"] = html_content
      o["children_attributes"] = children.as_json(options)
    end
  end
end

