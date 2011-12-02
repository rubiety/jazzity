class Musicians::FavoriteMusiciansController < ApplicationController
  before_filter :authenticate_musician!
  before_filter :find_musician
  before_filter :find_favorite_musician, :only => [:create]

  respond_to :html, :json

  def index
    @musician.musician_favorites.build
  end

  def create
    @musician_favorite = @musician.musician_favorites.build
    @musician_favorite.favorite_musician = @favorite_musician
    @musician_favorite.save

    respond_with @musician_favorite, :location => musicians_favorite_musicians_path
  end


  protected

  def find_musician
    @musician = current_musician
  end

  def find_favorite_musician
    @favorite_musician = Musician.find(params[:favorite_musician_id])
  end
end

