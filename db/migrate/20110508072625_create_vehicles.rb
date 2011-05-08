class CreateVehicles < ActiveRecord::Migration
  def self.up
    create_table :vehicles do |t|
      t.string :name
      t.string :cached_slug
      t.integer :parent_id
      t.timestamps
    end
    
    add_index :vehicles, :parent_id
    add_index :vehicles, :cached_slug, :unique => true
  end

  def self.down
    drop_table :vehicles
  end
end
