class ChordNoteSequencesController < ApplicationController
  before_filter :find_key
  before_filter :find_chord_note_sequence, :except => [:index]

  def index
  end

  def show
  end

  protected

  def find_key
    if params[:key_id]
      @key = Key[params[:key_id]]
      @key = nil if @key.main?
    end
  end

  def find_chord_note_sequence
    @chord_note_sequence = ChordNoteSequence[params[:id]]
    @chord_note_sequence = @chord_note_sequence.in_key_of(@key) if @key
  end
end
