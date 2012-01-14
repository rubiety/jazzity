class TunesController < ApplicationController
  before_filter :find_tune, :except => [:index, :search, :new, :create]
  before_filter :find_filters, :only => [:index, :search]

  respond_to :html, :json

  def index
    @tunes = Tune.scoped
    respond_with @tunes
  end

  def search
    @tunes = Tune.search(params[:query]).page(params[:page])
    @tunes = @tunes.with_vehicle(@vehicle) if @vehicle
    @tunes = @tunes.with_form(@form) if @form
    @tunes = @tunes.with_meter(@meter) if @meter
    @tunes = @tunes.search(params[:query]) if params[:query].present?

    respond_with @tunes
  end

  def show
    flash.now[:warning] = "We're still seeding content for this page. Want to contribute?" if @tune.seeding?
    respond_with @tune
  end


  protected

  def find_tune
    @tune = Tune.find(params[:id])
  end

  def find_filters
    @vehicle = Vehicle.find(params[:vehicle_id]) if params[:vehicle_id].present?
    @form = Form.find(params[:form_id]) if params[:form_id].present?
    @meter = Meter.find(params[:meter_id]) if params[:meter_id].present?
  end
end
