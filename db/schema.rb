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

ActiveRecord::Schema.define(version: 20150505175419) do

  create_table "clicks", force: :cascade do |t|
    t.integer  "link_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "clicks", ["link_id"], name: "index_clicks_on_link_id"

  create_table "links", force: :cascade do |t|
    t.string   "identifier"
    t.string   "url"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "click_count",  default: 0
    t.integer  "clicks_count", default: 0
  end

end
