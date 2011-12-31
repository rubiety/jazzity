class DiscussionCategory < ActiveRecord::Base
  extend FriendlyId
  include Commentable

  friendly_id :name, :use => :slugged

  def to_s
    name
  end

  def discussions
    if discussable_type
      Comment.roots.where(:commentable_type => discussable_type).order("created_at desc")
    else
      comments.roots.order("created_at desc")
    end
  end

  def recent_discussion
    discussions.first
  end
end
