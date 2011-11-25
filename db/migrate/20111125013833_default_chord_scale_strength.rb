class DefaultChordScaleStrength < ActiveRecord::Migration
  def change
    change_table :chord_scales do |t|
      t.change :strength, :integer, :default => 1
    end
  end
end
