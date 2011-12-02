class Musicians::TunesController < ApplicationController
  before_filter :authenticate_musician!
  before_filter :find_musician
  before_filter :find_tune, :only => [:create]

  respond_to :html, :json

  def index
    @musician.musician_tunes.build
  end

  def create
    @musician_tune = @musician.musician_tunes.build
    @musician_tune.tune = @tune
    @musician_tune.save

    respond_with @musician_tune, :location => musicians_tunes_path
  end


  protected

  def find_musician
    @musician = current_musician
  end

  def find_tune
    @tune = Tune.find(params[:tune_id])
  end
end

