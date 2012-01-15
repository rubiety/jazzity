class ModesController < ApplicationController
  before_filter :set_body_class
  before_filter :find_key
  before_filter :find_scale
  before_filter :find_mode
  before_filter :find_scales

  respond_to :html, :json

  def index
    redirect_to scale
  end

  def show
    if @mode.main?
      redirect_to [@key, @scale].compact
    else
      respond_with @scale, @mode do |format|
        format.html { render "scales/show" }
      end
    end
  end

  def staff
    respond_with @scale do |format|
      format.html { render :template => "scales/staff", :layout => "staff" }
    end
  end


  protected

  def set_body_class
    @body_class = "scales"
  end

  def find_key
    if params[:key_id]
      @key = Key[params[:key_id]]
      @key = nil if @key.main?
    end
  end

  def find_scale
    @scale = Scale.find(params[:scale_id])
    @scale = @scale.in_key_of(@key) if @key
  end

  def find_mode
    @mode = @scale.modes.find(params[:id])
    @mode = @mode.in_key_of(@key) if @key
  end

  def find_scales
    @scales = Scale.scoped(:include => [:modes])
  end
end
