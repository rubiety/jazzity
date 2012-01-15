class Musicians::AuthenticationsController < ApplicationController
  def facebook
    create
  end

  def twitter
    create
  end

  def create
    auth = request.env["omniauth.auth"]

    @musician = Musician.send("find_for_#{auth['provider']}_oauth", auth, current_musician)

    if @musician.persisted?
      flash[:notice] = I18n.t("devise.omniauth_callbacks.success", :kind => "Facebook")
      sign_in_and_redirect @musician, :event => :authentication
    else
      session["devise.omniauth_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def destroy
    @authentication = current_musician.authentications.find_by_provider(params[:id])
    @authentication.try(:destroy)

    flash[:notice] = "Successfully De-authenticated from #{params[:id].titleize}"
    redirect_to edit_musician_registration_path
  end

  def failure
    redirect_to root_path
  end
end
