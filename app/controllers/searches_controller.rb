class SearchesController < ApplicationController
  def create
    redirect_to :action => :show, :id => params[:query]
  end

  def show
    @search = Search.new(params[:id])
    @results = @search.all

    if @results.size == 0
      redirect_to root_path, :notice => "Sorry, but no results were found."
    elsif @results.size == 1
      redirect_to @results[0]
    else
      render :action => :show
    end
  end
end
