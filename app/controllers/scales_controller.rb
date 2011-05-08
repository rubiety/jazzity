class ScalesController < ApplicationController
  before_filter :find_scale, :except => [:index, :new, :create]

  def index
    @scales = Scale.all
  end

  def show
  end


  protected

  def find_scale
    @scale = Scale[params[:id]]
  end
end
