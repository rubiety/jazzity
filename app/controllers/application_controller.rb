class ApplicationController < ActionController::Base
  protect_from_forgery

  if Rails.env.staging?
    before_filter :authenticate_staging
    
    def authenticate_staging
      authenticate_or_request_with_http_basic do |username, password|
        username == 'oscar' && password == 'peterson'
      end
    end
  end
  
  if Rails.env.production?
    before_filter :force_landing_page
    
    def force_landing_page
      unless request.path == "/"
        redirect_to "/"
        return false
      end
    end
  end

  def after_sign_in_path_for(resource_or_scope)
    if request.env['omniauth.origin']
      request.env['omniauth.origin']
    end
  end
  


  protected

  def path_to_searchable(searchable)
    path_to_model(searchable.target)
  end

  def path_to_model(model)
    if model.is_a?(Mode)
      [(model.respond_to?(:key) ? model.key : nil), model.scale, model].compact
    elsif model.is_a?(Voicing)
      [(model.respond_to?(:key) ? model.key : nil), model.chord, model].compact
    else
      [(model.respond_to?(:key) ? model.key : nil), model].compact
    end
  end

  # Applies Textile and StaffNotation parsers to produce HTML
  def text_to_html(text)
    RedCloth.new(StaffNotation.parse(text)).to_html
  end

  helper_method :path_to_searchable
  helper_method :path_to_model
  helper_method :text_to_html
  
end
