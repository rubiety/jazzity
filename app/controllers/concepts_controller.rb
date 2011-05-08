class ConceptsController < ApplicationController
  before_filter :find_concept, :except => [:index, :new, :create]

  def index
    @concepts = Concept.all
  end

  def show
  end


  protected

  def find_concept
    @concept = Concept.find(params[:id])
  end
end
