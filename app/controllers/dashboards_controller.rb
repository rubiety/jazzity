class DashboardsController < ApplicationController
  def show
    if Rails.env.production?
      render :action => "landing", :layout => "landing"
    end
  end
end
