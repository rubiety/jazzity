class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :type
      t.string :subtype
      t.string :identifier
      t.string :name
      t.string :collection_identifier
      t.string :collection_name
      t.integer :collection_track_number
      t.string :author_identifier
      t.string :author_name
      t.decimal :price, :precision => 9, :scale => 2
      t.string :image_url
      t.string :view_url
      t.string :audio_preview_url
      t.timestamps
      t.text :description
      t.integer :volume
    end

    add_index :resources, :identifier

    create_table :resource_applications do |t|
      t.references :resource
      t.references :resourceable, :polymorphic => true
      t.string :comment
      t.integer :hits
      t.decimal :expected_payout, :precision => 9, :scale => 2
    end

    add_index :resource_applications, :resource_id
    add_index :resource_applications, [:resourceable_type, :resourceable_id], :name => "resource_applications_resourceable"
  end
end

