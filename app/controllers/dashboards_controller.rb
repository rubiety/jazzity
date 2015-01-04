class DashboardsController < ApplicationController
  def show
    if Rails.env.production?
      render :action => "landing", :layout => "landing"
    else
      @searchables = Searchable.limit(5).order("RAND()")
    end
  end
end
