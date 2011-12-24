class CreateVoiceLeadings < ActiveRecord::Migration
  def change
    create_table :voice_leadings do |t|
      t.integer :from_voicing_id
      t.integer :to_voicing_id
      t.integer :offset
      t.timestamps
    end

    add_index :voice_leadings, :from_voicing_id
    add_index :voice_leadings, :to_voicing_id
  end
end
