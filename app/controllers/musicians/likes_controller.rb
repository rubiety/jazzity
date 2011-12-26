class Musicians::LikesController < ApplicationController
  before_filter :authenticate_musician!
  before_filter :find_musician
  before_filter :find_like, :except => [:index, :create]

  respond_to :html, :json

  def index
  end

  def create
    @like = @musician.likes.build(:likeable_id => params[:likeable_id], :likeable_type => params[:likeable_type])
    @like.save

    respond_with @like, :location => musicians_likes_path
  end

  def destroy
    @like.destroy
    
    respond_with @like, :location => musicians_likes_path
  end


  protected

  def find_musician
    @musician = current_musician
  end

  def find_like
    @like = @musician.likes.find(params[:id])
  end
end
