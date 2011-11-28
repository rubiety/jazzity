class CreateMusicians < ActiveRecord::Migration
  def change
    create_table :musicians do |t|
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.string :cached_slug
      t.string :avatar
      t.boolean :famous, :default => false, :null => false
      t.boolean :has_profile, :default => false, :null => false
      t.date :born_on
      t.date :died_on
      t.integer :prominence
      t.integer :instrument_id
      t.integer :secondary_instrument_id
      t.text :biography
      t.string :location
      t.string :website_url
      t.string :facebook_url
      t.string :twitter_username
      t.string :youtube_username
      t.string :external_avatar_url
      t.decimal :time_zone_offset, :precision => 5, :scale => 2
      t.boolean :plays_professionally, :default => false, :null => false
      t.boolean :studies_privately, :default => false, :null => false
      t.string :studies_privately_with
      t.string :music_school
      t.timestamps
      
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable
      t.confirmable
      t.token_authenticatable
    end

    add_index :musicians, :instrument_id
    add_index :musicians, :cached_slug, :unique => true
    add_index :musicians, :email
    add_index :musicians, :reset_password_token, :unique => true
    add_index :musicians, :confirmation_token,   :unique => true
    add_index :musicians, :authentication_token, :unique => true
    
    create_table :musician_authentications do |t|
      t.references :musician
      t.string :provider
      t.string :uid
      t.string :token
      t.string :secret
      t.text :user_information
      t.timestamps
    end
    
    add_index :musician_authentications, :musician_id
    
    create_table :musician_favorites do |t|
      t.references :musician
      t.integer :favorite_musician_id
      t.string :notes
      t.timestamps
    end
    
    add_index :musician_favorites, :musician_id
    add_index :musician_favorites, :favorite_musician_id

    create_table :musician_friendships do |t|
      t.references :musician
      t.integer :friend_musician_id
      t.string :state, :default => "invited"
    end
    
    add_index :musician_friendships, :musician_id
    add_index :musician_friendships, :friend_musician_id

    create_table :musician_tunes do |t|
      t.references :musician
      t.references :tune
      t.boolean :composed, :default => false, :null => false
      t.boolean :learning, :default => false, :null => false
      t.boolean :know, :default => false, :null => false
      t.timestamps
    end
    
    add_index :musician_tunes, :musician_id
    add_index :musician_tunes, :tune_id
    
    create_table :instruments do |t|
      t.string :name
      t.string :cached_slug
      t.timestamps
    end

    add_index :instruments, :cached_slug, :unique => true
  end
end
