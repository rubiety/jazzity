class ExtendTunesForChordsJson < ActiveRecord::Migration
  def up
    add_column :tunes, :composer, :string
    add_column :tunes, :style, :string
    remove_column :tunes, :concept
    remove_column :tunes, :vehicle_id
    drop_table :vehicles
  end

  def down
    create_table "vehicles", :force => true do |t|
      t.string   "name"
      t.integer  "parent_id"
      t.datetime "created_at", :null => false
      t.datetime "updated_at", :null => false
      t.string   "slug"
    end

    add_index "vehicles", ["parent_id"], :name => "index_vehicles_on_parent_id"
    add_index "vehicles", ["slug"], :name => "index_vehicles_on_slug"
    
    remove_column :tunes, :style
    remove_column :tunes, :composer
  end
end
