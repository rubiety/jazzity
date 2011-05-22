class ChordSequencesController < ApplicationController
  before_filter :find_key
  before_filter :find_chord_sequence, :except => [:index]

  def index
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

  def find_chord_sequence
    @chord_sequence = ChordSequence[params[:id]]
    @chord_sequence = @chord_sequence.in_key_of(@key) if @key
  end
end
