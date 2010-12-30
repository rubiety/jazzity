class ProgressionsController < ApplicationController
  before_filter :find_progression, :except => [:index, :new, :create]

  def index
  end

  def show
  end


  protected

  def find_progression
    @progression = Progression[params[:id]]
  end
end
