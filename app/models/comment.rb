class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  belongs_to :author, :class_name => "Musician"

  attr_accessible :subject, :content

  validates :content, :presence => true

  def up_vote
    increment!(:votes)
  end

  def down_vote
    decrement!(:votes)
  end

  def as_json(options = nil)
    super.slice("id", "author_id", "content", "subject", "created_at", "votes").tap do |o|
      o["author_name"] = author.try(:name)
      o["author_avatar_url"] = author.avatar_url
    end
  end
end
