class ScalesController < ApplicationController
  before_filter :find_key
  before_filter :find_scale, :except => [:index, :new, :create]
  before_filter :find_scales

  respond_to :html, :json

  def index
    respond_with @scales
  end

  def show
    respond_with @scale
  end

  def staff
    respond_with @scale do |format|
      format.html { render :layout => "staff" }
    end
  end


  protected

  def find_key
    if params[:key_id]
      @key = Key[params[:key_id]]
      @key = nil if @key.main?
    end
  end

  def find_scale
    @scale = Scale.find(params[:id])
    @scale = @scale.in_key_of(@key) if @key
    @mode = @scale.main_mode
    @mode = @mode.in_key_of(@key) if @key
  end

  def find_scales
    @scales = Scale.scoped(:include => [:modes])
  end
end
