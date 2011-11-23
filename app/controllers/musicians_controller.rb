class MusiciansController < ApplicationController
  before_filter :find_musician, :except => [:index, :new, :create]

  respond_to :html, :json

  def index
    @musicians = Musician.order(:prominence)
    respond_with @musicians
  end

  def show
    raise ActiveRecord::RecordNotFound unless @musician.has_profile? or @musician == current_musician
    respond_with @musician
  end


  protected

  def find_musician
    @musician = Musician.find(params[:id])
  end
end
