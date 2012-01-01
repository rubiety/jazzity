amazon_config = YAML.load_file(Rails.root.join("config/amazon.yml"))

if amazon_config
  amazon_config = amazon_config[Rails.env.to_s]

  Amazon::Ecs.options = {
    :associate_tag => amazon_config["associate_tag"],
    :AWS_access_key_id => amazon_config["access_key_id"],       
    :AWS_secret_key => amazon_config["secret_key"]
  }
end
