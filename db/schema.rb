# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110508073244) do

  create_table "chord_qualities", :force => true do |t|
    t.string "name"
    t.string "code"
  end

  create_table "chord_scales", :force => true do |t|
    t.integer "chord_id"
    t.integer "mode_id"
    t.integer "strength"
    t.text    "information"
  end

  create_table "chord_symbols", :force => true do |t|
    t.integer "chord_id"
    t.string  "name"
    t.boolean "case_sensitive", :default => false
    t.integer "strength"
    t.boolean "primary",        :default => false
  end

  create_table "chord_tones", :force => true do |t|
    t.integer "chord_id"
    t.integer "position"
    t.integer "tone"
    t.integer "letter_index"
    t.integer "strength"
    t.boolean "omitable",     :default => false
    t.text    "information"
  end

  create_table "chords", :force => true do |t|
    t.integer "chord_quality_id"
    t.integer "parent_id"
    t.string  "name"
    t.text    "synonyms"
    t.text    "information"
  end

  create_table "forms", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "keys", :force => true do |t|
    t.string  "name"
    t.string  "long_name"
    t.boolean "primary",      :default => true
    t.integer "index"
    t.integer "letter_index"
    t.integer "cycle_index"
  end

  create_table "meters", :force => true do |t|
    t.string   "name"
    t.integer  "beats"
    t.integer  "division"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "modes", :force => true do |t|
    t.integer "scale_id"
    t.integer "mode"
    t.string  "name"
    t.text    "synonyms"
    t.integer "dissonance"
  end

  create_table "scale_tones", :force => true do |t|
    t.integer "scale_id"
    t.integer "position"
    t.integer "tone"
    t.integer "letter_index"
  end

  create_table "scales", :force => true do |t|
    t.string  "name"
    t.string  "information"
    t.integer "symmetry_index"
  end

  create_table "tunes", :force => true do |t|
    t.string   "name"
    t.string   "alternate_name"
    t.integer  "vehicle_id"
    t.integer  "meter_id"
    t.integer  "key_id"
    t.integer  "secondary_key_id"
    t.string   "tonality",                   :default => "Major"
    t.string   "concept",                    :default => "Instrumental"
    t.integer  "form_id"
    t.integer  "form_length"
    t.string   "form_lengths"
    t.integer  "starting_chord_id"
    t.integer  "ending_chord_id"
    t.integer  "contrafact_of_tune_id"
    t.integer  "tempo"
    t.integer  "aebersold_playalong_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tunes", ["aebersold_playalong_number"], :name => "index_tunes_on_aebersold_playalong_number"
  add_index "tunes", ["form_id"], :name => "index_tunes_on_form_id"
  add_index "tunes", ["key_id"], :name => "index_tunes_on_key_id"
  add_index "tunes", ["meter_id"], :name => "index_tunes_on_meter_id"
  add_index "tunes", ["secondary_key_id"], :name => "index_tunes_on_secondary_key_id"
  add_index "tunes", ["vehicle_id"], :name => "index_tunes_on_vehicle_id"

  create_table "vehicles", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vehicles", ["parent_id"], :name => "index_vehicles_on_parent_id"

  create_table "voicing_tones", :force => true do |t|
    t.integer "voicings_id"
    t.integer "position"
    t.integer "tone"
    t.integer "tone_reference_offset", :default => 0
    t.text    "information"
  end

  create_table "voicings", :force => true do |t|
    t.integer "chord_id"
    t.string  "name"
    t.text    "information"
  end

end
