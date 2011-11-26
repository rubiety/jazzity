class NoteSequencesController < ApplicationController
  before_filter :find_key
  before_filter :find_note_sequence, :except => [:index]

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

  def find_note_sequence
    @note_sequence = NoteSequence[params[:id]]
    @note_sequence = @note_sequence.in_key_of(@key) if @key
  end
end
