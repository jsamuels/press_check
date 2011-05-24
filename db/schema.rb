# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090721203850) do

  create_table "control_bar_patches", :force => true do |t|
    t.integer  "control_bar_id"
    t.string   "row"
    t.string   "column"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "control_bars", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "devices", :force => true do |t|
    t.integer  "member_id"
    t.string   "location"
    t.string   "name"
    t.string   "make"
    t.string   "model"
    t.string   "serial_number"
    t.string   "kind"
    t.integer  "active",        :default => 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", :force => true do |t|
    t.integer  "member_id"
    t.integer  "standard_id"
    t.integer  "control_bar_id"
    t.string   "job_name"
    t.string   "job_number"
    t.string   "customer"
    t.string   "event"
    t.string   "printing_process"
    t.string   "printing_type"
    t.string   "substrate"
    t.string   "ink_manufacturer"
    t.string   "inkset"
    t.string   "plate"
    t.string   "plate_curve"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "member_preferences", :force => true do |t|
    t.integer  "member_id"
    t.string   "pref"
    t.text     "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patch_standards", :force => true do |t|
    t.integer  "standard_id"
    t.string   "patch"
    t.float    "spectral_1"
    t.float    "spectral_2"
    t.float    "spectral_3"
    t.float    "spectral_4"
    t.float    "spectral_5"
    t.float    "spectral_6"
    t.float    "spectral_7"
    t.float    "spectral_8"
    t.float    "spectral_9"
    t.float    "spectral_10"
    t.float    "spectral_11"
    t.float    "spectral_12"
    t.float    "spectral_13"
    t.float    "spectral_14"
    t.float    "spectral_15"
    t.float    "spectral_16"
    t.float    "spectral_17"
    t.float    "spectral_18"
    t.float    "spectral_19"
    t.float    "spectral_20"
    t.float    "spectral_21"
    t.float    "spectral_22"
    t.float    "spectral_23"
    t.float    "spectral_24"
    t.float    "spectral_25"
    t.float    "spectral_26"
    t.float    "spectral_27"
    t.float    "spectral_28"
    t.float    "spectral_29"
    t.float    "spectral_30"
    t.float    "spectral_31"
    t.float    "spectral_32"
    t.float    "spectral_33"
    t.float    "spectral_34"
    t.float    "spectral_35"
    t.float    "spectral_36"
    t.float    "density"
    t.float    "dot_gain"
    t.float    "print_contrast"
    t.float    "l"
    t.float    "a"
    t.float    "b"
    t.float    "c"
    t.float    "h"
    t.float    "r"
    t.float    "g"
    t.float    "g7_hg"
    t.float    "g7_hr"
    t.float    "g7_sc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "readings", :force => true do |t|
    t.integer  "sheet_id"
    t.integer  "control_bar_id"
    t.string   "patch"
    t.string   "row"
    t.string   "column"
    t.float    "de"
    t.float    "spectral_1"
    t.float    "spectral_2"
    t.float    "spectral_3"
    t.float    "spectral_4"
    t.float    "spectral_5"
    t.float    "spectral_6"
    t.float    "spectral_7"
    t.float    "spectral_8"
    t.float    "spectral_9"
    t.float    "spectral_10"
    t.float    "spectral_11"
    t.float    "spectral_12"
    t.float    "spectral_13"
    t.float    "spectral_14"
    t.float    "spectral_15"
    t.float    "spectral_16"
    t.float    "spectral_17"
    t.float    "spectral_18"
    t.float    "spectral_19"
    t.float    "spectral_20"
    t.float    "spectral_21"
    t.float    "spectral_22"
    t.float    "spectral_23"
    t.float    "spectral_24"
    t.float    "spectral_25"
    t.float    "spectral_26"
    t.float    "spectral_27"
    t.float    "spectral_28"
    t.float    "spectral_29"
    t.float    "spectral_30"
    t.float    "spectral_31"
    t.float    "spectral_32"
    t.float    "spectral_33"
    t.float    "spectral_34"
    t.float    "spectral_35"
    t.float    "spectral_36"
    t.float    "density"
    t.float    "dot_gain"
    t.float    "print_contrast"
    t.float    "l"
    t.float    "a"
    t.float    "b"
    t.float    "c"
    t.float    "h"
    t.float    "r"
    t.float    "g"
    t.float    "g7_hg"
    t.float    "g7_hr"
    t.float    "g7_sc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "sheets", :force => true do |t|
    t.integer  "device_id"
    t.integer  "job_id"
    t.string   "press_speed"
    t.string   "operator"
    t.string   "shift"
    t.string   "sheet_number"
    t.integer  "make_ready"
    t.string   "spectro_device"
    t.string   "spectro_serialnum"
    t.string   "control_bar_zone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "standards", :force => true do |t|
    t.string   "name"
    t.string   "version"
    t.binary   "icc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tolerances", :force => true do |t|
    t.integer  "member_id"
    t.string   "name"
    t.string   "patch"
    t.float    "de"
    t.float    "spectral_1"
    t.float    "spectral_2"
    t.float    "spectral_3"
    t.float    "spectral_4"
    t.float    "spectral_5"
    t.float    "spectral_6"
    t.float    "spectral_7"
    t.float    "spectral_8"
    t.float    "spectral_9"
    t.float    "spectral_10"
    t.float    "spectral_11"
    t.float    "spectral_12"
    t.float    "spectral_13"
    t.float    "spectral_14"
    t.float    "spectral_15"
    t.float    "spectral_16"
    t.float    "spectral_17"
    t.float    "spectral_18"
    t.float    "spectral_19"
    t.float    "spectral_20"
    t.float    "spectral_21"
    t.float    "spectral_22"
    t.float    "spectral_23"
    t.float    "spectral_24"
    t.float    "spectral_25"
    t.float    "spectral_26"
    t.float    "spectral_27"
    t.float    "spectral_28"
    t.float    "spectral_29"
    t.float    "spectral_30"
    t.float    "spectral_31"
    t.float    "spectral_32"
    t.float    "spectral_33"
    t.float    "spectral_34"
    t.float    "spectral_35"
    t.float    "spectral_36"
    t.float    "density"
    t.float    "dot_gain"
    t.float    "print_contrast"
    t.float    "l"
    t.float    "a"
    t.float    "b"
    t.float    "c"
    t.float    "h"
    t.float    "r"
    t.float    "g"
    t.float    "g7_hg"
    t.float    "g7_hr"
    t.float    "g7_sc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_preferences", :force => true do |t|
    t.integer  "user_id"
    t.string   "pref"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.integer  "member_id"
    t.string   "name"
    t.string   "hashed_password"
    t.string   "salt"
    t.integer  "level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
