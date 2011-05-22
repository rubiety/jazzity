class ScalesController < ApplicationController
  before_filter :find_key
  before_filter :find_scale, :except => [:index, :new, :create]

  respond_to :html, :json

  def index
    @scales = Scale.scoped
    respond_with @scales
  end

  def show
    respond_with @scale
  end


  protected

  def find_key
    if params[:key_id]
      @key = Key.find(params[:key_id])
      @key = nil if @key.main?
    end
  end

  def find_scale
    @scale = Scale.find(params[:id])
    @scale = @scale.in_key_of(@key) if @key
    @mode = @scale.main_mode
    @mode = @mode.in_key_of(@key) if @key
  end
end
