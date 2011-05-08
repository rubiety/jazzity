class ModesController < ApplicationController
  before_filter :find_scale
  before_filter :find_mode

  def index
    redirect_to scale
  end

  def show
  end


  protected

  def find_scale
    @scale = Scale.find(params[:scale_id])
  end

  def find_mode
    @mode = @scale.modes.find(params[:id])
  end
end
