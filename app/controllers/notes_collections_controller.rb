class NotesCollectionsController < ApplicationController
  before_filter :find_key
  before_filter :find_notes_collection, :except => [:index]

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

  def find_notes_collection
    @notes_collection = NotesCollection[params[:id]]
    @notes_collection = @notes_collection.in_key_of(@key) if @key
  end
end
