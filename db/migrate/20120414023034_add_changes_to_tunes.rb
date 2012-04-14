class AddChangesToTunes < ActiveRecord::Migration
  def change
    change_table :tunes do |t|
      t.text :changes_json
    end
  end
end
