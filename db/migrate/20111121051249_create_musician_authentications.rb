class CreateMusicianAuthentications < ActiveRecord::Migration
  def change
    create_table :musician_authentications do |t|
      t.references :musician
      t.string :provider
      t.string :uid
      t.string :token
      t.string :secret
      t.text :user_information
      t.timestamps
    end
  end
end
