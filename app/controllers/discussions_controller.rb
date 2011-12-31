class DiscussionsController < ApplicationController
  before_filter :find_discussion_categories
  before_filter :find_discussion_category
  before_filter :find_discussion, :except => [:new, :create]

  respond_to :html, :json

  def show
    respond_with @discussion
  end

  protected

  def find_discussion_categories
    @discussion_categories = DiscussionCategory.all
  end

  def find_discussion_category
    @discussion_category = DiscussionCategory.find(params[:discussion_category_id]) if params[:discussion_category_id]
  end

  def find_discussion
    @discussion = Comment.roots.find(params[:id])
  end
end
