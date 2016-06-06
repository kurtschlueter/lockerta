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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160601153226) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.string   "media_file_name"
    t.string   "media_content_type"
    t.integer  "media_file_size"
    t.datetime "media_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "coaches", force: :cascade do |t|
    t.string   "first_name"
    t.string   "media_file_name"
    t.string   "media_content_type"
    t.integer  "media_file_size"
    t.datetime "media_updated_at"
    t.string   "last_name"
    t.string   "alma_mater"
    t.string   "gender"
    t.integer  "wins"
    t.integer  "losses"
    t.integer  "year_started"
    t.integer  "ncaa_appearances"
    t.integer  "conference_titles"
    t.string   "recruiting_state1"
    t.string   "recruiting_state2"
    t.string   "recruiting_state3"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "program_images", force: :cascade do |t|
    t.integer  "program_id"
    t.string   "media_file_name"
    t.string   "media_content_type"
    t.integer  "media_file_size"
    t.datetime "media_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "programs", force: :cascade do |t|
    t.string   "sport"
    t.string   "gender"
    t.string   "facility_name"
    t.integer  "school_id"
    t.integer  "coach_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "coach_id"
    t.integer  "school_id"
    t.integer  "program_id"
    t.integer  "hc_player_relationships"
    t.integer  "hc_player_development"
    t.integer  "hc_recruiting"
    t.integer  "hc_pro_connections"
    t.integer  "hc_sport_knowledge"
    t.boolean  "hc_would_play_with_again"
    t.text     "hc_comments"
    t.integer  "f_main_arena"
    t.integer  "f_home_atmosphere"
    t.integer  "f_weight_room"
    t.integer  "f_locker_room"
    t.integer  "f_training_facility"
    t.text     "f_comments"
    t.integer  "l_program_tradition"
    t.integer  "l_community_interest"
    t.integer  "l_weather"
    t.integer  "l_nightlife"
    t.text     "l_comments"
    t.integer  "e_school_difficulty"
    t.integer  "e_academic_support"
    t.integer  "e_school_reputation"
    t.boolean  "e_graduated"
    t.text     "e_comments"
    t.string   "conference_rival"
    t.string   "toughest_conference_place_to_play"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.integer  "location_population"
    t.integer  "tuition"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "jersey_number"
    t.string   "position"
    t.string   "password_digest"
    t.integer  "school_id"
    t.string   "sport"
    t.boolean  "admin"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
