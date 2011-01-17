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

ActiveRecord::Schema.define(:version => 20110117051839) do

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authentications", ["user_id"], :name => "index_authentications_on_user_id"

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

  create_table "keys", :force => true do |t|
    t.string  "name"
    t.string  "long_name"
    t.boolean "primary",      :default => true
    t.integer "index"
    t.integer "letter_index"
    t.integer "cycle_index"
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

  create_table "users", :force => true do |t|
    t.string   "name"
    t.boolean  "administrator",                       :default => false
    t.string   "email",                               :default => "",    :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "",    :null => false
    t.string   "password_salt",                       :default => "",    :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

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
