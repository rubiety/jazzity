class CommentsController < ApplicationController
  before_filter :find_commentable
  before_filter :find_comment, :except => [:index, :new, :create]

  respond_to :html, :json

  def index
    @comments = @commentable.comments
    respond_with @comments
  end

  def create
    @comment = @commentable.comments.build(params[:comment])
    @comment.author = current_musician
    @comment.save

    respond_with @comment do |format|
      format.html do
        flash[:notice] = "Comment Created"
      end
    end
  end
  
  def update
    @comment.attributes = params[:comment]
    @comment.save

    respond_with @comment do |format|
      format.html do
        flash[:notice] = "Comment Updated"
      end
    end
  end

  def destroy
    @comment.destroy
    respond_with @comment
  end


  protected

  # TODO: Base this dynamically off of model inclusions for Commentable
  def find_commentable
    [Chord, Concept, Mode, Musician, Progression, Tune, Voicing].each do |model|
      if model_id = params[model.name.underscore + "_id"]
        @commentable = model.find(model_id)
        return
      end
    end
  end

  def find_comment
    @comment = @commentable.comments.find(params[:id])
  end
end
