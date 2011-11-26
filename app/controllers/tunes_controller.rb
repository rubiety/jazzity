class TunesController < ApplicationController
  before_filter :find_tune, :except => [:index, :new, :create]

  respond_to :html, :json

  def index
    @tunes = Tune.page(params[:page])
    respond_with @tunes
  end

  def show
    respond_with @tune
  end


  protected

  def find_tune
    @tune = Tune.find(params[:id])
  end
end
