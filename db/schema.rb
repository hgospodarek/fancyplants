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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180116141945) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.integer  "plant_id"
    t.string   "name",        null: false
    t.text     "description"
    t.datetime "datetime",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["plant_id"], name: "index_events_on_plant_id", using: :btree
  end

  create_table "plants", force: :cascade do |t|
    t.string   "name",                                null: false
    t.string   "scientific_name"
    t.text     "alternate_names",        default: [],              array: true
    t.string   "description"
    t.string   "plant_type"
    t.string   "pot_type"
    t.string   "pot_size"
    t.string   "location"
    t.string   "soil"
    t.string   "fertilizer"
    t.string   "light_requirement"
    t.string   "fertilizer_requirement"
    t.string   "humidity_requirement"
    t.string   "water_requirement"
    t.string   "soil_requirement"
    t.string   "pruning_requirement"
    t.string   "temperature_range"
    t.string   "zone"
    t.string   "origin"
    t.string   "dormancy_cycle"
    t.string   "bloom_cycle"
    t.string   "propagation_method"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "user_id"
    t.string   "repotting_requirement"
    t.index ["user_id"], name: "index_plants_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "plants", "users"
end
