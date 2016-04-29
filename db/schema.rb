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

ActiveRecord::Schema.define(version: 20160428210842) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id", using: :btree

  create_table "order_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "sock_size_id"
    t.integer  "quantity"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree
  add_index "order_items", ["sock_size_id"], name: "index_order_items_on_sock_size_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.string   "shipped"
    t.integer  "total"
    t.boolean  "complete"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "tax"
    t.integer  "subtotal"
    t.integer  "shipping"
  end

  create_table "sizes", force: :cascade do |t|
    t.string   "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sock_images", force: :cascade do |t|
    t.string   "url"
    t.integer  "sock_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  add_index "sock_images", ["sock_id"], name: "index_sock_images_on_sock_id", using: :btree

  create_table "sock_sizes", force: :cascade do |t|
    t.integer  "size_id"
    t.integer  "sock_id"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sock_sizes", ["size_id"], name: "index_sock_sizes_on_size_id", using: :btree
  add_index "sock_sizes", ["sock_id"], name: "index_sock_sizes_on_sock_id", using: :btree

  create_table "socks", force: :cascade do |t|
    t.string   "style"
    t.string   "name"
    t.integer  "price"
    t.string   "color"
    t.string   "material"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "category"
    t.text     "description"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "avatar"
    t.string   "password_digest"
    t.string   "role"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "sock_sizes"
  add_foreign_key "sock_images", "socks"
  add_foreign_key "sock_sizes", "sizes"
  add_foreign_key "sock_sizes", "socks"
end
