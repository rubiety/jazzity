class DiscussionsController < ApplicationController
  before_filter :find_discussion_categories
  before_filter :find_discussion_category
  before_filter :find_discussion, :except => [:index, :new, :create]
  before_filter :find_commentable, :only => [:create]

  respond_to :html, :json

  def index
    redirect_to @discussion_category
  end

  def show
    respond_with @discussion
  end

  def new
  end

  def create
    @discussion = @commentable.comments.build(params[:comment])
    @discussion.author = current_musician
    
    if @discussion.save
      @discussion.move_to_left_of(@commentable.comments.first) if @commentable.comments.first != @discussion
    end

    respond_with @discussion do |format|
      format.html do
        redirect_to discussion_category_path(@discussion_category), :notice => "Discussion Created"
      end
    end
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

  def find_commentable
    # Try to find an actual object commentable:
    [Chord, Concept, Mode, Musician, Progression, Tune, Voicing].each do |model|
      if model_id = params[model.name.underscore + "_id"]
        @commentable = model.find(model_id)
        return
      end
    end

    # Otherwise, just attach to the discussion category:
    @commentable = @discussion_category
  end
end
