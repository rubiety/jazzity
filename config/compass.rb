# BEFORE COMPASS WATCH:
#
# # This configuration file works with both the Compass command line tool and within Rails.
# require 'html5-boilerplate'
# # Require any additional compass plugins here.
# 
# project_type = :rails
# project_path = Compass::AppIntegration::Rails.root
# # Set this to the root of your project when deployed:
# http_path = "/"
# css_dir = "public/stylesheets"
# sass_dir = "app/stylesheets"
# environment = Compass::AppIntegration::Rails.env
# # To enable relative paths to assets via compass helper functions. Uncomment:
# # relative_assets = true


# TEMPORARY:
# Set this to the root of your project when deployed:
require "html5-boilerplate"
require "fancy-buttons"

project_type      = :stand_alone

http_path         = "/assets/"

css_dir           = "app/assets/stylesheets/"
sass_dir          = "app/compass/"
images_dir        = "app/assets/images/"
http_images_path  = "/assets/"
javascripts_dir   = "js"

line_comments     = true
project_type      = :stand_alone # can be :stand_alone or :rails.
output_style      = :expanded # :nested, :expanded, :compact, or :compressed.
relative_assets   = false
