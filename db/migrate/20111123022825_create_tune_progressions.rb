class CreateTuneProgressions < ActiveRecord::Migration
  def change
    change_table :tunes do |t|
      t.integer :based_on_progression_id
    end
    
    create_table :tune_progressions do |t|
      t.references :tune
      t.references :progression
      t.string :notes
      t.integer :start_measure
      t.integer :end_measure
      t.timestamps
    end
  end
end
