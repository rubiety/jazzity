# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20150104200448) do

  create_table "chord_qualities", :force => true do |t|
    t.string "name"
    t.string "code"
    t.string "slug"
  end

  add_index "chord_qualities", ["slug"], :name => "index_chord_qualities_on_slug"

  create_table "chord_scales", :force => true do |t|
    t.integer  "chord_id"
    t.integer  "mode_id"
    t.integer  "offset",      :default => 0, :null => false
    t.integer  "strength",    :default => 1
    t.text     "information"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "chord_scales", ["chord_id"], :name => "index_chord_scales_on_chord_id"
  add_index "chord_scales", ["mode_id"], :name => "index_chord_scales_on_mode_id"

  create_table "chord_symbols", :force => true do |t|
    t.integer  "chord_id"
    t.string   "name"
    t.boolean  "case_sensitive", :default => false
    t.integer  "strength"
    t.boolean  "primary",        :default => false
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  add_index "chord_symbols", ["chord_id"], :name => "index_chord_symbols_on_chord_id"
  add_index "chord_symbols", ["name"], :name => "index_chord_symbols_on_name"

  create_table "chords", :force => true do |t|
    t.integer  "chord_quality_id"
    t.integer  "parent_id"
    t.string   "name"
    t.text     "synonyms"
    t.text     "information"
    t.string   "tone_values",       :limit => 4000
    t.integer  "chord_tones_count",                 :default => 0
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
    t.string   "slug"
  end

  add_index "chords", ["chord_quality_id"], :name => "index_chords_on_chord_quality_id"
  add_index "chords", ["parent_id"], :name => "index_chords_on_parent_id"
  add_index "chords", ["slug"], :name => "index_chords_on_slug"

  create_table "forms", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "slug"
  end

  add_index "forms", ["slug"], :name => "index_forms_on_slug"

  create_table "meters", :force => true do |t|
    t.string   "name"
    t.integer  "beats"
    t.integer  "division"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "slug"
  end

  add_index "meters", ["slug"], :name => "index_meters_on_slug"

  create_table "modes", :force => true do |t|
    t.integer  "scale_id"
    t.integer  "mode"
    t.string   "name"
    t.text     "synonyms"
    t.integer  "dissonance"
    t.text     "information"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "slug"
  end

  add_index "modes", ["mode"], :name => "index_modes_on_mode"
  add_index "modes", ["scale_id"], :name => "index_modes_on_scale_id"
  add_index "modes", ["slug"], :name => "index_modes_on_slug"

  create_table "progression_components", :force => true do |t|
    t.integer  "progression_id"
    t.integer  "position"
    t.integer  "chord_id"
    t.integer  "index"
    t.string   "comment"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "progression_components", ["chord_id"], :name => "index_progression_components_on_chord_id"
  add_index "progression_components", ["position"], :name => "index_progression_components_on_position"
  add_index "progression_components", ["progression_id"], :name => "index_progression_components_on_progression_id"

  create_table "progression_families", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "slug"
  end

  add_index "progression_families", ["slug"], :name => "index_progression_families_on_slug"

  create_table "progressions", :force => true do |t|
    t.integer  "progression_family_id"
    t.string   "name"
    t.integer  "variant_of_id"
    t.integer  "bars"
    t.integer  "positions_per_bar",     :default => 4
    t.boolean  "full_tune",             :default => false
    t.integer  "meter_id"
    t.integer  "form_id"
    t.string   "summary"
    t.text     "information"
    t.boolean  "seeding",               :default => false
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.string   "slug"
  end

  add_index "progressions", ["meter_id"], :name => "index_progressions_on_meter_id"
  add_index "progressions", ["progression_family_id"], :name => "index_progressions_on_progression_family_id"
  add_index "progressions", ["slug"], :name => "index_progressions_on_slug"

  create_table "scales", :force => true do |t|
    t.string   "name"
    t.string   "information"
    t.integer  "symmetry_index"
    t.string   "tone_values",    :limit => 4000
    t.integer  "tones_count",                    :default => 0
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.string   "slug"
  end

  add_index "scales", ["slug"], :name => "index_scales_on_slug"

  create_table "searchables", :force => true do |t|
    t.integer "parent_id"
    t.string  "name"
    t.string  "display_name"
    t.string  "model_type"
    t.integer "model_id"
    t.string  "key_name",     :limit => 3
    t.integer "priority",                  :default => 1, :null => false
  end

  add_index "searchables", ["key_name"], :name => "index_searchables_on_key_name"
  add_index "searchables", ["model_type", "model_id"], :name => "index_searchables_on_model_type_and_model_id"
  add_index "searchables", ["name"], :name => "index_searchables_on_name"
  add_index "searchables", ["parent_id"], :name => "index_searchables_on_parent_id"

  create_table "tune_progressions", :force => true do |t|
    t.integer  "tune_id"
    t.integer  "progression_id"
    t.string   "comment"
    t.integer  "start_measure"
    t.integer  "end_measure"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "tune_progressions", ["progression_id"], :name => "index_tune_progressions_on_progression_id"
  add_index "tune_progressions", ["tune_id"], :name => "index_tune_progressions_on_tune_id"

  create_table "tunes", :force => true do |t|
    t.string   "name"
    t.string   "alternate_name"
    t.integer  "based_on_progression_id"
    t.integer  "meter_id"
    t.string   "primary_key_name",           :limit => 3
    t.string   "secondary_key_name",         :limit => 3
    t.string   "tonality",                                :default => "Major"
    t.integer  "form_id"
    t.integer  "form_length"
    t.string   "form_lengths"
    t.integer  "starting_chord_id"
    t.integer  "ending_chord_id"
    t.integer  "contrafact_of_tune_id"
    t.integer  "tempo"
    t.integer  "aebersold_playalong_number"
    t.text     "description"
    t.boolean  "seeding",                                 :default => false
    t.boolean  "featured",                                :default => false
    t.datetime "created_at",                                                   :null => false
    t.datetime "updated_at",                                                   :null => false
    t.string   "slug"
    t.text     "changes_json"
    t.string   "composer"
    t.string   "style"
  end

  add_index "tunes", ["aebersold_playalong_number"], :name => "index_tunes_on_aebersold_playalong_number"
  add_index "tunes", ["form_id"], :name => "index_tunes_on_form_id"
  add_index "tunes", ["meter_id"], :name => "index_tunes_on_meter_id"
  add_index "tunes", ["primary_key_name"], :name => "index_tunes_on_primary_key_name"
  add_index "tunes", ["secondary_key_name"], :name => "index_tunes_on_secondary_key_name"
  add_index "tunes", ["slug"], :name => "index_tunes_on_slug"

  create_table "voice_leadings", :force => true do |t|
    t.integer  "from_voicing_id"
    t.integer  "to_voicing_id"
    t.integer  "offset"
    t.integer  "changed_tones",   :default => 1
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "voice_leadings", ["from_voicing_id"], :name => "index_voice_leadings_on_from_voicing_id"
  add_index "voice_leadings", ["to_voicing_id"], :name => "index_voice_leadings_on_to_voicing_id"

  create_table "voicing_families", :force => true do |t|
    t.string   "name"
    t.integer  "voicing_tones_count", :default => 0
    t.boolean  "rootless",            :default => false
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "slug"
  end

  add_index "voicing_families", ["slug"], :name => "index_voicing_families_on_slug"

  create_table "voicings", :force => true do |t|
    t.integer  "voicing_family_id"
    t.integer  "chord_id"
    t.integer  "parent_id"
    t.boolean  "rootless",                                     :default => false
    t.string   "name"
    t.integer  "octave_offset",                                :default => 0
    t.text     "information"
    t.integer  "voicing_tones_count",                          :default => 0
    t.integer  "upper_structure_chord_id"
    t.integer  "upper_structure_chord_offset",                 :default => 0
    t.string   "tone_values",                  :limit => 4000
    t.datetime "created_at",                                                      :null => false
    t.datetime "updated_at",                                                      :null => false
    t.string   "slug"
  end

  add_index "voicings", ["chord_id"], :name => "index_voicings_on_chord_id"
  add_index "voicings", ["slug"], :name => "index_voicings_on_slug"
  add_index "voicings", ["voicing_family_id"], :name => "index_voicings_on_voicing_family_id"

end
