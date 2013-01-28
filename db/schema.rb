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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130128064545) do

  create_table "chats", :force => true do |t|
    t.integer  "room_id",        :null => false
    t.integer  "user_id"
    t.string   "user_name",      :null => false
    t.text     "content"
    t.string   "color",          :null => false
    t.string   "type",           :null => false
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "origin_room_id"
    t.integer  "target_room_id"
    t.string   "style"
  end

  create_table "connections", :force => true do |t|
    t.integer  "provider_id",   :null => false
    t.integer  "user_id",       :null => false
    t.string   "user_key"
    t.string   "access_token"
    t.string   "refresh_token"
    t.string   "secret"
    t.string   "name"
    t.string   "email"
    t.string   "image"
    t.text     "raw"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "connections", ["provider_id", "user_key"], :name => "idx_pi_uk_on_connections"
  add_index "connections", ["user_id"], :name => "idx_ui_on_connections"

  create_table "fortune_slips", :force => true do |t|
    t.text     "content",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "providers", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "providers", ["name"], :name => "idx_n_on_providers"

  create_table "rooms", :force => true do |t|
    t.text     "name",                           :null => false
    t.text     "content"
    t.datetime "last_arrived_at"
    t.datetime "last_left_at"
    t.integer  "members_count",   :default => 0, :null => false
    t.integer  "max_count",       :default => 0, :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name",                   :default => ""
    t.string   "image",                  :default => ""
    t.string   "email",                  :default => "",        :null => false
    t.string   "encrypted_password",     :default => "",        :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.string   "color",                  :default => "#000000", :null => false
    t.string   "type"
    t.text     "content"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
