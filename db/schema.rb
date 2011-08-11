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

ActiveRecord::Schema.define(:version => 20110811085143) do

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
  end

  create_table "legislative_sessions", :force => true do |t|
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
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "password"
    t.string   "email"
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

  create_table "vote_histories", :force => true do |t|
    t.integer  "yeas"
    t.integer  "nays"
    t.integer  "abstains"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
