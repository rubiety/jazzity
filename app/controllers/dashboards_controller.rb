class DashboardsController < ApplicationController
  def show
    if Rails.env.production?
      render :action => "landing", :layout => "landing"
    else
      @timeline_events = TimelineEvent.limit(16)
      @searchables = Searchable.limit(5).order("RAND()")
    end
  end
end
