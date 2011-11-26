class ChangeNotesToComment < ActiveRecord::Migration
  def change
    rename_column :musician_favorites, :notes, :comment
    rename_column :progression_components, :notes, :comment
    rename_column :tune_concepts, :notes, :comment
    rename_column :tune_progressions, :notes, :comment
  end
end
