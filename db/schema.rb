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

ActiveRecord::Schema.define(:version => 20110813013250) do

  create_table "ballots", :force => true do |t|
    t.integer  "vote"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bills", :force => true do |t|
    t.integer  "bill_number"
    t.integer  "house"
    t.integer  "bill_type"
    t.string   "long_title"
    t.string   "short_title"
    t.text     "preamble"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "confidence"
  end

  create_table "enactments", :force => true do |t|
    t.integer  "enactment_type"
    t.datetime "enacting_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "house_groups", :force => true do |t|
    t.integer  "side"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "house_sessions", :force => true do |t|
    t.integer  "legislature"
    t.integer  "session"
    t.datetime "opening"
    t.datetime "ending"
    t.integer  "seatcount"
    t.boolean  "dissolved"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "members", ["email"], :name => "index_members_on_email", :unique => true
  add_index "members", ["reset_password_token"], :name => "index_members_on_reset_password_token", :unique => true

  create_table "messages", :force => true do |t|
    t.string   "subject"
    t.text     "body"
    t.string   "special"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
  end

  create_table "motions", :force => true do |t|
    t.integer  "motion_number"
    t.text     "body"
    t.boolean  "confidence"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.string   "style"
    t.text     "text"
    t.datetime "enacting_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parties", :force => true do |t|
    t.string   "short_name"
    t.string   "long_name"
    t.string   "letters"
    t.integer  "seats"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "provisions", :force => true do |t|
    t.integer  "article"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "in_effect"
  end

  create_table "roles", :force => true do |t|
    t.string   "long_name"
    t.string   "short_name"
    t.integer  "access_level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "senates", :force => true do |t|
    t.integer  "seatcount"
    t.integer  "liberal_senators"
    t.integer  "tory_senators"
    t.integer  "independent_senators"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stages", :force => true do |t|
    t.integer  "reading"
    t.datetime "last_movement"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tallies", :force => true do |t|
    t.integer  "yeas"
    t.integer  "nays"
    t.integer  "abstains"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "reading"
  end

  create_table "transactions", :force => true do |t|
    t.string   "item"
    t.integer  "type"
    t.decimal  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wallets", :force => true do |t|
    t.integer  "popularity"
    t.decimal  "cash"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
