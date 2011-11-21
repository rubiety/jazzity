class ExpandedMusicianInformation < ActiveRecord::Migration
  def up
    change_table :musicians do |t|
      t.string :twitter_username
      t.string :location
      t.string :external_avatar_url
      t.string :website_url
      t.decimal :time_zone_offset, :precision => 5, :scale => 2
    end
  end
end
