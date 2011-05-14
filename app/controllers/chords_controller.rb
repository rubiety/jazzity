class ChordsController < ApplicationController
  before_filter :find_key
  before_filter :find_chord, :except => [:index, :new, :create]

  respond_to :html, :json

  def index
    @chord_qualities = ChordQuality.includes(:chords)
    respond_with @chord_qualities
  end

  def show
    respond_with @chord_quality
  end


  protected

  def find_key
    if params[:key_id]
      @key = Key.find(params[:key_id])
      @key = nil if @key.main?
    end
  end

  def find_chord
    @chord = Chord.find(params[:id])
    @chord.in_key_of(@key) if @key
  end
end
