class ProgressionsController < ApplicationController
  before_filter :find_progression, :except => [:index, :new, :create]

  def index
    @progressions = Progression.all
  end

  def show
  end


  protected

  def find_progression
    @progression = Progression.find(params[:id])
  end
end
