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

ActiveRecord::Schema.define(version: 20170327165756) do

  create_table "headings", force: :cascade do |t|
    t.string   "text"
    t.string   "name"
    t.integer  "page_index_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["name"], name: "index_headings_on_name"
    t.index ["page_index_id"], name: "index_headings_on_page_index_id"
    t.index ["text"], name: "index_headings_on_text"
  end

  create_table "links", force: :cascade do |t|
    t.string   "text"
    t.string   "url"
    t.integer  "page_index_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["page_index_id"], name: "index_links_on_page_index_id"
    t.index ["text"], name: "index_links_on_text"
    t.index ["url"], name: "index_links_on_url"
  end

  create_table "page_indices", force: :cascade do |t|
    t.string   "url"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["url"], name: "index_page_indices_on_url"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password_hash"
    t.string   "salt"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["name"], name: "index_users_on_name"
  end

end
