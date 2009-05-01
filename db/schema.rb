# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090302221142) do

  create_table "actors", :force => true do |t|
    t.string  "name"
    t.string  "log",                    :default => "Welcome to RockStarAlley. You are going to rock.<br>"
    t.integer "new_message",            :default => 1
    t.float   "looks",                  :default => 1.0
    t.float   "charisma",               :default => 1.0
    t.float   "skill",                  :default => 1.0
    t.float   "savvy",                  :default => 1.0
    t.integer "points_to_give",         :default => 12
    t.integer "user_id"
    t.date    "updated_at"
    t.integer "works_at",               :default => 0
    t.date    "last_pay_date"
    t.integer "consecutive_work_hours", :default => 0
    t.integer "burgers",                :default => 2
    t.integer "cash",                   :default => 100
    t.integer "has_car",                :default => 0
    t.integer "has_pet",                :default => 0
    t.integer "has_box",                :default => 0
    t.integer "has_job",                :default => 0
    t.integer "has_acct",               :default => 0
    t.integer "has_guitar",             :default => 0
    t.integer "has_apt",                :default => 0
    t.integer "fans",                   :default => 0
    t.integer "charity_bar",            :default => 0
    t.integer "has_uniform",            :default => 0
  end

  create_table "albums", :force => true do |t|
    t.string   "name"
    t.string   "dpath"
    t.text     "note"
    t.string   "gpath"
    t.boolean  "active"
    t.integer  "views"
    t.string   "spath"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "release_year"
    t.datetime "release_date"
    t.boolean  "selected"
  end

  create_table "hoods", :force => true do |t|
    t.string  "name"
    t.string  "graflink"
    t.integer "hotspot"
  end

  create_table "locations", :force => true do |t|
    t.string  "name"
    t.string  "graflink"
    t.decimal "hood_id"
    t.string  "description"
  end

  create_table "options", :force => true do |t|
    t.string  "name"
    t.string  "graflink"
    t.string  "description"
    t.string  "link"
    t.string  "location_id"
    t.string  "controller"
    t.integer "cash_price"
    t.integer "enthuse_price"
    t.integer "charisma_needed"
    t.integer "skill_needed"
    t.integer "savvy_needed"
    t.integer "looks_needed"
    t.integer "fans_needed",       :default => 0
    t.integer "car_needed",        :default => 0
    t.integer "uniform_needed",    :default => 0
    t.integer "cash_payout",       :default => 0
    t.integer "enthuse_payout",    :default => 0
    t.integer "charisma_quotient", :default => 0
    t.integer "skill_quotient",    :default => 0
    t.integer "savvy_quotient",    :default => 0
    t.integer "looks_quotient",    :default => 0
    t.integer "give_car",          :default => 0
    t.integer "give_pet",          :default => 0
    t.integer "give_box",          :default => 0
    t.integer "give_job",          :default => 0
    t.integer "give_acct",         :default => 0
    t.integer "give_guitar",       :default => 0
    t.integer "give_burger",       :default => 0
    t.integer "give_charity_bar",  :default => 0
    t.integer "give_uniform",      :default => 0
    t.integer "random_money",      :default => 0
    t.integer "random_pet",        :default => 0
    t.integer "give_fan",          :default => 0
    t.integer "random_fan",        :default => 0
    t.integer "duration",          :default => 0
    t.integer "charity_bar_price", :default => 0
    t.integer "take_point",        :default => 0
    t.integer "give_point",        :default => 0
    t.integer "take_job",          :default => 0
  end

  create_table "pages", :force => true do |t|
    t.string  "title",      :default => "RockStarAlley"
    t.string  "link"
    t.integer "linkorder"
    t.text    "body"
    t.date    "created_at"
    t.date    "updated_at"
  end

  create_table "playlists", :force => true do |t|
    t.string   "name"
    t.string   "filename"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "songs", :force => true do |t|
    t.string   "dname"
    t.string   "name"
    t.string   "filename"
    t.string   "subdir"
    t.text     "lyrics"
    t.text     "note"
    t.boolean  "has_audio"
    t.boolean  "active"
    t.integer  "views"
    t.integer  "album_id"
    t.float    "digi_qot"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "release_year"
    t.datetime "release_date"
    t.boolean  "selected"
  end

  create_table "states", :force => true do |t|
    t.string   "name",               :default => "ready"
    t.datetime "created_at"
    t.integer  "user_id"
    t.integer  "location_id",        :default => 1
    t.integer  "hood_id",            :default => 1
    t.integer  "job"
    t.integer  "current_enthusiasm", :default => 100
    t.integer  "option_id",          :default => 1
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.string   "identity_url"
  end

end
