class ChordsController < ApplicationController
  before_filter :find_chord, :except => [:index, :new, :create]

  def index
  end

  def show
  end


  protected

  def find_chord
    @chord = Chord[params[:id]]
  end
end
