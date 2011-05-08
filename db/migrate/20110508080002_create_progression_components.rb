class CreateProgressionComponents < ActiveRecord::Migration
  def self.up
    create_table :progression_components do |t|
      t.integer :progression_id
      t.integer :position
      t.integer :chord_id
      t.integer :index
      t.timestamps
    end

    add_index :progression_components, :progression_id
    add_index :progression_components, :position
    add_index :progression_components, :chord_id
  end

  def self.down
    drop_table :progression_components
  end
end
