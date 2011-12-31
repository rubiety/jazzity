class DiscussionCategory < ActiveRecord::Base
  extend FriendlyId
  include Commentable

  scope :with_discussable_type, lambda {|t| where("discussable_type = ? OR discussable_type_2 = ?", t, t) }

  friendly_id :name, :use => :slugged

  def to_s
    name
  end

  def discussable_types
    [discussable_type, discussable_type_2].reject(&:blank?)
  end

  def discussions
    Comment.roots.order("created_at desc").where("commentable_type IN (?) OR (commentable_type = 'DiscussionCategory' AND commentable_id = ?)", discussable_types, id)
  end

  def recent_discussion
    discussions.first
  end
end
