source "http://rubygems.org"
ruby "2.1.2"

# Core Gems
gem "rails", "3.2.21"
gem "mysql2"

# Asset Template Engines
gem "sass-rails"
gem "coffee-rails"
gem "uglifier"
gem "jquery-rails"
gem "rails3-jquery-autocomplete"

# Views
gem "haml"
gem "haml-rails"
gem "html5-rails"
gem "compass-rails"
gem "compass-h5bp"
gem "compass-susy-plugin", :require => "susy"

# Bread & Butter Gems
gem "acts_as_list"
gem "acts_as_tree"
gem "fancy-buttons"
gem "simple_form"
gem "paperclip"
gem "friendly_id"
gem "awesome_nested_set"
gem "timeline_fu"
gem "kaminari"
gem "mini_magick"
gem "carrierwave"
gem "RedCloth"

# API Integration
gem "twitter"
gem "itunes"
gem "amazon-ecs", :require => "amazon/ecs"

# Authentication
gem "devise"
gem "omniauth"
gem "omniauth-facebook"
gem "omniauth-twitter"

# Administration
gem "activeadmin"
gem "meta_search"

# Temporary: Fixes
gem "curb", "0.7.15"

# PNG Conversion
gem "capybara"
gem "capybara-webkit"

group :development do
  gem "thin"
  gem "capistrano"
end

group :test do
  gem "turn", :require => false
  gem "minitest"
  gem "faker"
  gem "rspec-rails"
  gem "database_cleaner"
  gem "launchy"
  gem "pickle"
  gem "shoulda-matchers"
  gem "growl"
  gem "spork", ">= 0.9.0.rc5"
end

group :development, :test do
  gem "factory_girl_rails"
  gem "guard"
  gem "guard-bundler"
  gem "guard-rspec"
  gem "guard-spork"
  gem "rb-inotify", :require => false
  gem "rb-fsevent", :require => false
  gem "rb-fchange", :require => false
end

