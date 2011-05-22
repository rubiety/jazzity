class ProgressionsController < ApplicationController
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

  def find_progression
    @progression = Progression.find(params[:id])
  end
end
