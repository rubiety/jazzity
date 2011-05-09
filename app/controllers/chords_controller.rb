class ChordsController < ApplicationController
  before_filter :find_key
  before_filter :find_chord, :except => [:index, :new, :create]

  def index
    @chord_qualities = ChordQuality.includes(:chords)
  end

  def show
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
