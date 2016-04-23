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

ActiveRecord::Schema.define(version: 20150628034559) do

  create_table "access_tokens", force: :cascade do |t|
    t.string   "token",      limit: 255, null: false
    t.integer  "user_id",    limit: 4,   null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "authentications", force: :cascade do |t|
    t.integer  "user_id",    limit: 4,   null: false
    t.string   "provider",   limit: 255, null: false
    t.string   "uid",        limit: 255
    t.string   "name",       limit: 255
    t.string   "nickname",   limit: 255
    t.string   "image",      limit: 255
    t.string   "email",      limit: 255
    t.string   "location",   limit: 255
    t.string   "gender",     limit: 255
    t.string   "token",      limit: 255
    t.string   "secret",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "authentications", ["user_id", "provider"], name: "index_authentications_on_user_id_and_provider", unique: true, using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "comment",             limit: 65535
    t.string   "commentable_type",    limit: 255
    t.integer  "commentable_id",      limit: 4
    t.integer  "user_id",             limit: 4
    t.integer  "commentable_user_id", limit: 4
    t.integer  "like_count",          limit: 4,     default: 0
    t.string   "ip",                  limit: 255
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "comments", ["commentable_user_id"], name: "index_comments_on_commentable_user_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "photo_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "favorites", ["user_id", "photo_id"], name: "index_favorites_on_user_id_and_photo_id", unique: true, using: :btree

  create_table "images", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.string   "kind",           limit: 255
    t.string   "key",            limit: 255
    t.string   "image",          limit: 255
    t.string   "ext",            limit: 255
    t.string   "original_name",  limit: 255
    t.integer  "width",          limit: 4
    t.integer  "height",         limit: 4
    t.integer  "size",           limit: 4
    t.text     "caption",        limit: 65535
    t.string   "imageable_type", limit: 255
    t.integer  "imageable_id",   limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "images", ["key"], name: "index_images_on_key", using: :btree
  add_index "images", ["user_id"], name: "index_images_on_user_id", using: :btree

  create_table "lives", force: :cascade do |t|
    t.integer  "user_id",      limit: 4,   null: false
    t.string   "kind",         limit: 255, null: false
    t.string   "livable_type", limit: 255, null: false
    t.integer  "livable_id",   limit: 4,   null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "lives", ["user_id", "livable_type", "livable_id"], name: "i1", unique: true, using: :btree

  create_table "notifications", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "user_id",    limit: 4,     null: false
    t.integer  "town_id",    limit: 4,     null: false
    t.integer  "ward_id",    limit: 4,     null: false
    t.text     "comment",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "photos", ["town_id"], name: "index_photos_on_town_id", using: :btree
  add_index "photos", ["user_id"], name: "index_photos_on_user_id", using: :btree
  add_index "photos", ["ward_id"], name: "index_photos_on_ward_id", using: :btree

  create_table "towns", force: :cascade do |t|
    t.integer  "ward_id",    limit: 4
    t.integer  "post_num",   limit: 4,   default: 0
    t.string   "name",       limit: 255
    t.string   "roman_name", limit: 255
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.integer  "image_id",     limit: 4
    t.string   "image",        limit: 255
    t.string   "email",        limit: 255
    t.string   "access_token", limit: 255
    t.boolean  "admin_flag",   limit: 1,   default: false
    t.integer  "post_num",     limit: 4,   default: 0
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "wards", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "roman_name", limit: 255
    t.integer  "post_num",   limit: 4,   default: 0
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

end
