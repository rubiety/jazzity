class DiscussionCategoriesController < ApplicationController
  before_filter :find_discussion_categories
  before_filter :find_discussion_category, :except => [:index]

  respond_to :html, :json

  def index
    show
  end

  def show
    @discussions = (@discussion_category.try(:discussions) || Comment.roots).reorder("created_at desc")
    render :action => :show
  end


  protected

  def find_discussion_categories
    @discussion_categories = DiscussionCategory.all
  end

  def find_discussion_category
    @discussion_category = DiscussionCategory.find(params[:id]) if params[:id]
  end
end
