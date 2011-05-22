class VoicingsController < ApplicationController
  before_filter :find_voicing, :except => [:index, :new, :create]

  respond_to :html, :json

  def index
    @voicings = Voicing.all
    respond_with @voicings
  end

  def show
    respond_with @voicing
  end


  protected

  def find_voicing
    @voicing = Voicing[params[:id]]
  end
end
