class ChordsController < ApplicationController
  before_filter :find_key
  before_filter :find_chord, :except => [:index, :new, :create]
  before_filter :find_chord_qualities

  respond_to :html, :json

  def index
    respond_with @chord_qualities do |format|
      format.json { render :json => @chord_qualities.to_json(:include => [:chords]) }
    end
  end

  def show
    respond_with @chord
  end


  protected

  def find_key
    if params[:key_id]
      @key = Key[params[:key_id]]
      @key = nil if @key.main?
    end
  end

  def find_chord
    @chord = Chord.find(params[:id])
    @chord = @chord.in_key_of(@key) if @key
  end

  def find_chord_qualities
    @chord_qualities = ChordQuality.includes(:chords)
  end
end
