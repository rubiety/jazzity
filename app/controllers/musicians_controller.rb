class MusiciansController < ApplicationController
  before_filter :find_musician, :except => [:index, :search, :new, :create]

  respond_to :html, :json

  def index
    @musicians = Musician.order(:prominence).page(params[:page])
    @musicians = @musicians.search(params[:query]) if params[:query].present?
    @musicians = @musicians.instrument(Instrument.find(params[:instrument])) if params[:instrument].present?
    @musicians = @musicians.famous if params[:show] == "musicians" or params[:show].nil?
    @musicians = @musicians.members if params[:show] == "members"

    respond_with @musicians
  end

  def show
    flash.now[:warning] = "We're still seeding content for this page. Want to contribute?" if @musician.seeding?
    @timeline_events = @musician.timeline_events

    respond_with @musician
  end


  protected

  def find_musician
    @musician = Musician.find(params[:id])
  end
end
