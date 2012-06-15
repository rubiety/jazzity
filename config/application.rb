require File.expand_path('../boot', __FILE__)

require 'rails/all'

# If you have a Gemfile, require the gems listed there, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env) if defined?(Bundler)

module Jazzity
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Custom directories with classes and modules you want to be autoloadable.
    # config.autoload_paths += %W(#{config.root}/extras)

    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named.
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

    # Activate observers that should always be running.
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Please note that JavaScript expansions are *ignored altogether* if the asset
    # pipeline is enabled (see config.assets.enabled below). Put your defaults in
    # app/assets/javascripts/application.js in that case.
    #
    # JavaScript files you want as :defaults (application.js is always included).
    # config.action_view.javascript_expansions[:defaults] = %w(jquery jquery_ujs)

    # Configure ActiveRecord::Base to never include root (for Backbone.js integration)
    config.active_record.include_root_in_json = false

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    # Enable IdentityMap for Active Record, to disable set to false or remove the line below.
    config.active_record.identity_map = false  # We can't enable this due to KeyContext and other mechanisms of changing state on individual objects which might have the same "identity"

    # Enable the asset pipeline
    config.assets.enabled = true
    config.assets.precompile += ["handheld.css.scss", "ie6.css.scss"]

    # Sass Config
    config.compass.require "susy"
    
    # Configure Tools
    config.generators do |g|
      g.orm :active_record
      g.template_engine :haml
      g.test_framework :rspec, :fixture => true, :views => false
      g.integration_tool :rspec
      g.fixture_replacement :factory_girl, :dir => "spec/factories"
    end
  end
end
