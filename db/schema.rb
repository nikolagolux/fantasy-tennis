# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_09_04_205025) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_gems", force: :cascade do |t|
    t.bigint "game_set_id", null: false
    t.bigint "match_id", null: false
    t.boolean "is_first_player_win"
    t.string "first_player_points"
    t.string "second_player_points"
    t.boolean "is_first_player_serve"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_set_id"], name: "index_game_gems_on_game_set_id"
    t.index ["match_id"], name: "index_game_gems_on_match_id"
  end

  create_table "game_points", force: :cascade do |t|
    t.bigint "game_gem_id", null: false
    t.bigint "game_set_id", null: false
    t.bigint "match_id", null: false
    t.boolean "is_first_player_win"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "current_first_player_points"
    t.string "current_second_player_points"
    t.index ["game_gem_id"], name: "index_game_points_on_game_gem_id"
    t.index ["game_set_id"], name: "index_game_points_on_game_set_id"
    t.index ["match_id"], name: "index_game_points_on_match_id"
  end

  create_table "game_sets", force: :cascade do |t|
    t.bigint "match_id", null: false
    t.boolean "is_first_player_win"
    t.integer "first_player_gems"
    t.integer "second_player_gems"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["match_id"], name: "index_game_sets_on_match_id"
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "first_player_id", null: false
    t.bigint "second_player_id", null: false
    t.datetime "match_datetime"
    t.boolean "is_match_started"
    t.boolean "is_match_finished"
    t.boolean "is_first_player_win"
    t.boolean "is_first_player_surrender"
    t.boolean "is_second_player_surrender"
    t.integer "first_player_sets"
    t.integer "second_player_sets"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["first_player_id"], name: "index_matches_on_first_player_id"
    t.index ["second_player_id"], name: "index_matches_on_second_player_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "category"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "game_gems", "game_sets"
  add_foreign_key "game_gems", "matches"
  add_foreign_key "game_points", "game_gems"
  add_foreign_key "game_points", "game_sets"
  add_foreign_key "game_points", "matches"
  add_foreign_key "game_sets", "matches"
  add_foreign_key "matches", "users", column: "first_player_id"
  add_foreign_key "matches", "users", column: "second_player_id"
end
