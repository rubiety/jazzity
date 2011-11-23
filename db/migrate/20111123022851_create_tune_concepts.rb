class CreateTuneConcepts < ActiveRecord::Migration
  def change
    create_table :tune_concepts do |t|
      t.references :tune
      t.references :concept
      t.string :notes
      t.integer :start_measure
      t.integer :end_measure
      t.timestamps
    end
  end
end
