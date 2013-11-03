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

ActiveRecord::Schema.define(version: 20131103015047) do

  create_table "comments", force: true do |t|
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "commenter_id"
    t.string   "commenter_type"
    t.string   "role"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_type", "commentable_id", "role"], name: "index_comments_on_commentable_type_and_commentable_id_and_role", using: :btree
  add_index "comments", ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id", using: :btree

  create_table "emotions", force: true do |t|
    t.integer  "emotional_id"
    t.string   "emotional_type"
    t.integer  "emotive_id"
    t.string   "emotive_type"
    t.string   "emotion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "emotions", ["emotional_type", "emotional_id", "emotive_type", "emotive_id", "emotion"], name: "index_emotions_by_emotional_emotive_and_emotion", unique: true, using: :btree
  add_index "emotions", ["emotional_type", "emotional_id", "emotive_type", "emotive_id"], name: "index_emotions_by_emotional_and_emotive", using: :btree
  add_index "emotions", ["emotive_type", "emotive_id", "emotion"], name: "index_emotions_by_emotive", using: :btree

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "url"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "comments_count"
    t.integer  "like_emotions_count"
    t.integer  "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
