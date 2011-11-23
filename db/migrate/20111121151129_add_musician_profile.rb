class AddMusicianProfile < ActiveRecord::Migration
  def up
    change_table :musicians do |t|
      t.boolean :famous, :default => false, :null => false
      t.boolean :has_profile, :default => false, :null => false
      t.string :youtube_username
      t.integer :secondary_instrument_id
      t.boolean :plays_professionally, :default => false, :null => false
      t.boolean :studies_privately, :default => false, :null => false
      t.string :studies_privately_with
      t.string :music_school
    end

    create_table :musician_favorites do |t|
      t.references :musician
      t.integer :favorite_musician_id
      t.string :notes
      t.timestamps
    end

    create_table :musician_friendships do |t|
      t.references :musician
      t.integer :friend_musician_id
      t.string :state, :default => "invited"
    end

    create_table :musician_tunes do |t|
      t.references :musician
      t.references :tune
      t.boolean :composed, :default => false, :null => false
      t.boolean :learning, :default => false, :null => false
      t.boolean :know, :default => false, :null => false
      t.timestamps
    end
  end
end

