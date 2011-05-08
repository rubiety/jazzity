class MusiciansController < ApplicationController
  before_filter :find_musician, :except => [:index, :new, :create]

  def index
    @musicians = Musician.order(:prominence)
  end

  def show
  end


  protected

  def find_musician
    @musician = Musician.find(params[:id])
  end
end
