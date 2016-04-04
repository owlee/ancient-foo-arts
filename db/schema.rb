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

ActiveRecord::Schema.define(version: 20160401212233) do

  create_table "articles", force: :cascade do |t|
    t.string   "headline"
    t.string   "subHeadline"
    t.string   "articleType"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "postable_id"
    t.string   "postable_type"
    t.string   "thumbnail"
    t.string   "state"
    t.string   "slug"
    t.datetime "publishDate"
    t.string   "networks"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "posts", ["postable_type", "postable_id"], name: "index_posts_on_postable_type_and_postable_id"

  create_table "videos", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "title"
    t.string   "longTitle"
    t.integer  "duration"
    t.string   "url"
    t.string   "ageGate"
    t.string   "classification"
    t.string   "subClassification"
    t.boolean  "noads"
    t.boolean  "prime"
    t.boolean  "subscription"
    t.boolean  "downloadable"
    t.string   "origin"
    t.string   "genre"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

end
