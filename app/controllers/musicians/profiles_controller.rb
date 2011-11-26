class Musicians::ProfilesController < ApplicationController
  before_filter :find_musician

  respond_to :html, :json

  def show
    redirect_to :action => :edit
  end

  def edit
    @musician.musician_favorites.build
  end

  def privacy
  end

  def update
    @musician.has_profile = true
    @musician.attributes = params[:musician]

    if @musician.save
      flash[:notice] = "Profile Updated"
      redirect_to :action => :edit
    else
      render :action => :edit
    end
  end

  def destroy
    @musician.clear_profile

    flash[:notice] = "Profile has been deleted."
    redirect_to root_path
  end

  
  protected

  def find_musician
    @musician = current_musician
  end
end
