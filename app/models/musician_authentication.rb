class MusicianAuthentication < ActiveRecord::Base
  belongs_to :musician

  serialize :user_information, Hash

end
