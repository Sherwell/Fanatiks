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

ActiveRecord::Schema.define(version: 20161214232722) do

  create_table "group_teams", force: :cascade do |t|
    t.integer  "pj",         limit: 4
    t.integer  "pg",         limit: 4
    t.integer  "pe",         limit: 4
    t.integer  "pp",         limit: 4
    t.integer  "gf",         limit: 4
    t.integer  "gc",         limit: 4
    t.integer  "dif",        limit: 4
    t.integer  "pts",        limit: 4
    t.integer  "group_id",   limit: 4
    t.integer  "team_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "group_teams", ["group_id"], name: "index_group_teams_on_group_id", using: :btree
  add_index "group_teams", ["team_id"], name: "index_group_teams_on_team_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "position",      limit: 4
    t.integer  "tournament_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "groups", ["tournament_id"], name: "index_groups_on_tournament_id", using: :btree

  create_table "leagues", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "logo",       limit: 255
    t.boolean  "active"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "sport_id",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "leagues", ["sport_id"], name: "index_leagues_on_sport_id", using: :btree

  create_table "sports", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "image",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "logo",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tournaments", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "year",       limit: 4
    t.integer  "league_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "tournaments", ["league_id"], name: "index_tournaments_on_league_id", using: :btree

  add_foreign_key "group_teams", "groups"
  add_foreign_key "group_teams", "teams"
  add_foreign_key "groups", "tournaments"
  add_foreign_key "leagues", "sports"
  add_foreign_key "tournaments", "leagues"
end
