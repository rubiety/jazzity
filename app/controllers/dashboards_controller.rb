class DashboardsController < ApplicationController
  def show
    if Rails.env.production?
      render :action => "landing", :layout => "landing"
    else
      @timeline_events = TimelineEvent.limit(30)
    end
  end
end
