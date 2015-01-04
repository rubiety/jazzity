class ConceptsController < ApplicationController
  before_filter :find_concept, :except => [:index, :new, :create]

  respond_to :html, :json

  def index
    @concept_families = ConceptFamily.all

    respond_with @concept_families do |format|
      format.json { render :json => @concept_families.to_json(:include => [:progressions]) }
    end
  end

  def show
    flash.now[:warning] = "We're still seeding content for this page. Want to <a href='/contribute'>contribute some content</a>?" if @concept.seeding?
    respond_with @concept
  end


  protected

  def find_concept
    @concept = Concept.find(params[:id])
  end
end
