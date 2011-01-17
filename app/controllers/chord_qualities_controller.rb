class ChordQualitiesController < ApplicationController
  before_filter :find_chord_quality, :except => [:index, :new, :create]

  def index
  end

  def show
  end


  protected

  def find_chord_quality
    @chord_quality = ChordQuality[params[:id]]
  end
end
