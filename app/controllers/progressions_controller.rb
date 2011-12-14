class ProgressionsController < ApplicationController
  before_filter :find_key
  before_filter :find_progression, :except => [:index, :new, :create]

  respond_to :html, :json

  def index
    @progressions = Progression.all
    respond_with @progressions
  end

  def show
    respond_with @progression
  end


  protected

  def find_key
    if params[:key_id]
      @key = Key[params[:key_id]]
      @key = nil if @key.main?
    end
  end

  def find_progression
    @progression = Progression.find(params[:id])
    @progression = @progression.in_key_of(@key) if @key
  end
end
