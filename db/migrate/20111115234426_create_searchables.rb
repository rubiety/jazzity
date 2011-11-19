class CreateSearchables < ActiveRecord::Migration
  def change
    create_table :searchables do |t|
      t.integer :parent_id
      t.string :name
      t.string :display_name
      t.string :model_type
      t.string :model_id
      t.references :key
      t.integer :priority, :default => 1, :null => false
    end

    add_index :searchables, :parent_id
    add_index :searchables, :name
  end
end
