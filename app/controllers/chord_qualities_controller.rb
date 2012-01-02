class ChordQualitiesController < ApplicationController
  before_filter :set_body_class
  before_filter :find_chord_quality, :except => [:index, :new, :create]

  respond_to :html, :json

  def index
    @chord_qualities = ChordQuality.all
    respond_with @chord_qualities
  end

  def show
    respond_with @chord_quality
  end


  protected

  def set_body_class
    @body_class = "chords"
  end

  def find_chord_quality
    @chord_quality = ChordQuality[params[:id]]
  end
end
