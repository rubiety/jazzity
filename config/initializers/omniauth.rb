if config = YAML.load_file(Rails.root.join("config/omniauth.yml")).try(:[], Rails.env)

  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :twitter, config["twitter"]["consumer_key"], config["twitter"]["consumer_key"] if config["twitter"]
    provider :facebook, config["facebook"]["app_id"], config["app_secret"] if config["facebook"]
    provider :linked_in, config["linked_in"]["consumer_key"], config["linked_in"]["consumer_secret"] if config["linked_in"]
  end

end
