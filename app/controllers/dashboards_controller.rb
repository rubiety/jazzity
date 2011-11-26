class DashboardsController < ApplicationController
  def show
    if Rails.env.production?
      render :action => "landing", :layout => "landing"
    else
      @timeline_events = TimelineEvent.all
    end
  end
end
