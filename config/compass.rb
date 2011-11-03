# Note:
# Place this file within the config directory of your Rails 3.1 Application
##########################################################################################

# This configuration file works with both the Compass command line tool and within Rails.
# Require any additional compass plugins here.
project_type = :rails

# Set this to the root of your project when deployed:
http_path = "/"
css_dir = "app/assets/stylesheets"
sass_dir = "app/assets/stylesheets"
images_dir = "app/assets/images"
javascripts_dir = "app/assets/javascripts"

output_style = :compressed

# To enable relative paths to assets via compass helper functions. Uncomment:
relative_assets = true

line_comments = true


# If you prefer the indented syntax, you might want to regenerate this
# project again passing --syntax sass, or you can uncomment this:
# preferred_syntax = :sass
# and then run:
# sass-convert -R --from scss --to sass public/sass scss && rm -rf sass && mv scss sass
preferred_syntax = :scss
