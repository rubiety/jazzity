class TunesController < ApplicationController
  before_filter :find_tune, :except => [:index, :new, :create]

  def index
    @tunes = Tune.all
  end

  def show
  end


  protected

  def find_tune
    @tune = Tune.find(params[:id])
  end
end
