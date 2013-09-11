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

ActiveRecord::Schema.define(version: 20130911023343) do

  create_table "divisions", force: true do |t|
    t.integer  "league_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "divisions", ["league_id"], name: "index_divisions_on_league_id", using: :btree
  add_index "divisions", ["name"], name: "index_divisions_on_name", using: :btree

  create_table "leagues", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "leagues", ["name"], name: "index_leagues_on_name", using: :btree

  create_table "player_teams", force: true do |t|
    t.integer  "player_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "player_teams", ["player_id", "team_id"], name: "index_player_teams_on_player_id_and_team_id", unique: true, using: :btree

  create_table "players", force: true do |t|
    t.string   "surname"
    t.string   "given_name"
    t.string   "position"
    t.integer  "at_bats"
    t.integer  "caught_stealing"
    t.integer  "doubles"
    t.integer  "errors"
    t.integer  "games"
    t.integer  "games_started"
    t.integer  "hit_by_pitch"
    t.integer  "hits"
    t.integer  "home_runs"
    t.integer  "pb"
    t.integer  "rbi"
    t.integer  "runs"
    t.integer  "sacrifice_flies"
    t.integer  "sacrifice_hits"
    t.integer  "steals"
    t.integer  "struck_out"
    t.integer  "triples"
    t.integer  "walks"
    t.float    "ops"
    t.float    "batting_average"
    t.integer  "stolen_bases"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "players", ["batting_average"], name: "index_players_on_batting_average", using: :btree
  add_index "players", ["home_runs"], name: "index_players_on_home_runs", using: :btree
  add_index "players", ["ops"], name: "index_players_on_ops", using: :btree
  add_index "players", ["rbi"], name: "index_players_on_rbi", using: :btree
  add_index "players", ["runs"], name: "index_players_on_runs", using: :btree
  add_index "players", ["stolen_bases"], name: "index_players_on_stolen_bases", using: :btree

  create_table "stats", force: true do |t|
    t.integer  "player_id"
    t.integer  "year"
    t.integer  "at_bats"
    t.integer  "caught_stealing"
    t.integer  "doubles"
    t.integer  "errors"
    t.integer  "games"
    t.integer  "games_started"
    t.integer  "hit_by_pitch"
    t.integer  "hits"
    t.integer  "home_runs"
    t.integer  "pb"
    t.integer  "rbi"
    t.integer  "runs"
    t.integer  "sacrifice_flies"
    t.integer  "sacrifice_hits"
    t.integer  "steals"
    t.integer  "struck_out"
    t.integer  "triples"
    t.integer  "walks"
    t.float    "ops"
    t.float    "batting_average"
    t.integer  "stolen_bases"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stats", ["batting_average"], name: "index_stats_on_batting_average", using: :btree
  add_index "stats", ["home_runs"], name: "index_stats_on_home_runs", using: :btree
  add_index "stats", ["ops"], name: "index_stats_on_ops", using: :btree
  add_index "stats", ["player_id"], name: "index_stats_on_player_id", using: :btree
  add_index "stats", ["rbi"], name: "index_stats_on_rbi", using: :btree
  add_index "stats", ["runs"], name: "index_stats_on_runs", using: :btree
  add_index "stats", ["stolen_bases"], name: "index_stats_on_stolen_bases", using: :btree
  add_index "stats", ["year"], name: "index_stats_on_year", using: :btree

  create_table "teams", force: true do |t|
    t.string   "name"
    t.string   "city"
    t.integer  "division_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teams", ["city"], name: "index_teams_on_city", using: :btree
  add_index "teams", ["division_id"], name: "index_teams_on_division_id", using: :btree
  add_index "teams", ["name"], name: "index_teams_on_name", using: :btree

end
