class CreateMeters < ActiveRecord::Migration
  def self.up
    create_table :meters do |t|
      t.string :name
      t.integer :beats
      t.integer :division
      t.timestamps
    end
  end

  def self.down
    drop_table :meters
  end
end
