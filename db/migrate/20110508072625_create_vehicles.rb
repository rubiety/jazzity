class CreateVehicles < ActiveRecord::Migration
  def self.up
    create_table :vehicles do |t|
      t.string :name
      t.integer :parent_id
      t.timestamps
    end
    
    add_index :vehicles, :parent_id
  end

  def self.down
    drop_table :vehicles
  end
end
