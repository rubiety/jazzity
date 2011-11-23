class MusicianFavorite < ActiveRecord::Base
  belongs_to :musician
  belongs_to :favorite_musician, :class_name => "Musician"

end
