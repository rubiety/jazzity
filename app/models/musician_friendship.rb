class MusicianFriendship < ActiveRecord::Base
  belongs_to :musician
  belongs_to :friend_musician, :class_name => "Musician"

end
