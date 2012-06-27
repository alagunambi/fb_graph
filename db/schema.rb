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

ActiveRecord::Schema.define(:version => 20120625171904) do

  create_table "achievements", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "image_url"
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facebooks", :force => true do |t|
    t.string   "identifier",   :limit => 20
    t.string   "access_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parcels", :force => true do |t|
    t.string   "title"
    t.text     "message"
    t.datetime "schedule"
    t.integer  "category"
    t.integer  "status"
    t.integer  "user_id"
    t.string   "to"
    t.string   "from"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscriptions", :force => true do |t|
    t.integer  "facebook_id"
    t.string   "object"
    t.string   "fields"
    t.string   "verify_token"
    t.text     "history_json"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
