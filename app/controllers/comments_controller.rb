class CommentsController < ApplicationController
  before_filter :find_commentable
  before_filter :find_comment, :except => [:index, :new, :create]

  respond_to :html, :json

  def create
    @comment = @commentable.comments.build(params[:comment])
    @comment.author = current_musician

    flash[:notice] = "Comment Created" if @comment.save
    respond_with @comment
  end
  
  def update
    @comment.attributes = params[:comment]

    flash[:notice] = "Comment Updated" if @comment.save
    respond_with @comment
  end

  def destroy
    @comment.destroy
    respond_with @comment
  end


  protected

  # TODO: Base this dynamically off of model inclusions for Commentable
  def find_parent
    [Chord, Concept, Mode, Musician, Progression, Tune, Voicing].each do |model|
      if model_id = params[model.name.underscore + "_id"]
        @commentable = model.find(model_id)
        return
      end
    end
  end
end
