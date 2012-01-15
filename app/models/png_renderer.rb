require "capybara/rails"

class PngRenderer
  include Capybara::DSL

  DEFAULT_PATH = Rails.root.join("public/images/rendered")
  
  def initialize(url)
    @url = url
  end

  def render(file_path = nil)
    Capybara.current_driver = :webkit

    visit @url
    page.driver.render file_path || "#{DEFAULT_PATH}#{@url}.png"
  end
end

