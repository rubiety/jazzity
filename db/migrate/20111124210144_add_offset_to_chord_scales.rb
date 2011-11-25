class AddOffsetToChordScales < ActiveRecord::Migration
  def change
    change_table :chord_scales do |t|
      t.integer :offset, :default => 0, :null => false
    end
  end
end
