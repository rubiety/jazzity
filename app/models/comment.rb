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
end
