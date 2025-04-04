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

ActiveRecord::Schema[8.0].define(version: 2025_04_04_141748) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "cached_pokemons", force: :cascade do |t|
    t.string "name"
    t.jsonb "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "name"
    t.integer "poke_id"
    t.string "types", default: [], array: true
    t.integer "height"
    t.integer "weight"
    t.string "sprite_url"
    t.jsonb "stats"
    t.string "abilities", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "fetched_time"
    t.text "description"
    t.string "species"
    t.string "habitat"
    t.boolean "is_legendary"
    t.boolean "is_mythical"
    t.integer "capture_rate"
    t.integer "base_happiness"
    t.string "shape"
    t.string "growth_rate"
    t.string "color"
    t.text "egg_groups"
    t.string "gender_ratio"
    t.string "generation"
  end

  create_table "team_members", force: :cascade do |t|
    t.string "name"
    t.integer "pokemon_id"
    t.bigint "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "types"
    t.index ["team_id"], name: "index_team_members_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "team_number"
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "team_members", "teams"
  add_foreign_key "teams", "users"
end
