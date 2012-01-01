class ConceptsController < ApplicationController
  before_filter :find_concept, :except => [:index, :new, :create]

  respond_to :html, :json

  def index
    @concepts = Concept.all
    respond_with @concepts
  end

  def show
    flash.now[:warning] = "We're still seeding content for this page. Want to contribute?" if @concept.seeding?
    respond_with @concept
  end


  protected

  def find_concept
    @concept = Concept.find(params[:id])
  end
end
