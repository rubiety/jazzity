class VoicingsController < ApplicationController
  before_filter :find_voicing, :except => [:index, :new, :create]

  def index
  end

  def show
  end


  protected

  def find_voicing
    @voicing = Voicing[params[:id]]
  end
end
